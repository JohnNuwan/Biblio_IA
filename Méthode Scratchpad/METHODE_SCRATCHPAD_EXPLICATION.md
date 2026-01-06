# LA MÉTHODE Scratchpad
### Guide de Référence pour la Mémoire de Travail

## 1. Qu'est-ce que la méthode Scratchpad ?

La **méthode Scratchpad** (Bloc-notes) fournit au LLM un espace de **mémoire de travail** pour noter les calculs intermédiaires.

Son principe fondateur est le **"Show Your Work"** (Montre ton travail).
* **Règle d'or :** Écrire toutes les étapes intermédiaires.
* **Communication :** Le scratchpad persiste entre les étapes.

---

## 2. Le Workflow Scratchpad

```
📥 PROBLÈME
     │
     ▼
📝 SCRATCHPAD ──► Espace de travail
     │
     ├──► Étape 1 → Note intermédiaire
     │
     ├──► Étape 2 → Note intermédiaire
     │
     ├──► Étape 3 → Note intermédiaire
     │
     ▼
📤 RÉPONSE (basée sur le scratchpad)
```

---

## 3. Les Agents Scratchpad

### 🔹 Agent Travailleur
* **Rôle :** Résoudre en utilisant le scratchpad.
* **Output :** Calculs intermédiaires + réponse.

---

## 4. Format du Scratchpad

```
SCRATCHPAD:
┌────────────────────────────────────┐
│ Variables :                        │
│   x = 5                            │
│   y = 3                            │
│                                    │
│ Calculs :                          │
│   temp1 = x + y = 8                │
│   temp2 = temp1 * 2 = 16           │
│                                    │
│ Résultat : 16                      │
└────────────────────────────────────┘
```

---

## 5. Exemple

**Problème :** "Calcule ((5 + 3) × 2) ÷ 4"

### Scratchpad :
```
SCRATCHPAD:
┌────────────────────────────────────┐
│ Étape 1: Parenthèse intérieure     │
│   5 + 3 = 8                        │
│   → temp1 = 8                      │
│                                    │
│ Étape 2: Multiplication            │
│   8 × 2 = 16                       │
│   → temp2 = 16                     │
│                                    │
│ Étape 3: Division                  │
│   16 ÷ 4 = 4                       │
│   → résultat = 4                   │
└────────────────────────────────────┘
```

**Réponse :** 4

---

## 6. Quand l'utiliser ?

- Calculs multi-étapes
- Quand la mémoire du LLM est limitée
- Problèmes nécessitant un suivi des variables
- Débogage de raisonnement
