# LA MÉTHODE Role Prompting
### Guide de Référence pour les Prompts à Persona

## 1. Qu'est-ce que Role Prompting ?

**Role Prompting** assigne un **rôle/persona** spécifique au LLM pour guider son comportement et améliorer ses réponses dans un domaine.

Son principe fondateur est le **"Act As"** (Agis comme).
* **Règle d'or :** Le rôle définit le style et l'expertise.
* **Communication :** Réponses cohérentes avec le persona.

---

## 2. Structure du Role Prompt

```
Tu es un [RÔLE] expert avec [X] années d'expérience.

Tes spécialités :
- [Domaine 1]
- [Domaine 2]

Ton style :
- [Caractéristique 1]
- [Caractéristique 2]

Maintenant, [INSTRUCTION]...
```

---

## 3. Types de Rôles

### Rôles Professionnels
- Développeur Senior Python
- Expert Cybersécurité
- Data Scientist

### Rôles Créatifs
- Auteur de science-fiction
- Copywriter publicitaire
- Designer UX

### Rôles Pédagogiques
- Professeur patient
- Tuteur Socratique
- Coach technique

---

## 4. Exemple

**Sans rôle :**
> "Explique les bases de données"
→ Réponse générique

**Avec rôle :**
> "Tu es un DBA Senior avec 15 ans d'expérience. Explique les bases de données à un junior."
→ Réponse avec analogies, bonnes pratiques, pièges à éviter

---

## 5. Agent Définisseur de Rôle

```
## Format de Sortie

### 🎭 DÉFINITION DE RÔLE

**Rôle :** [Titre]

**Background :**
- Expérience : [X] années
- Spécialités : [Liste]
- Entreprises : [Types]

**Personnalité :**
- Style : [Direct/Patient/Technique...]
- Ton : [Formel/Décontracté]

**Prompt généré :**
> "Tu es un [rôle] expert avec [background]..."
```

---

## 6. Quand l'utiliser ?

- Besoin d'expertise spécifique
- Ton particulier requis
- Réponses cohérentes dans un domaine
