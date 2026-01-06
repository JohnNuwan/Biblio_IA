# 🚀 Guide de Démarrage avec les LLMs

## Introduction

Ce guide vous aidera à **maîtriser les LLMs** (Large Language Models) et à utiliser efficacement cette bibliothèque.

---

## 1. Comprendre les Bases

### Qu'est-ce qu'un LLM ?
Un **Large Language Model** est un modèle d'IA entraîné sur des milliards de textes. Il peut :
- Générer du texte
- Répondre à des questions
- Résumer, traduire, coder
- Raisonner (avec les bonnes techniques)

### Principaux LLMs
| LLM | Éditeur | Forces |
|-----|---------|--------|
| GPT-4 | OpenAI | Polyvalent, code |
| Claude | Anthropic | Long contexte, sécurité |
| Gemini | Google | Multimodal |
| Llama | Meta | Open source |
| Mistral | Mistral AI | Performance/coût |

---

## 2. Écrire un Bon Prompt

### Les 5 Règles d'Or

1. **Soyez spécifique**
   - ❌ "Écris un email"
   - ✅ "Écris un email professionnel pour relancer un client qui n'a pas payé depuis 30 jours"

2. **Donnez du contexte**
   - Qui êtes-vous ? Qui est l'audience ?
   - Quel est le but ?

3. **Définissez le format de sortie**
   - "Réponds en bullet points"
   - "Utilise un tableau"
   - "Maximum 200 mots"

4. **Utilisez des exemples (few-shot)**
   - Montrez ce que vous voulez obtenir

5. **Itérez**
   - Le premier prompt n'est jamais parfait
   - Affinez selon les résultats

### Structure Type

```
Tu es un [RÔLE] expert en [DOMAINE].

Contexte : [SITUATION]

Tâche : [CE QUE TU VEUX]

Contraintes :
- [Règle 1]
- [Règle 2]

Format de sortie : [STRUCTURE]
```

---

## 3. Quand Utiliser Quelle Méthode ?

| Situation | Méthode Recommandée |
|-----------|---------------------|
| Calcul, logique | Chain-of-Thought |
| Recherche + action | ReAct |
| Exploration créative | Tree-of-Thoughts |
| Précision critique | Self-Consistency |
| Vérification de faits | CRITIC |
| Code/debugging | Reflexion |
| Contenu long | Skeleton-of-Thought |
| Base documentaire | RAG |
| Projet complet | BMAD |

---

## 4. Erreurs Courantes à Éviter

### ❌ Prompts trop vagues
"Aide-moi" → Le LLM ne sait pas quoi faire

### ❌ Trop d'instructions à la fois
Le LLM peut en oublier → Chaînez les prompts

### ❌ Attendre la perfection du premier coup
Itérez et affinez

### ❌ Faire confiance aveuglément
Vérifiez les faits, surtout pour les dates et chiffres

### ❌ Ignorer le contexte
Rappeler le contexte dans les longues conversations

---

## 5. Workflow Recommandé

```
1. DÉFINIR le besoin clairement
        │
        ▼
2. CHOISIR la méthode adaptée
        │
        ▼
3. SÉLECTIONNER un prompt de la bibliothèque
        │
        ▼
4. PERSONNALISER avec votre contexte
        │
        ▼
5. EXÉCUTER et ANALYSER le résultat
        │
        ▼
6. ITÉRER si nécessaire
```

---

## 6. Ressources de cette Bibliothèque

| Dossier | Contenu |
|---------|---------|
| `Méthode X/` | 22 méthodes avec agents |
| `Bibliothèque-Prompts/` | 234 prompts métiers |
| `Guides/` | Ce guide et autres ressources |
