# LA MÉTHODE Analogical Prompting
### Guide de Référence pour le Raisonnement par Analogie

## 1. Qu'est-ce que Analogical Prompting ?

**Analogical Prompting** résout les problèmes en trouvant et appliquant des **analogies** avec des situations connues.

Son principe fondateur est le **"Like This, Do That"** (Comme ceci, fais cela).
* **Règle d'or :** Trouver un problème similaire déjà résolu.
* **Communication :** Analogie → Transfert → Solution.

---

## 2. Le Workflow

```
📥 PROBLÈME NOUVEAU
     │
     ▼
🔍 CHERCHEUR D'ANALOGIES
     │
     ▼
📚 Problème similaire connu
     │
     ▼
🔄 TRANSFERT de la solution
     │
     ▼
📤 SOLUTION ADAPTÉE
```

---

## 3. Exemple

**Problème :** "Comment organiser une grande équipe de développement ?"

### Analogie trouvée :
> "C'est comme organiser une armée : divisions, bataillons, escouades"

### Transfert :
- Armée → Enterprise
- Division → Département
- Bataillon → Équipe
- Escouade → Squad

### Solution :
> Structurer en squads autonomes (7-9 personnes), regroupées en tribes.

---

## 4. Agent Analogiste

```
## Format de Sortie

### 🔄 ANALOGIE

**Problème :** [Description]

**Analogie trouvée :**
> "[Domaine source] : [Situation similaire]"

**Correspondances :**
| Problème | Analogie |
|----------|----------|
| [Élément 1] | [Équivalent] |
...

**Solution transférée :**
[Solution adaptée]

**Limites de l'analogie :**
[Ce qui ne se transfère pas]
```

---

## 5. Quand l'utiliser ?

- Problèmes nouveaux/inédits
- Besoin de créativité
- Explication pédagogique
