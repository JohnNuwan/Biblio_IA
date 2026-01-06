# LA MÉTHODE Prompt Chaining
### Guide de Référence pour l'Enchaînement de Prompts

## 1. Qu'est-ce que Prompt Chaining ?

**Prompt Chaining** divise une tâche complexe en **plusieurs prompts séquentiels**, où la sortie de l'un devient l'entrée du suivant.

Son principe fondateur est le **"Pipeline"** (Chaîne de traitement).
* **Règle d'or :** Chaque prompt fait une seule chose bien.
* **Communication :** Output → Input → Output → ...

---

## 2. Le Workflow

```
📥 TÂCHE COMPLEXE
     │
     ▼
🔗 PROMPT 1 ──► Output 1
     │
     ▼
🔗 PROMPT 2 (Input: Output 1) ──► Output 2
     │
     ▼
🔗 PROMPT 3 (Input: Output 2) ──► Output 3
     │
     ▼
📤 RÉSULTAT FINAL
```

---

## 3. Exemple : Création d'un article

**Chaîne :**
1. **Prompt 1** : Génère un plan (5 sections)
2. **Prompt 2** : Développe la section 1
3. **Prompt 3** : Développe la section 2
4. ... 
5. **Prompt N** : Assemble et peaufine

---

## 4. Agent Orchestrateur

```
## Format de Sortie

### 🔗 CHAÎNE DE PROMPTS

**Tâche :** [Description]

**Décomposition en chaîne :**

| # | Prompt | Input | Output |
|---|--------|-------|--------|
| 1 | [Description] | [Tâche originale] | [Quoi] |
| 2 | [Description] | [Output 1] | [Quoi] |
...

**Dépendances :**
1 → 2 → 3 → ...

**Prompts détaillés :**

### Prompt 1
```
[Contenu du prompt]
```

### Prompt 2
```
[Contenu utilisant {{output_1}}]
```
```

---

## 5. Quand l'utiliser ?

- Tâches trop complexes pour un seul prompt
- Besoin de contrôle à chaque étape
- Workflows reproductibles
