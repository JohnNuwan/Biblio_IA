# LA MÉTHODE Step-Back Prompting
### Guide de Référence pour l'Abstraction Avant Résolution

## 1. Qu'est-ce que Step-Back Prompting ?

**Step-Back Prompting** demande au LLM de prendre du recul et de réfléchir aux **principes généraux** avant de répondre à une question spécifique.

Son principe fondateur est le **"Zoom Out Before Zoom In"** (Élargir avant de préciser).
* **Règle d'or :** Comprendre le principe général d'abord.
* **Communication :** Abstraction → Application.

---

## 2. Le Workflow Step-Back

```
📥 QUESTION SPÉCIFIQUE
     │
     ▼
🔭 STEP-BACK ──► Question plus abstraite
     │
     ▼
📚 PRINCIPES GÉNÉRAUX
     │
     ▼
🎯 APPLICATION au cas spécifique
     │
     ▼
📤 RÉPONSE
```

---

## 3. Exemple

**Question :** "Pourquoi mon code Python est lent ?"

### Step-Back :
> "Quels sont les principes généraux d'optimisation de performance ?"

### Principes :
1. Algorithmes (complexité O(n))
2. Structures de données appropriées
3. I/O et mémoire
4. Profiling avant optimisation

### Application :
> "Vérifions : complexité des boucles, choix list vs set, lectures fichiers..."

---

## 4. Agent Step-Back

```
## Format de Sortie

### 🔭 STEP-BACK

**Question originale :** [Question spécifique]

**Question step-back :** [Question abstraite/générale]

**Principes identifiés :**
1. [Principe général 1]
2. [Principe général 2]
...

**Application à la question :**
[Comment les principes s'appliquent au cas]

**Réponse finale :**
[Réponse informée par les principes]
```

---

## 5. Quand l'utiliser ?

- Questions techniques complexes
- Problèmes de compréhension
- Besoin de fondamentaux solides
