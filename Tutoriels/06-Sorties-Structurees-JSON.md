# 🗃️ Tutoriel 6 : Dompter le JSON (Sorties Structurées)

Le cauchemar du développeur IA : demander du JSON et recevoir du Markdown ou du texte bla-bla autour.
> "Voici le JSON que tu as demandé : ```json { ... } ```" ❌

Pour intégrer une IA dans une app, on veut du JSON **pur** et **validé**.

## Méthode 1 : JSON Mode (Le basique)

OpenAI permet de forcer le mode JSON.

```python
from openai import OpenAI
import json

client = OpenAI()

response = client.chat.completions.create(
  model="gpt-3.5-turbo-0125",
  response_format={ "type": "json_object" }, # <--- La clé magique
  messages=[
    {"role": "system", "content": "Tu es un extracteur de données. Tu DOIS répondre en JSON."},
    {"role": "user", "content": "Jean Dupont habite à Paris et a 30 ans."}
  ]
)

data = json.loads(response.choices[0].message.content)
print(data) 
# {'nom': 'Jean Dupont', 'ville': 'Paris', 'age': 30} (Les clés peuvent varier si non spécifiées)
```

**Inconvénient** : Le LLM choisit lui-même les noms des clés (`nom` vs `name` vs `full_name`).

## Méthode 2 : Function Calling (Le Standard Pro)

C'est la méthode la plus robuste. On "ment" au LLM en lui disant qu'on a une fonction, et il va générer les arguments pour l'appeler. Ces arguments sont toujours du JSON strict.

Nous allons utiliser **Pydantic** pour définir notre schéma (c'est plus propre).

```python
from openai import OpenAI
import json
from pydantic import BaseModel, Field

# 1. Définir la structure attendue
class UserProfile(BaseModel):
    name: str = Field(description="Nom complet de la personne")
    city: str = Field(description="Ville de résidence")
    age: int = Field(description="Âge de la personne")
    skills: list[str] = Field(description="Liste des compétences techniques trouvées")

# 2. Convertir en schéma JSON pour OpenAI
tools = [
    {
        "type": "function",
        "function": {
            "name": "extract_profile",
            "description": "Extrait les infos d'un profil utilisateur",
            "parameters": UserProfile.model_json_schema() # Pydantic fait le travail dur !
        }
    }
]

client = OpenAI()

prompt = "Je m'appelle Alice, j'ai 28 ans, je suis dev Python expert et je vis à Lyon."

response = client.chat.completions.create(
    model="gpt-3.5-turbo",
    messages=[{"role": "user", "content": prompt}],
    tools=tools,
    tool_choice={"type": "function", "function": {"name": "extract_profile"}} # On FORCE l'appel
)

# 3. Récupérer et valider le JSON
tool_args = response.choices[0].message.tool_calls[0].function.arguments
data_json = json.loads(tool_args)

# Validation Pydantic (Double sécurité)
profile = UserProfile(**data_json)

print(f"Nom : {profile.name}")
print(f"Compétences : {profile.skills}")
# Sortie garantie : Nom : Alice, Compétences : ['Python']
```

## Méthode 3 : Structured Outputs (Nouveau 2024)

OpenAI a récemment sorti une méthode encore plus simple pour certains modèles récents (`gpt-4o-2024-08-06`).

```python
class Step(BaseModel):
    explanation: str
    output: str

class MathReasoning(BaseModel):
    steps: list[Step]
    final_answer: str

completion = client.beta.chat.completions.parse(
    model="gpt-4o-2024-08-06",
    messages=[
        {"role": "system", "content": "Tu es un tuteur de maths."},
        {"role": "user", "content": "Combien font 8x3 + 2 ?"},
    ],
    response_format=MathReasoning, # On passe directement la classe Pydantic !
)

math_response = completion.choices[0].message.parsed
print(math_response.final_answer)
```

## Résumé

| Méthode | Usage | Fiabilité |
|---------|-------|-----------|
| **Prompt seul** | Prototypage rapide | ⚠️ Faible |
| **JSON Mode** | Si le schéma est flexible | ✅ Moyenne |
| **Function Calling** | Production (compatibilité max) | 🛡️ Haute |
| **Structured Outputs** | Production (modèles récents) | 🛡️🛡️ Maximale |
