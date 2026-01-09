# 🤝 Tutoriel 5 : Orchestrer une Collaboration Multi-Agents

Pourquoi utiliser un seul agent quand on peut en avoir une équipe ?
Le pattern **Multi-Agents** permet de spécialiser chaque LLM (ex: un qui code, un qui teste, un qui écrit la doc).

Dans ce tutoriel, nous allons implémenter le pattern **Writer-Critic**.

## Le Concept

1.  **Agent Rédacteur** : Écrit un premier brouillon.
2.  **Agent Critique** : Relit le brouillon et donne un feedback constructif.
3.  **Boucle** : L'Agent Rédacteur améliore son texte grâce au feedback.

## Le Code (Python)

```python
from openai import OpenAI

client = OpenAI(api_key="votre-api-key")

# --- Définition des Rôles (Personas) ---

REDACTEUR_PROMPT = """
Tu es un Rédacteur Marketing Expert.
Ton but est d'écrire des posts LinkedIn viraux et engageants.
Utilise des emojis, des listes à puces et un ton accrocheur.
"""

CRITIQUE_PROMPT = """
Tu es un Editeur en Chef impitoyable.
Ton but est de CRITIQUER le travail du rédacteur.
Cherche les clichés, les fautes de ton, et ce qui est ennuyeux.
Sois bref et constructif.
"""

def call_agent(system_prompt, user_message):
    response = client.chat.completions.create(
        model="gpt-4", # GPT-4 est meilleur pour la critique
        messages=[
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_message}
        ]
    )
    return response.choices[0].message.content

# --- L'Orchestration ---

sujet = "L'importance de l'IA pour les PME"

print(f"🎬 Sujet : {sujet}\n")

# Étape 1 : Premier Brouillon
print("✍️  Le Rédacteur travaille...")
brouillon_v1 = call_agent(REDACTEUR_PROMPT, f"Écris un post LinkedIn sur : {sujet}")
print(f"\n--- BROUILLON V1 ---\n{brouillon_v1}\n--------------------\n")

# Étape 2 : Critique
print("🧐 Le Critique relit...")
feedback = call_agent(CRITIQUE_PROMPT, f"Voici un brouillon de post LinkedIn :\n\n{brouillon_v1}\n\nDonne 3 points d'amélioration précis.")
print(f"\n--- FEEDBACK ---\n{feedback}\n----------------\n")

# Étape 3 : Révision
print("✍️  Le Rédacteur améliore...")
brouillon_v2 = call_agent(REDACTEUR_PROMPT, f"Voici ton brouillon précédent :\n{brouillon_v1}\n\nVoici le feedback de l'éditeur :\n{feedback}\n\nRéécris le post en prenant en compte ces retours.")
print(f"\n✨ --- VERSION FINALE ---\n{brouillon_v2}\n------------------------\n")
```

## Pourquoi ça marche mieux ?

Si vous demandez simplement à ChatGPT "Écris un post parfait", il le fait en une seule passe ("Zero-Shot"). Il ne prend pas de recul.
En séparant les étapes (Génération -> Critique -> Révision), vous forcez le système à **réfléchir sur sa propre production**.

C'est le principe de base de frameworks avancés comme **AutoGen** (Microsoft) ou **CrewAI**.

## Exercice

Ajoutez un troisième agent : **Le "Fact-Checker"**.
Il doit passer *après* le critique mais *avant* la révision finale pour vérifier qu'aucune fausse information n'a été inventée.
