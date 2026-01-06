# LA MÉTHODE Plan-and-Solve
### Guide de Référence pour la Planification Explicite

## 1. Qu'est-ce que la méthode Plan-and-Solve ?

La **méthode Plan-and-Solve** améliore Chain-of-Thought en ajoutant une **étape de planification explicite** avant de résoudre.

Son principe fondateur est le **"Plan Before You Leap"** (Planifie avant de sauter).
* **Règle d'or :** Toujours créer un plan avant de commencer.
* **Communication :** Le plan guide le raisonnement.

---

## 2. Le Workflow Plan-and-Solve

```
📥 PROBLÈME
     │
     ▼
📋 PLANIFICATEUR ──► Crée le plan d'action
     │
     ▼
🧠 SOLVEUR ──► Suit le plan étape par étape
     │
     ▼
📤 RÉPONSE
```

---

## 3. Les Agents Plan-and-Solve

### 🔹 Agent Planificateur
* **Rôle :** Définir les variables et le plan.
* **Output :** Plan structuré avec étapes.

### 🔹 Agent Solveur
* **Rôle :** Exécuter le plan.
* **Output :** Solution finale.

---

## 4. Prompt Type (PS+)

```
Résolvons ce problème étape par étape.

D'abord, planifions :
1. Identifions les variables
2. Définissons les étapes
3. Calculons chaque étape
4. Vérifions le résultat
```

---

## 5. Exemple

**Problème :** "Jean a 3 fois plus de pommes que Marie. Ensemble ils ont 24 pommes."

### Plan :
1. Définir les variables (M = Marie, J = Jean)
2. Écrire les équations (J = 3M, J + M = 24)
3. Résoudre le système
4. Vérifier

### Résolution :
- J = 3M et J + M = 24
- 3M + M = 24 → 4M = 24 → M = 6
- J = 3 × 6 = 18
- Vérification : 6 + 18 = 24 ✓

**Réponse :** Marie a 6 pommes, Jean en a 18.

---

## 6. Quand l'utiliser ?

- Problèmes mathématiques complexes
- Problèmes avec plusieurs variables
- Amélioration de CoT simple
