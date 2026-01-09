# 07 - Local LLM : Faire tourner l'IA sur votre PC avec Ollama

![Local AI Privacy Shield](..\assets\images\local-ai.png)

Pourquoi payer des API et envoyer vos données confidentielles dans le Cloud quand vous pouvez avoir un "GPT-4 Light" (Llama 3, Mistral) qui tourne directement sur votre ordinateur, gratuitement et hors-ligne ?

---

## 1. Pourquoi le Local ?

| Avantage | Description |
| :--- | :--- |
| **🔒 Confidentialité** | Vos données ne quittent jamais votre machine. Idéal pour données médicales, juridiques ou code source propriétaire. |
| **💸 Gratuité** | Zéro coût par token. Vous ne payez que l'électricité. |
| **⚡ Latence** | Pas d'appel réseau. La vitesse dépend uniquement de votre carte graphique (GPU). |
| **🔧 Liberté** | Aucune censure (sur certains modèles) et contrôle total des paramètres. |

---

## 2. L'Outil Roi : Ollama

Ollama est le "Docker des LLMs". C'est un outil en ligne de commande ultra-simple pour Linux, Mac et Windows.

### Installation
Allez sur [ollama.com](https://ollama.com) et téléchargez l'installateur.

### Lancer un modèle
Ouvrez votre terminal (PowerShell ou Cmd) et tapez :

```bash
ollama run llama3
```

C'est tout. Ollama va télécharger le modèle (environ 4 Go) et lancer un chat interactif.

---

## 3. Les Modèles à connaitre

Ne cherchez pas "GPT-4" ici, ce sont des modèles "Open Weights".

*   **Llama 3 (8B)** : Le champion de Meta. Rapide, intelligent, polyvalent. Le standard actuel.
*   **Mistral (7B)** : La fierté française. Très performant et efficace.
*   **Qwen 2.5 Coder** : Spécialisé pour le code. Incroyable pour un petit modèle.
*   **Gemma 2 (9B)** : Le modèle ouvert de Google. Excellente capacité de raisonnement.

---

## 4. Utilisation Avancée (Python)

Ollama n'est pas juste un Chatbot, c'est un serveur API local. Vous pouvez l'interroger avec Python.

```python
import requests
import json

url = "http://localhost:11434/api/generate"

data = {
    "model": "llama3",
    "prompt": "Explique-moi le polymorphisme en Python en une phrase courte.",
    "stream": False
}

response = requests.post(url, json=data)
print(response.json()['response'])
```

### Intégration dans VS Code
Installez l'extension **"Continue"** dans VS Code. Configurez-la pour utiliser "Ollama" comme provider.
Boum 💥 ! Vous avez un Copilot gratuit et privé qui connait votre code.

---

## 5. Matériel Requis (Hardware)

*   **RAM** : 8 Go minimum (pour les modèles 7B/8B). 16 Go est confortable.
*   **GPU** : NVIDIA recommandé (RTX 3060 ou plus) pour une réponse instantanée.
*   **CPU** : Ça marche aussi sur processeur (CPU), mais ce sera plus lent (quelques mots par seconde).

> **Conseil :** Commencez par le modèle `phi3` de Microsoft (3.8 Go) si vous avez une petite configuration. Il est surprenant.
