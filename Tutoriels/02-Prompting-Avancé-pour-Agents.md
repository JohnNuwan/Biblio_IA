# 🧠 Tutoriel 2 : Prompting Avancé pour Agents IA

Un Agent n'est aussi intelligent que les instructions qu'on lui donne. Contrairement à un simple Chatbot, un Agent a besoin d'instructions **extrêmement précises** (System Prompts) pour manipuler des outils sans tout casser.

## 1. L'Anatomie d'un System Prompt Robuste

Pour un Agent, le prompt système doit définir 4 piliers :
1. **Persona** : Qui il est (Expert, Support, Encodeur...).
2. **Objectif** : Ce qu'il doit accomplir globalement.
3. **Outils & Contraintes** : Comment utiliser les outils et ce qu'il est INTERDIT de faire.
4. **Format de Sortie** : JSON, ReAct, XML...

### Exemple de "Mauvais" Prompt
> "Tu es un assistant utile. Tu as accès à Google Search. Réponds aux questions."

❌ **Problème** : L'agent va "bavarder" au lieu d'agir. Il ne sait pas *quand* chercher.

### Exemple de "Bon" Prompt
> "Tu es un Analyste de Recherche Senior. Ton but est de fournir des réponses factuelles basées UNIQUEMENT sur des données récentes.
> Tu DOIS utiliser l'outil `google_search` si tu n'es pas sûr à 100% d'une information.
> NE réponds JAMAIS par tes propres connaissances pré-2023 sans vérifier.
> Réponds toujours en format Markdown structuré."

## 2. Décrire ses Outils (La partie la plus critique)

Les LLMs modernes (GPT-4) lisent la description de vos fonctions pour savoir quoi envoyer. Une description floue = des erreurs d'arguments.

### ❌ Description Floue
```python
def search_db(query):
    """Cherche dans la base de données."""
```
Le LLM ne sait pas : Quelle syntaxe ? SQL ? Mots-clés ? Id ?

### ✅ Description Optimisée pour Agent
```python
def search_db(user_id, status="active"):
    """
    Recherche les commandes d'un utilisateur spécifique.
    Args:
        user_id (str): L'ID unique (ex: 'USER_123'). Ne pas inventer d'ID.
        status (str): Filtre par statut ('active', 'shipped', 'cancelled'). Défaut: 'active'.
    Returns:
        JSON string des commandes trouvées.
    """
```
💡 **Astuce** : Donnez des exemples de valeurs dans la docstring. Le LLM les lira.

## 3. Techniques de Robustesse

### A. "Failsafe" (Gestion d'échec)
Dites à l'Agent quoi faire si un outil échoue.

> "Si l'outil `search_db` renvoie 'Erreur', N'INVENTE PAS de réponse. Dis à l'utilisateur que la base est inaccessible et propose de réessayer plus tard."

### B. "Chain of Verification"
Forcez l'agent à revérifier son plan.

> "Avant d'appeler un outil destructeur (ex: `delete_file`), tu DOIS générer une pensée 'Thought: Je vais supprimer X, est-ce bien demandé ?' et attendre une confirmation."

## 4. Structurer la Sortie (JSON Mode)

Pour intégrer un agent dans une app, le texte libre est un cauchemar. Forcez le JSON.

```json
SYSTEM PROMPT ADDITION:
Tes réponses finales doivent être au format JSON strict :
{
  "thought": "Ton raisonnement ici",
  "action_needed": true/false,
  "response": "Texte pour l'utilisateur"
}
```

## Exercice Pratique

Reprenez l'agent du Tutoriel 1 et modifiez le `SYSTEM_PROMPT` pour qu'il refuse de répondre aux questions sur la politique, et qu'il réponde toujours en rimes.

C'est le pouvoir du Prompting Agentique : **Le code reste le même, mais le comportement change radicalement juste avec du texte.**
