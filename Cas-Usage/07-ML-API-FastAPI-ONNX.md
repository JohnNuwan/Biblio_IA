# 🛠️ Créer des APIs ML Robustes : FastAPI + ONNX

## 🌍 Contexte & Enjeux
La mise en production (MLOps) est souvent le goulot d'étranglement des projets d'IA. Un modèle qui tourne dans un Notebook Jupyter n'est pas un produit. L'enjeu est de servir des prédictions à haute fréquence, avec une faible latence et sans exploser les coûts d'infrastructure. Le standard actuel délaisse les serveurs lourds Flask/PyTorch au profit de microservices légers et asynchrones, optimisés pour l'inférence plutôt que l'entraînement.

Déployer un modèle de Machine Learning en production est souvent plus dur que de l'entraîner.
Le standard de l'industrie en 2025 pour les microservices ML est le duo : **FastAPI** (Web) + **ONNX** (Inférence Universelle).

---

## Pourquoi ce duo ?

1.  **FastAPI** : C'est le framework Python le plus rapide. Il gère l'asynchrone nativement (utile pour les modèles qui bloquent le CPU) et génère la documentation Swagger automatiquement.
2.  **ONNX (Open Neural Network Exchange)** : C'est un format de fichier standard.
    *   Vous entraînez en PyTorch (`.pt`).
    *   Vous exportez en ONNX (`.onnx`).
    *   **Avantaqe** : ONNX Runtime est souvent **2x à 10x plus rapide** que PyTorch pur pour l'inférence CPU. Plus besoin de dépendances lourdes (PyTorch pèse 800Mo, ONNX Runtime pèse 10Mo).

---

## Le Code (Tutoriel Express)

### 1. Export du Modèle (Exemple Scikit-Learn ou PyTorch)

```python
# Exemple fictif d'export
import torch
import torch.onnx

model = MyModel()
dummy_input = torch.randn(1, 3, 224, 224)
torch.onnx.export(model, dummy_input, "model.onnx")
```

### 2. L'API FastAPI

Créez `api.py` :

```python
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import onnxruntime as ort
import numpy as np

app = FastAPI(title="ML Inference API")

# Charger le modèle ONNX au démarrage (Une seule fois !)
session = ort.InferenceSession("model.onnx")
input_name = session.get_inputs()[0].name

class PredictionRequest(BaseModel):
    features: list[float]

@app.post("/predict")
async def predict(request: PredictionRequest):
    try:
        # Prétraitement
        data = np.array([request.features], dtype=np.float32)
        
        # Inférence ONNX (Fulgurant)
        result = session.run(None, {input_name: data})
        
        # Post-traitement
        prediction = float(result[0][0])
        
        return {"prediction": prediction, "status": "success"}
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# Lancer avec : uvicorn api:app --reload
```

---

## Bonnes Pratiques de Pro

1.  **Batching** : Si vous avez beaucoup de trafic, ne traitez pas les requêtes une par une. Utilisez un "Batcher" (comme BentoML) pour grouper 10 requêtes et les envoyer au GPU en un coup.
2.  **Docker** : FastAPI + ONNX tient dans un conteneur Docker "Slim" de <200Mb. Facile à déployer sur Kubernetes ou Cloud Run.
3.  **Versioning** : Nommez vos API `/v1/predict`. Le jour où le modèle change, créez `/v2/predict`.

---

## 🏢 Ils l'utilisent déjà

*   **Hugging Face** : Leur "Inference Endpoint" utilise massivement ONNX Runtime pour servir des milliers de modèles différents avec une latence minimale.
*   **Microsoft** : Utilise ONNX dans Windows (Windows ML) pour faire tourner l'IA localement sur votre PC sans vider la batterie (optimisation NPU).
*   **Snapchat** : Utilise des modèles optimisés pour appliquer des filtres AR en temps réel sur mobile (optimisation extrême requise).

## Conclusion
Ne mettez jamais un modèle `.pickle` ou PyTorch brut en production si vous cherchez la performance. **Convertissez tout en ONNX**.
C'est le "MP3" du Machine Learning : universel, léger, rapide.
