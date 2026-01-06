# 🔗 Intégrations - Connecter les LLMs à vos Outils

## 1. APIs des Principaux LLMs

### OpenAI (GPT)
```python
from openai import OpenAI
client = OpenAI(api_key="sk-...")

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": "Tu es un assistant."},
        {"role": "user", "content": "Bonjour !"}
    ]
)
print(response.choices[0].message.content)
```

### Anthropic (Claude)
```python
import anthropic
client = anthropic.Anthropic(api_key="sk-...")

response = client.messages.create(
    model="claude-3-sonnet-20240229",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Bonjour !"}]
)
print(response.content[0].text)
```

### Google (Gemini)
```python
import google.generativeai as genai
genai.configure(api_key="...")

model = genai.GenerativeModel('gemini-pro')
response = model.generate_content("Bonjour !")
print(response.text)
```

---

## 2. LLMs Locaux (Self-Hosted)

### 🦙 Ollama (Facile à utiliser)

**Installation :**
```bash
# Windows/Mac/Linux
curl -fsSL https://ollama.com/install.sh | sh

# Télécharger un modèle
ollama pull llama3
ollama pull mistral
ollama pull codellama
```

**Utilisation CLI :**
```bash
ollama run llama3 "Explique le machine learning"
```

**API REST (compatible OpenAI) :**
```python
from openai import OpenAI

# Ollama expose une API compatible OpenAI !
client = OpenAI(
    base_url="http://localhost:11434/v1",
    api_key="ollama"  # Pas besoin de vraie clé
)

response = client.chat.completions.create(
    model="llama3",
    messages=[{"role": "user", "content": "Bonjour !"}]
)
print(response.choices[0].message.content)
```

**Avantages Ollama :**
- ✅ Installation en 1 commande
- ✅ API compatible OpenAI
- ✅ Gestion automatique des modèles
- ✅ Idéal pour dev/prototypage

---

### ⚡ vLLM (Production & Performance)

**Installation :**
```bash
pip install vllm
```

**Lancer un serveur :**
```bash
python -m vllm.entrypoints.openai.api_server \
    --model mistralai/Mistral-7B-Instruct-v0.2 \
    --host 0.0.0.0 \
    --port 8000
```

**Utilisation (API OpenAI compatible) :**
```python
from openai import OpenAI

client = OpenAI(
    base_url="http://localhost:8000/v1",
    api_key="token-abc123"
)

response = client.chat.completions.create(
    model="mistralai/Mistral-7B-Instruct-v0.2",
    messages=[{"role": "user", "content": "Bonjour !"}]
)
```

**Avantages vLLM :**
- ⚡ Très rapide (PagedAttention)
- 📈 Haute concurrence
- 🔧 Production-ready
- 🐳 Docker disponible

---

### Comparatif Ollama vs vLLM

| Critère | Ollama | vLLM |
|---------|--------|------|
| Installation | ⭐⭐⭐ Très facile | ⭐⭐ Technique |
| Performance | ⭐⭐ Bonne | ⭐⭐⭐ Excellente |
| Usage | Dev, prototypage | Production |
| Concurrence | Moyenne | Haute |
| GPU requis | Optionnel | Recommandé |

---

## 3. Plateformes No-Code

### Zapier
| Use Case | Configuration |
|----------|---------------|
| Email → LLM → Réponse | Trigger Gmail → OpenAI → Send Email |
| Form → LLM → Sheet | Typeform → Claude → Google Sheets |
| Slack → LLM → Slack | New message → GPT → Reply |

### Make (Integromat)
- Plus flexible que Zapier
- Meilleur pour les workflows complexes
- Module OpenAI natif

### n8n (Self-hosted)
- Open source
- Peut être hébergé en interne
- Idéal pour la confidentialité

---

## 3. Intégrations Courantes

### 📧 Email Automation
```
Trigger: Nouvel email reçu
→ Analyser avec LLM (intention, urgence)
→ Catégoriser automatiquement
→ Générer brouillon de réponse
```

### 📊 Excel/Sheets
```
Trigger: Nouvelle ligne
→ LLM analyse le contenu
→ Enrichit avec des colonnes calculées
→ Met à jour le fichier
```

### 💬 Chat/Support
```
Message client
→ RAG sur documentation
→ LLM génère réponse
→ Envoi au client (ou validation humaine)
```

### 📝 Documents
```
Document uploadé
→ OCR si image/PDF
→ LLM extrait les infos clés
→ Stocke en base structurée
```

---

## 4. Frameworks Agents

### LangChain (Python/JS)
```python
from langchain.chat_models import ChatOpenAI
from langchain.agents import initialize_agent, Tool

llm = ChatOpenAI(model="gpt-4")
tools = [Tool(name="Search", func=search_fn, description="...")]
agent = initialize_agent(tools, llm, agent="zero-shot-react")
agent.run("Quelle est la capitale de la France ?")
```

### LlamaIndex
Spécialisé RAG
```python
from llama_index import VectorStoreIndex, SimpleDirectoryReader

documents = SimpleDirectoryReader('data').load_data()
index = VectorStoreIndex.from_documents(documents)
query_engine = index.as_query_engine()
response = query_engine.query("Question ?")
```

### CrewAI
Multi-agents
```python
from crewai import Agent, Task, Crew

researcher = Agent(role="Researcher", goal="...")
writer = Agent(role="Writer", goal="...")
crew = Crew(agents=[researcher, writer], tasks=[...])
crew.kickoff()
```

---

## 5. Bases Vectorielles (pour RAG)

| Base | Type | Usage |
|------|------|-------|
| **ChromaDB** | Local/Hosted | Prototypage, petits volumes |
| **Pinecone** | Cloud | Production, scalabilité |
| **Weaviate** | Self-hosted | Contrôle total |
| **Qdrant** | Self-hosted | Haute performance |
| **Milvus** | Enterprise | Gros volumes |

### Exemple ChromaDB
```python
import chromadb
client = chromadb.Client()
collection = client.create_collection("docs")
collection.add(
    documents=["Doc 1", "Doc 2"],
    ids=["id1", "id2"]
)
results = collection.query(query_texts=["Ma question"], n_results=3)
```

---

## 6. Déploiement

### Options
| Option | Quand l'utiliser |
|--------|------------------|
| **API directe** | Prototypage, MVPs |
| **Serverless** (Lambda) | Usage variable |
| **Container** (Docker) | Contrôle, scaling |
| **Managed** (Vercel, Railway) | Rapidité |

### Variables d'Environnement
```bash
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-...
GOOGLE_API_KEY=...
```

⚠️ **Ne jamais commit les clés API dans le code !**

---

## 7. Sécurité & Bonnes Pratiques

| Risque | Mitigation |
|--------|------------|
| Fuite de clé API | Variables d'environnement |
| Injection de prompt | Valider les entrées |
| Coûts incontrôlés | Rate limiting, budgets |
| Données sensibles | Ne pas envoyer au cloud |
