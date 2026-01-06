# 🧠 Prompts Méta-Prompting

Prompts pour **créer, améliorer et optimiser** d'autres prompts.

---

## 1. Création de Prompt

```
Crée un prompt efficace pour : [OBJECTIF]

**Contexte d'utilisation :**
- LLM cible : [GPT-4 / Claude / Gemini / ...]
- Fréquence : [Ponctuel / Répétitif]
- Utilisateur : [Expert / Novice]

**Résultat attendu :**
[DESCRIPTION DU OUTPUT SOUHAITÉ]

Applique les bonnes pratiques :
1. Instructions claires
2. Format de sortie défini
3. Exemples si nécessaire
4. Contraintes explicites
```

---

## 2. Amélioration de Prompt

```
Améliore ce prompt pour de meilleurs résultats.

**Prompt actuel :**
```
[PROMPT À AMÉLIORER]
```

**Problèmes constatés :**
- [Ce qui ne fonctionne pas]

**Résultat souhaité :**
- [Ce qu'on veut obtenir]

Propose :
1. Version améliorée
2. Explication des changements
3. Techniques appliquées (CoT, few-shot, ...)
```

---

## 3. Prompt System (Agent)

```
Crée un prompt système pour un agent spécialisé.

**Rôle de l'agent :** [DESCRIPTION]
**Domaine :** [EXPERTISE]
**Tâches principales :**
1. [Tâche 1]
2. [Tâche 2]

**Contraintes :**
- [Règle 1]
- [Règle 2]

**Format de sortie :** [STRUCTURE]

Génère un prompt système complet et structuré.
```

---

## 4. Few-Shot Examples

```
Génère des exemples few-shot pour ce prompt.

**Prompt :**
```
[PROMPT]
```

**Nombre d'exemples :** [2-5]
**Variété :** [Cas simples + complexes]

Format :
### Exemple 1
**Input :** [Entrée exemple]
**Output :** [Sortie attendue]

[Répéter]
```

---

## 5. Évaluation de Prompt

```
Évalue ce prompt selon les critères de qualité.

**Prompt à évaluer :**
```
[PROMPT]
```

**Critères :**
| Critère | Score (1-5) | Commentaire |
|---------|-------------|-------------|
| Clarté | | |
| Spécificité | | |
| Format output | | |
| Gestion erreurs | | |
| Réutilisabilité | | |

**Score global :** /5
**Recommandations d'amélioration :**
```

---

## 6. Template de Prompt

```
Crée un template réutilisable pour : [TYPE DE TÂCHE]

**Cas d'usage :**
- [Usage 1]
- [Usage 2]

**Variables à définir :**
- [VAR_1] : [Description]
- [VAR_2] : [Description]

Le template doit être :
- Facile à remplir
- Flexible
- Documenté
```

---

## 7. Prompt Chaining Design

```
Conçois une chaîne de prompts pour : [TÂCHE COMPLEXE]

**Objectif final :** [RÉSULTAT]
**Étapes identifiées :** [LISTE]

Pour chaque étape :
| Étape | Input | Prompt (résumé) | Output |
|-------|-------|-----------------|--------|
| 1 | [Entrée] | [Description] | [Sortie] |
| 2 | {{output_1}} | [Description] | [Sortie] |
...

Fournis les prompts détaillés pour chaque étape.
```

---

## 8. Adaptation Multi-LLM

```
Adapte ce prompt pour différents LLMs.

**Prompt original :**
```
[PROMPT]
```

**LLMs cibles :**
- [ ] GPT-4
- [ ] Claude
- [ ] Gemini
- [ ] Llama

Propose des ajustements selon les spécificités de chaque modèle.
```

---

## 9. Debugging de Prompt

```
Diagnose pourquoi ce prompt ne fonctionne pas.

**Prompt :**
```
[PROMPT]
```

**Comportement actuel :**
[CE QUI SE PASSE]

**Comportement souhaité :**
[CE QU'ON VEUT]

**Exemples de mauvaises réponses :**
[EXEMPLES]

Analyse :
1. Causes probables
2. Corrections proposées
3. Tests à effectuer
```

---

## 10. Prompt Documentation

```
Documente ce prompt pour qu'il soit réutilisable par d'autres.

**Prompt :**
```
[PROMPT]
```

Documentation :
1. **Nom :** [Nom descriptif]
2. **Description :** [Ce qu'il fait]
3. **Cas d'usage :** [Quand l'utiliser]
4. **Variables :** [Liste et description]
5. **Exemple d'utilisation :** [Entrée/Sortie]
6. **Limitations :** [Ce qu'il ne fait pas]
7. **Tips :** [Conseils d'utilisation]
```
