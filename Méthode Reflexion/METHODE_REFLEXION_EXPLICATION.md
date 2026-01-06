# LA MÉTHODE Reflexion
### Guide de Référence pour Agents Auto-Apprenants

## 1. Qu'est-ce que la méthode Reflexion ?

La **méthode Reflexion** est une approche avancée où l'agent **apprend de ses erreurs** à travers un cycle d'auto-réflexion. Contrairement aux autres méthodes, Reflexion maintient une **mémoire des échecs** pour éviter de répéter les mêmes erreurs.

Son principe fondateur est le **"Learn from Failure"** (Apprendre de l'échec).
* **Règle d'or :** Chaque erreur est une opportunité d'apprentissage explicite.
* **Communication :** L'agent stocke et réutilise ses réflexions passées.

---

## 2. Le Cycle Reflexion

```
┌────────────────────────────────────────────────────────────────┐
│                                                                │
│  📥 TÂCHE                                                      │
│       │                                                        │
│       ▼                                                        │
│  ⚡ EXÉCUTEUR ──► Tente une solution                          │
│       │                                                        │
│       ▼                                                        │
│  📊 ÉVALUATEUR ──► Évalue le résultat                         │
│       │                                                        │
│       ├──── Succès ───► ✅ FIN                                │
│       │                                                        │
│       └──── Échec ────► 🔍 RÉFLECTEUR                         │
│                              │                                 │
│                              ▼                                 │
│                         💾 MÉMOIRE ◄── Stocke la réflexion    │
│                              │                                 │
│                              ▼                                 │
│                         🔧 AMÉLIORATEUR                        │
│                              │                                 │
│                              └──────► (Nouvelle tentative)     │
│                                              │                 │
│                   ┌──────────────────────────┘                 │
│                   ▼                                            │
│              ⚡ EXÉCUTEUR (avec contexte enrichi)              │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

---

## 3. Les 5 Agents Reflexion

### 🔹 Agent Exécuteur
* **Rôle :** Tenter de résoudre la tâche.
* **Input :** Tâche + Mémoire des réflexions passées.
* **Output :** Solution proposée.

### 🔹 Agent Évaluateur
* **Rôle :** Juger si la solution est correcte.
* **Input :** Solution + Critères de succès.
* **Output :** Verdict (Succès/Échec) + Score.

### 🔹 Agent Réflecteur
* **Rôle :** Analyser pourquoi l'échec s'est produit.
* **Input :** Tentative échouée + Feedback.
* **Output :** Réflexion structurée sur l'erreur.

### 🔹 Agent Mémoire
* **Rôle :** Stocker et récupérer les réflexions.
* **Input :** Nouvelles réflexions à stocker.
* **Output :** Réflexions pertinentes à réutiliser.

### 🔹 Agent Améliorateur
* **Rôle :** Proposer une meilleure approche.
* **Input :** Réflexions + Tentative précédente.
* **Output :** Nouvelle stratégie à essayer.

---

## 4. Exemple Concret

**Tâche :** "Écris une fonction Python qui trouve le plus grand nombre premier inférieur à N"

### Tentative 1 (Exécuteur)
```python
def largest_prime(n):
    for i in range(n-1, 1, -1):
        if n % i == 0:  # ERREUR: vérifie si n est divisible par i
            return i
    return 2
```

### Évaluation 1
❌ **Échec** - La fonction teste si N est divisible, pas si i est premier.

### Réflexion 1
> "J'ai confondu 'trouver un diviseur de N' avec 'vérifier si un nombre est premier'. 
> Je dois créer une fonction is_prime() séparée et l'utiliser pour tester chaque candidat."

### Tentative 2 (avec réflexion)
```python
def is_prime(num):
    if num < 2:
        return False
    for i in range(2, int(num**0.5) + 1):
        if num % i == 0:
            return False
    return True

def largest_prime(n):
    for i in range(n-1, 1, -1):
        if is_prime(i):
            return i
    return 2
```

### Évaluation 2
✅ **Succès** - La fonction retourne correctement le plus grand nombre premier.

---

## 5. Pourquoi utiliser Reflexion ? (Les Avantages)

### ✅ 1. Apprentissage Cumulatif
L'agent ne répète pas les mêmes erreurs deux fois.

### ✅ 2. Amélioration Continue
Chaque tentative est meilleure que la précédente.

### ✅ 3. Traçabilité des Décisions
On comprend POURQUOI l'agent a changé d'approche.

### ✅ 4. Idéal pour les Tâches Complexes
Parfait pour le code, les puzzles, les preuves mathématiques.

---

## 6. Les Inconvénients

### ❌ 1. Coût Élevé
Plusieurs tentatives = plusieurs appels API.

### ❌ 2. Risque de Spirale
L'agent peut s'enfermer dans une mauvaise direction.

### ❌ 3. Limite de Tentatives Nécessaire
Sans limite, l'agent pourrait boucler indéfiniment.

### ❌ 4. Mémoire à Gérer
Le stockage des réflexions nécessite une infrastructure.

---

## 7. Comparaison des Méthodes

| Critère | BMAD | ReAct | CoT | Reflexion |
|---------|------|-------|-----|-----------|
| **Focus** | Équipe | Itératif | Raisonnement | Apprentissage |
| **Mémoire** | Documents | Courte | Non | Longue |
| **Erreurs** | Blâme agent | Nouvelle action | Vérification | Réflexion |
| **Idéal** | Projets | Recherche | Logique | Code/Puzzles |

---

## 8. Quand l'utiliser ?

Utilisez Reflexion si :
1. La tâche est **difficile** et nécessite plusieurs essais
2. Les **erreurs sont informatives** (pas aléatoires)
3. Vous voulez un agent qui **s'améliore** au fil du temps
4. Vous avez un **feedback clair** sur succès/échec

Ne l'utilisez pas si :
1. La tâche est simple (overkill)
2. Pas de feedback possible sur la qualité
3. Budget API limité
