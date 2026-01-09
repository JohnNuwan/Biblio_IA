# 🏗️ Tutoriel 1 : Construire votre Premier Agent IA (Python)

Ce tutoriel vous guide pas-à-pas pour coder un Agent IA simple capable d'utiliser des outils, sans utiliser de framework complexe (comme LangChain) au début, pour bien comprendre les concepts.

## 🎯 Objectif
Créer un script Python qui permet à un LLM (GPT-4 ou GPT-3.5) de :
1. Comprendre une demande utilisateur.
2. Décider d'utiliser un outil (ex: obtenir la météo).
3. Exécuter l'outil.
4. Répondre à l'utilisateur avec le résultat.

## 🛠️ Pré-requis
- Python installé.
- Une clé API OpenAI (ou un LLM local compatible via Ollama/vLLM).

## Étape 1 : Le "Cerveau" (Appel API simple)

Tout commence par une fonction pour parler au LLM.

```python
import os
from openai import OpenAI
import json

# Configuration
client = OpenAI(api_key="votre-api-key")  # ou os.getenv("OPENAI_API_KEY")

def ask_llm(messages):
    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=messages,
        temperature=0
    )
    return response.choices[0].message.content
```

## Étape 2 : Définir les Outils

Un agent a besoin d'outils. Créons une fonction "dummy" pour simuler une action réelle.

```python
def get_weather(location):
    """Donne la météo simulée pour une ville donnée."""
    if "paris" in location.lower():
        return "20°C, Ensoleillé"
    elif "london" in location.lower():
        return "15°C, Pluvieux"
    else:
        return "Température inconnue pour " + location

# Registre des outils disponibles pour notre code Python
tools_map = {
    "get_weather": get_weather
}
```

## Étape 3 : Le Prompt Système (Le Coeur de l'Agent)

C'est ici que la magie opère. Nous devons expliquer au LLM **comment** utiliser les outils. Nous allons utiliser le format **ReAct** (Reason + Act) simplifié.

```python
SYSTEM_PROMPT = """
Tu es un Assistant IA intelligent doté d'outils.

Tes outils disponibles :
- get_weather(location: str): Donne la météo pour une ville.

Pour répondre à une question, tu dois suivre ce format STRICTEMENT :

Thought: Je dois réfléchir à ce que je dois faire.
Action: NomDeLAction(argument)
OBSERVATION: Résultat de l'action
... (répète Thought/Action/OBSERVATION si nécessaire)
Final Answer: La réponse finale à l'utilisateur.

Si tu connais déjà la réponse ou si tu n'as pas besoin d'outils :
Thought: Je peux répondre directement.
Final Answer: Ta réponse.
"""
```

## Étape 4 : La Boucle d'Exécution (The Loop)

L'agent doit boucler : il réfléchit -> agit -> observe -> recommence jusqu'à la réponse finale.

```python
import re

def run_agent(user_query):
    # 1. Initialiser la mémoire
    messages = [
        {"role": "system", "content": SYSTEM_PROMPT},
        {"role": "user", "content": user_query}
    ]
    
    print(f"🤖 User: {user_query}")
    
    # Limite pour éviter les boucles infinies
    for _ in range(5):
        # 2. Demander au LLM
        llm_response = ask_llm(messages)
        print(f"🧠 LLM: {llm_response}")
        
        # Ajouter la réponse du LLM à l'historique
        messages.append({"role": "assistant", "content": llm_response})
        
        # 3. Détecter si le LLM veut agir (Action: ...)
        # Regex pour capturer: Action: tool_name(args)
        action_match = re.search(r"Action: (\w+)\((.*)\)", llm_response)
        
        if action_match:
            tool_name = action_match.group(1)
            tool_args = action_match.group(2)
            
            # 4. Exécuter l'outil
            if tool_name in tools_map:
                print(f"🔧 Tool Call: {tool_name} with {tool_args}")
                tool_result = tools_map[tool_name](tool_args)
                
                # 5. Donner le résultat au LLM (OBSERVATION)
                observation = f"OBSERVATION: {tool_result}"
                print(f"👀 {observation}")
                messages.append({"role": "user", "content": observation})
            else:
                messages.append({"role": "user", "content": f"OBSERVATION: Erreur, outil {tool_name} inconnu."})
        
        elif "Final Answer:" in llm_response:
            # Le LLM a fini !
            final_answer = llm_response.split("Final Answer:")[-1].strip()
            return final_answer
            
    return "J'ai atteint ma limite d'étapes sans trouver de réponse."

# Test
print("-" * 50)
reponse = run_agent("Quelle est la météo à Paris ?")
print(f"📢 Résultat final : {reponse}")
```

## 🔍 Analyse de ce qui s'est passé

1. **User** : "Quelle est la météo à Paris ?"
2. **LLM** (grâce au Prompt Système) : "Thought: Je dois vérifier la météo. Action: get_weather(Paris)"
3. **Python** (Regex) : Détecte `get_weather` et exécute la fonction.
4. **Python** : Renvoie "OBSERVATION: 20°C, Ensoleillé" dans l'historique de conversation.
5. **LLM** : Reçoit l'observation. "Thought: J'ai l'info. Final Answer: Il fait 20°C et ensoleillé à Paris."

## ✅ Conclusion

Bravo ! Vous avez codé un agent "ReAct" (Reasoning + Acting) manuel.
Les frameworks comme **LangChain** ou **CrewAI** automatisent cette boucle (le parsing, la gestion des erreurs, l'historique), mais la logique reste exactement la même.
