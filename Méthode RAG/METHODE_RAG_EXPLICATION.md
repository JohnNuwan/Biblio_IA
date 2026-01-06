# LA MÉTHODE RAG (Retrieval-Augmented Generation)
### Guide de Référence pour la Génération Augmentée par Recherche

## 1. Qu'est-ce que RAG ?

**RAG** combine un système de **recherche** (retrieval) avec un **LLM** pour générer des réponses basées sur des documents externes. Le modèle ne se fie pas uniquement à sa mémoire, mais consulte une base de connaissances.

Son principe fondateur est le **"Ground in Evidence"** (Ancrer dans les preuves).
* **Règle d'or :** Toujours chercher avant de répondre.
* **Communication :** Les sources sont citées et traçables.

---

## 2. Le Workflow RAG

```
📥 QUESTION
     │
     ▼
🔍 RETRIEVER ──► Recherche dans la base
     │
     ▼
📄 Documents pertinents (chunks)
     │
     ▼
🧠 GÉNÉRATEUR ──► LLM + contexte
     │
     ▼
📤 RÉPONSE (avec sources)
```

---

## 3. Les Composants RAG

### 🔹 Indexation (Préparation)
1. **Chunking** : Découper les documents en morceaux
2. **Embedding** : Vectoriser chaque chunk
3. **Stockage** : Base vectorielle (ChromaDB, Pinecone...)

### 🔹 Retrieval (Recherche)
1. **Query Embedding** : Vectoriser la question
2. **Similarity Search** : Trouver les chunks similaires
3. **Ranking** : Classer par pertinence

### 🔹 Generation (Génération)
1. **Prompt Augmentation** : Injecter le contexte
2. **LLM Generation** : Produire la réponse
3. **Citation** : Référencer les sources

---

## 4. Les Agents RAG

### 🔹 Agent Indexeur
* **Rôle :** Préparer et indexer les documents.
* **Output :** Base vectorielle prête.

### 🔹 Agent Chercheur
* **Rôle :** Rechercher les documents pertinents.
* **Output :** Top-K chunks avec scores.

### 🔹 Agent Générateur
* **Rôle :** Synthétiser la réponse.
* **Output :** Réponse avec citations.

---

## 5. Exemple

**Question :** "Quelles sont les étapes de la méthode BMAD ?"

### Recherche :
```
Query: "étapes méthode BMAD"
→ Chunk 1: "Étape 1: Le Brief (Agent Analyste)..." (score: 0.92)
→ Chunk 2: "Étape 2: Le Produit (Agent PM)..." (score: 0.89)
```

### Génération :
```
Contexte: [Chunks 1 + 2]
Prompt: "Réponds en utilisant UNIQUEMENT le contexte..."
```

### Réponse :
> Les étapes de la méthode BMAD sont :
> 1. Brief (Analyste)
> 2. Produit (PM)
> 3. Architecture (Architecte)
> 4. Implémentation (Développeur)
> 
> *Sources : METHODE_BMAD_EXPLICATION.md*

---

## 6. Quand l'utiliser ?

- Q&A sur documents d'entreprise
- Chatbots experts
- Réduction des hallucinations
- Besoin de sources traçables
