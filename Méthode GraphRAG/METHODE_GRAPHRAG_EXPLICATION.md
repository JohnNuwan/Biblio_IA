# LA MÉTHODE GraphRAG
### Guide de Référence pour RAG avec Graphes de Connaissances

## 1. Qu'est-ce que GraphRAG ?

**GraphRAG** combine RAG avec un **graphe de connaissances** pour capturer les relations entre entités, permettant des requêtes plus complexes.

Son principe fondateur est le **"Entities and Relationships"** (Entités et Relations).
* **Règle d'or :** Les relations comptent autant que les faits.
* **Communication :** Traversée du graphe + génération.

---

## 2. Le Workflow GraphRAG

```
📥 QUESTION
     │
     ▼
🔍 Entity Extraction ──► Identifie les entités
     │
     ▼
🕸️ Graph Traversal ──► Parcourt les relations
     │
     ▼
📄 Subgraph + Documents
     │
     ▼
🧠 GÉNÉRATEUR
     │
     ▼
📤 RÉPONSE
```

---

## 3. Structure du Graphe

```
      ┌─────────┐
      │ BMAD    │
      └────┬────┘
           │ utilise
    ┌──────┴──────┐
    ▼             ▼
┌───────┐    ┌───────┐
│Analyste│   │  PM   │
└───┬───┘    └───┬───┘
    │ produit    │ produit
    ▼            ▼
┌───────┐    ┌───────┐
│ Brief │    │  PRD  │
└───────┘    └───────┘
```

---

## 4. Les Agents GraphRAG

### 🔹 Agent Extracteur d'Entités
* **Rôle :** Identifier les entités dans la question.

### 🔹 Agent Traverseur
* **Rôle :** Parcourir le graphe pour trouver les infos.

### 🔹 Agent Générateur
* **Rôle :** Synthétiser depuis le sous-graphe.

---

## 5. Exemple

**Question :** "Quels documents produit l'Analyste dans BMAD ?"

### Extraction :
- Entités : [Analyste, BMAD, documents]

### Traversée :
```
BMAD → utilise → Analyste → produit → Brief
```

### Réponse :
> L'Analyste dans BMAD produit le **Brief** (01_project_brief.md).

---

## 6. Quand l'utiliser ?

- Questions impliquant des relations
- Données structurées (organigrammes, dépendances)
- Q&A multi-hop ("A qui appartient X qui fait Y ?")
