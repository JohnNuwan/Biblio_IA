# 📚 Tutoriel 4 : Discuter avec vos Documents (RAG)

Le **RAG** (Retrieval-Augmented Generation) est la technique reine pour connecter un LLM à vos propres données privées (PDFs, Excels, Notion, etc.) sans le ré-entraîner.

## Le Concept en 3 Étapes

1.  **Indexation** : Découper vos documents en morceaux ("chunks") et les transformer en vecteurs numériques ("embeddings").
2.  **Recherche (Retrieval)** : Quand l'utilisateur pose une question, on cherche les morceaux les plus similaires mathématiquement.
3.  **Génération** : On envoie la question + les morceaux trouvés au LLM pour qu'il réponde.

## Pré-requis

Nous allons utiliser `chromadb` (base de vecteurs locale) et `sentence-transformers` (pour les embeddings) car ils sont gratuits et locaux.

```bash
pip install chromadb sentence-transformers openai
```

## Le Code Complet (Python)

Créez un fichier `simple_rag.py`.

```python
import chromadb
from sentence_transformers import SentenceTransformer
from openai import OpenAI
import os

# 1. Configuration
client = chromadb.Client()
collection = client.create_collection("mes_documents")
embedder = SentenceTransformer('all-MiniLM-L6-v2') # Petit modèle rapide et gratuit
llm_client = OpenAI(api_key="votre-api-key")

# Vos documents "privés" (Simulés ici)
documents = [
    {"id": "doc1", "text": "Le projet Alpha a un budget de 50k€. Le chef de projet est Alice."},
    {"id": "doc2", "text": "Le projet Beta est en retard. Il manque 3 développeurs Python."},
    {"id": "doc3", "text": "La politique de télétravail autorise 2 jours par semaine (Mardi et Jeudi)."}
]

print("💾 Indexation des documents en cours...")

# 2. Indexation (Transformation en vecteurs)
for doc in documents:
    # On calcule le vecteur (embedding) du texte
    embedding = embedder.encode(doc['text']).tolist()
    
    # On stocke dans la base Chroma
    collection.add(
        ids=[doc['id']],
        embeddings=[embedding],
        documents=[doc['text']]
    )

print("✅ Indexation terminée !")

# 3. Fonction de Chat RAG
def rag_chat(question):
    print(f"\n❓ Question : {question}")
    
    # Étape A : Recherche sémantique
    query_embedding = embedder.encode(question).tolist()
    results = collection.query(
        query_embeddings=[query_embedding],
        n_results=1 # On prend juste le document le plus pertinent
    )
    
    retrieved_doc = results['documents'][0][0]
    print(f"📖 Document trouvé : '{retrieved_doc}'")
    
    # Étape B : Génération avec le contexte
    prompt = f"""
    Tu es un assistant utile. Utilise UNIQUEMENT le contexte ci-dessous pour répondre à la question.
    
    CONTEXTE :
    {retrieved_doc}
    
    QUESTION :
    {question}
    """
    
    response = llm_client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": prompt}]
    )
    
    return response.choices[0].message.content

# 4. Test
reponse1 = rag_chat("Qui gère le projet Alpha ?")
print(f"🤖 Réponse : {reponse1}")

reponse2 = rag_chat("Je peux télétravailler le mercredi ?")
print(f"🤖 Réponse : {reponse2}")
```

## Pourquoi c'est magique ?

Regardez la deuxième question : *"Je peux télétravailler le mercredi ?"*.
Le mot "mercredi" n'est **pas** dans le document 3 (qui dit "Mardi et Jeudi").
Pourtant, le RAG va trouver le document sur le télétravail car sémantiquement, c'est proche. Et le LLM va déduire que Mercredi n'est pas Mardi ni Jeudi, donc la réponse sera "Non".

## Aller plus loin

Pour un système de production :
1. Utilisez **LangChain** pour découper vos PDFs (`RecursiveCharacterTextSplitter`).
2. Utilisez une vraie base vectorielle persistante (ChromaDB en mode persistant, Pinecone, Qdrant).
3. Utilisez le modèle d'embedding `text-embedding-3-small` d'OpenAI pour une meilleure qualité (payant mais peu cher).
