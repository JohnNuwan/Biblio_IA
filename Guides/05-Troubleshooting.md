# ⚠️ Troubleshooting - Problèmes Courants et Solutions

## 1. Le LLM ne comprend pas ma demande

### Symptômes
- Réponses hors sujet
- Le modèle demande des clarifications

### Solutions
| Cause | Solution |
|-------|----------|
| Prompt trop vague | Ajouter du contexte et des détails |
| Instructions ambiguës | Reformuler avec des exemples |
| Trop de demandes à la fois | Découper en plusieurs prompts |
| Jargon incompris | Définir les termes spécifiques |

### Exemple
❌ "Explique le truc"
✅ "Explique le concept de RAG (Retrieval-Augmented Generation) à un développeur junior en 5 points"

---

## 2. Le LLM hallucine (invente des faits)

### Symptômes
- Dates/chiffres incorrects
- Citations inventées
- Affirmations confidentes mais fausses

### Solutions
| Technique | Comment |
|-----------|---------|
| Demander des sources | "Cite tes sources" |
| Utiliser CRITIC | Auto-vérification |
| Utiliser RAG | Ancrer dans des documents |
| Self-Consistency | Voter entre plusieurs réponses |
| Limiter le scope | "Réponds uniquement si tu es sûr" |

---

## 3. Les réponses sont trop longues/courtes

### Symptômes
- Réponses interminables
- Réponses trop brèves

### Solutions
```
TROP LONG → Ajouter : "Maximum [X] mots/phrases"
                      "Sois concis"
                      "Format bullet points"

TROP COURT → Ajouter : "Développe en détail"
                       "Minimum [X] paragraphes"
                       "Avec exemples"
```

---

## 4. Le modèle refuse de répondre

### Symptômes
- "Je ne peux pas aider avec ça"
- Refus pour raisons de sécurité

### Solutions
| Situation | Approche |
|-----------|----------|
| Faux positif de sécurité | Reformuler de façon plus neutre |
| Contenu sensible légitime | Préciser le contexte professionnel |
| Limite du modèle | Changer de modèle ou d'approche |

### Exemple
❌ "Comment hacker un système ?"
✅ "En tant que responsable sécurité, quelles failles dois-je auditer ?"

---

## 5. Le contexte est "oublié"

### Symptômes
- Le modèle oublie des infos données plus tôt
- Incohérences dans les réponses

### Solutions
| Cause | Solution |
|-------|----------|
| Conversation trop longue | Résumer le contexte clé |
| Context window dépassé | Utiliser RAG pour les docs |
| Pas de rappel | Rappeler les points importants |

### Technique
```
Rappel du contexte :
- Nous travaillons sur [PROJET]
- Tu es [RÔLE]
- Jusqu'ici nous avons [RÉSUMÉ]
```

---

## 6. Le code généré ne fonctionne pas

### Symptômes
- Erreurs de syntaxe
- Imports manquants
- Logique incorrecte

### Solutions
| Technique | Comment |
|-----------|---------|
| Préciser la version | "Python 3.11", "React 18" |
| Demander explication | "Explique chaque ligne" |
| Utiliser Reflexion | Itérer sur les erreurs |
| Fournir le contexte | Montrer le code existant |
| Demander des tests | "Ajoute des tests unitaires" |

---

## 7. Résultats incohérents

### Symptômes
- Différentes réponses à la même question
- Le modèle se contredit

### Solutions
| Paramètre | Ajustement |
|-----------|------------|
| Temperature | Baisser vers 0 pour plus de cohérence |
| Self-Consistency | Générer plusieurs réponses et voter |
| System Prompt | Fixer les règles au début |

---

## 8. Le modèle est trop lent

### Symptômes
- Temps de réponse élevé
- Timeout

### Solutions
| Cause | Solution |
|-------|----------|
| Prompt trop long | Réduire le contexte |
| Output trop long | Limiter la taille |
| Modèle trop puissant | Utiliser un modèle plus léger |
| Streaming désactivé | Activer le streaming |

---

## Checklist Diagnostic

```
□ Le prompt est-il clair et spécifique ?
□ Le format de sortie est-il défini ?
□ Le contexte est-il suffisant ?
□ Le modèle est-il adapté à la tâche ?
□ Les paramètres sont-ils corrects (temperature) ?
□ Ai-je testé avec des exemples ?
```
