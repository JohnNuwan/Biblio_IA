# 🕵️ Tutoriel 3 : Cas Pratique - Créer un Agent Chercheur

Dans ce tutoriel, nous allons assembler les pièces pour créer un **Agent Chercheur** réel. Cet agent va :
1. Recevoir un sujet complexe.
2. Décomposer le sujet en sous-questions.
3. Chercher sur le web (simulé ou réel).
4. Synthétiser les résultats.

## Le Concept : "Plan-and-Execute"

Pour une recherche efficace, l'Agent ne doit pas juste "chercher". Il doit avoir une stratégie.
Pattern : **User -> Planner -> Executor -> Summarizer**.

Pour simplifier, nous utiliserons un seul Agent avec un Prompt Système puissant qui lui permet de faire plusieurs recherches avant de répondre.

## Le Code (Python)

Nous allons simuler l'outil de recherche (`duckduckgo`) pour que ce code fonctionne immédiatement, mais vous pouvez décommenter la vraie librairie.

```python
import time

# --- 1. Outil de Recherche ---

def web_search(query):
    """Simule une recherche web (ou utilise duckduckgo-search si installé)."""
    print(f"🌍 Recherche en cours : '{query}'...")
    time.sleep(1) # Simulation de latence
    
    # Simulation de résultats
    mock_db = {
        "python": "Python est un langage de programmation créé par Guido van Rossum en 1991.",
        "agent ia": "Un agent IA est un système autonome capable d'utiliser des outils pour atteindre un but.",
        "llm": "Un LLM (Large Language Model) est un modèle de langage entraîné sur de vastes données."
    }
    
    for key, val in mock_db.items():
        if key in query.lower():
            return f"Résultat pour '{query}': {val}"
    
    return f"Aucun résultat pertinent trouvé pour '{query}'."

# --- 2. Configuration de l'Agent ---

SYSTEM_PROMPT = """
Tu es un Agent Chercheur Expert.
Ton but est de répondre de manière exhaustive à la question de l'utilisateur.

TU AS LE DROIT DE FAIRE PLUSIEURS RECHERCHES.
Si la première recherche n'est pas suffisante, cherche autre chose.

Tes outils :
- web_search(query): Cherche sur internet.

Format REQUIS :
Thought: Analyse de ce que je sais et ce qu'il me manque.
Action: web_search(ma recherche)
OBSERVATION: ...
(Répète Thought/Action autant que nécessaire)
Final Answer: La synthèse complète.
"""

# (Réutilisez la fonction run_agent du Tutoriel 1 ici)
# ...
```

## Le Scénario d'Exécution

Imaginons que l'utilisateur demande : **"Explique-moi le lien entre Python et les Agents IA."**

Voici ce que l'Agent va faire (grâce à notre Prompt) :

1. **Tour 1**
   - **Thought** : Je dois d'abord comprendre ce qu'est Python et ce qu'est un Agent IA séparément.
   - **Action** : `web_search("Qu'est-ce que Python ?")`
   - **Observation** : "Python est un langage..."

2. **Tour 2**
   - **Thought** : OK, j'ai Python. Maintenant je dois chercher sur les Agents IA.
   - **Action** : `web_search("Définition Agent IA")`
   - **Observation** : "Un agent IA est un système autonome..."

3. **Tour 3**
   - **Thought** : J'ai les deux définitions. Je peux maintenant synthétiser le lien (Python est souvent utilisé pour coder des Agents).
   - **Final Answer** : "Le lien entre Python et les Agents IA est fort. Python est le langage de prédilection... [Synthèse]..."

## Aller plus loin : Intégrer la VRAIE recherche

Pour rendre cet agent vraiment utile, installez `duckduckgo-search` :

```bash
pip install duckduckgo-search
```

Et remplacez la fonction `web_search` par :

```python
from duckduckgo_search import DDGS

def web_search_real(query):
    results = DDGS().text(query, max_results=3)
    if results:
        return "\n".join([r['body'] for r in results])
    return "Pas de résultats."
```

## Conclusion

Vous venez de créer un agent capable d'**accumuler de la connaissance** avant de répondre. C'est la base des systèmes comme **AutoGPT** ou **BabyAGI**.
