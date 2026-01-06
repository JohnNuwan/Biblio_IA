# LA MÉTHODE Contextual Compression
### Guide de Référence pour la Compression de Contexte

## 1. Qu'est-ce que Contextual Compression ?

**Contextual Compression** réduit la taille du contexte en ne gardant que les **informations pertinentes** pour la question.

Son principe fondateur est le **"Less is More"** (Moins c'est plus).
* **Règle d'or :** Ne garder que ce qui est utile.
* **Communication :** Contexte réduit = meilleure performance.

---

## 2. Le Workflow

```
📄 DOCUMENT LONG (10000 tokens)
     │
     ▼
🗜️ COMPRESSEUR
     │
     ├──► Extraction des passages pertinents
     │
     ├──► Résumé des sections
     │
     └──► Élimination du bruit
     │
     ▼
📝 CONTEXTE COMPRESSÉ (1000 tokens)
     │
     ▼
🧠 LLM + Question
     │
     ▼
📤 RÉPONSE
```

---

## 3. Techniques de Compression

### Extraction
Garder uniquement les phrases pertinentes.

### Résumé
Condenser les paragraphes.

### Filtrage
Éliminer le contenu non pertinent.

---

## 4. Agent Compresseur

```
## Format de Sortie

### 🗜️ COMPRESSION

**Question :** [Question]

**Contexte original :** [X] tokens

**Analyse de pertinence :**
| Section | Pertinence | Action |
|---------|------------|--------|
| [1] | Haute | Garder |
| [2] | Faible | Supprimer |
| [3] | Moyenne | Résumer |

**Contexte compressé :**
[Texte condensé]

**Statistiques :**
- Avant : [X] tokens
- Après : [Y] tokens
- Réduction : [Z%]
```

---

## 5. Quand l'utiliser ?

- Documents trop longs pour le context window
- Optimisation des coûts API
- Amélioration de la pertinence
