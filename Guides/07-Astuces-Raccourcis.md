# ⚡ Astuces & Raccourcis

## Raccourcis de Prompting

### 1. Le Format "Tu es..."
```
Tu es un [EXPERT] avec [X] ans d'expérience.
→ Active le "mode expert" du modèle
```

### 2. Le "Step by Step" Magique
```
"Réfléchis étape par étape"
→ Améliore le raisonnement de 20-30%
```

### 3. Take a Deep Breath
```
"Prends une grande respiration et réfléchis"
→ Améliore la qualité (testé par Google)
```

### 4. L'Astuce du Format
```
"Réponds en [format]"
→ JSON, Markdown, Tableau, Bullet points, Code
```

### 5. Le Garde-Fou
```
"Si tu n'es pas sûr, dis-le"
→ Réduit les hallucinations
```

---

## Templates Express

### Question Factuelle
```
[Question] ?
Réponds en 3 phrases maximum avec sources si possible.
```

### Résumé Rapide
```
Résume en 5 bullet points :
[Texte]
```

### Comparaison
```
Compare [A] et [B] dans un tableau avec ces critères :
- [Critère 1]
- [Critère 2]
```

### Explication Adaptée
```
Explique [concept] comme si j'avais [âge] ans.
```

### Revue de Code Express
```
Revois ce code. Note /10 et top 3 améliorations :
[code]
```

---

## Symboles Utiles dans les Prompts

| Symbole | Usage | Exemple |
|---------|-------|---------|
| `[VAR]` | Variable à remplacer | `[NOM]` |
| `{opt}` | Optionnel | `{si applicable}` |
| `"""` | Délimiteur de contenu | `"""texte"""` |
| `###` | Séparateur de sections | `### Instructions` |
| `→` | Implique/résulte | `Input → Output` |
| `1. 2. 3.` | Numérotation | Structure la sortie |
| `- ` | Bullet points | Liste non ordonnée |
| `✅ ❌` | Validation | Do's and Don'ts |

---

## Patterns Efficaces

### Le Sandwich
```
[Contexte]
[Tâche]
[Format attendu]
```

### Le Few-Shot Express
```
Fais comme ces exemples :
Ex1: [input] → [output]
Ex2: [input] → [output]

Maintenant : [mon input]
```

### La Contrainte Inversée
```
Tu NE DOIS PAS :
- Inventer de faits
- Dépasser 200 mots
- Utiliser de jargon
```

### Le Persona Combo
```
Tu es un [rôle] qui parle comme [style].
Exemple : "Tu es un prof de maths qui explique avec humour."
```

---

## Paramètres Rapides

| Besoin | Temperature |
|--------|-------------|
| Code, faits | 0 |
| Général | 0.5 |
| Créatif | 0.8-1 |

---

## Copy-Paste Utiles

### Stopper les Hallucinations
```
Utilise uniquement les informations fournies. Si tu ne sais pas, réponds "Je n'ai pas cette information".
```

### Forcer la Structure
```
Format ta réponse exactement ainsi :
## Titre
[contenu]
### Sous-section
[contenu]
```

### Demander des Alternatives
```
Propose 3 options :
1. Conservatrice
2. Équilibrée
3. Audacieuse
```

### Auto-Critique
```
Après ta réponse, liste 3 limites ou points d'amélioration possibles.
```

---

## Astuces Avancées

### 1. Le "Markdown Invisible"
Utilisez des commentaires HTML pour des instructions cachées :
```html
<!-- Ignore si non pertinent -->
```

### 2. La Technique du "Thinking Out Loud"
```
Avant de répondre, montre ton raisonnement :
PENSÉE : [ton analyse]
RÉPONSE : [la réponse finale]
```

### 3. Le Role Stacking
```
Tu es à la fois un expert [A] et un [B].
Réponds du point de vue des deux.
```

### 4. La Version Courte d'abord
```
D'abord, réponds en 1 phrase.
Puis développe si nécessaire.
```
