# 02 - Embeddings et Espaces Vectoriels

C'est la pierre angulaire des LLM et du RAG. Comment transformer un mot (symbole) en nombre (mathématique) tout en gardant son sens ?

---

## 1. Le Problème du Langage pour une Machine

Pour un ordinateur, "Roi" et "Reine" sont deux chaînes de caractères totalement différentes, aussi différentes que "Roi" et "Chaussure".
Il n'y a pas de lien sémantique *inhérent*.
L'objectif des embeddings est de créer une représentation géométrique où :
$$Distance(Roi, Reine) \approx Distance(Homme, Femme)$$

---

## 2. Word2Vec : La Révolution (2013)

Créé par **Tomas Mikolov (Google)**.
L'idée géniale : **"On connaît un mot par les mots qui l'entourent"** (Hypothèse distributionnelle).
Si "Pizza" et "Pâtes" apparaissent souvent à côté de "Délicieux", "Manger", "Italien", alors "Pizza" et "Pâtes" doivent avoir des représentations numériques proches.

### Comment ça marche ?
On entraîne un réseau de neurones (superficiel) sur tout Wikipédia pour prédire le mot masqué au milieu d'une phrase.
*   Phrase : "Le chat mange la [?]"
*   Le réseau apprend à prédire "souris", "patée".
*   On jette le réseau de prédiction, mais **on garde les poids de la couche caché**.
*   Ce vecteur de poids EST l'embedding du mot.

---

## 3. Les Espaces Vectoriels (Vector Spaces)

Chaque mot (ou phrase, ou image) devient un point dans un espace à N dimensions (souvent 768, 1536 ou 3072 dimensions pour les modèles modernes comme OpenAI `text-embedding-3-small`).

### Exemple simplifié en 2D :
Imaginez un graphique avec l'axe X (Concept : Royal) et l'axe Y (Concept : Genre).
*   **Roi** : [0.9, 0.9] (Très Royal, Très Masculin)
*   **Reine** : [0.9, 0.1] (Très Royal, Très Féminin)
*   **Pomme** : [0.0, 0.5] (Pas Royal, Neutre)

### 🧮 L'Algèbre des Mots
La célèbre équation démontrée par Word2Vec :
$$Vecteur(Roi) - Vecteur(Homme) + Vecteur(Femme) \approx Vecteur(Reine)$$
Cela prouve que l'espace vectoriel a capturé des relations sémantiques complexes.

---

## 4. La Recherche de Similitude (Vector Search)

Comment trouver les documents pertinents pour une question user ?
On ne cherche pas les *mots exacts* (keyword search), on cherche la *proximité géométrique* (semantic search).

La métrique reine est la **Cosinus Similarité (Cosine Similarity)**.
Elle mesure l'angle entre deux vecteurs.
$$Cosine(\vec{A}, \vec{B}) = \frac{\vec{A} \cdot \vec{B}}{||\vec{A}|| \cdot ||\vec{B}||}$$

*   **1** : Les vecteurs pointent dans la même direction (Synonymes parfaits).
*   **0** : Les vecteurs sont orthogonaux (Aucun rapport, ex: "Salade" et "Turboréacteur").
*   **-1** : Opposés.

---

## 5. Les Bases de Données Vectorielles (Vector Databases)

Stocker des millions de vecteurs et rechercher le "Plus Proche Voisin" (Nearest Neighbor - KNN) est très coûteux en calcul brute force.
On utilise des algorithmes d'indexation approximative (**ANN - Approximate Nearest Neighbor**) comme **HNSW (Hierarchical Navigable Small World)**.

### 🏢 Outils du Marché
*   **Pinecone** (SaaS, très populaire).
*   **ChromaDB** (Open source, local).
*   **Qdrant** (Performance Rust).
*   **pgvector** (Extension pour PostgreSQL - très utilisée pour ne pas changer de stack technique).

---

## Résumé du Flux
1.  **User** : "J'ai mal à la tête".
2.  **Embedding Model** : Transforme la phrase en vecteur `[0.12, -0.98, ...]` (1536 chiffres).
3.  **Vector DB** : Cherche dans l'index les vecteurs les plus proches (Cosine Similarity > 0.8).
4.  **Result** : Trouve des docs sur "Migraine", "Céphalée", "Aspirine" (même sans le mot "tête" !).
