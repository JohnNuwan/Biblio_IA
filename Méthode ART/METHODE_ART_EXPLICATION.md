# LA MÉTHODE ART (Automatic Reasoning and Tool-use)
### Guide de Référence pour la Sélection Automatique d'Outils

## 1. Qu'est-ce que ART ?

**ART** permet au LLM de **choisir automatiquement** quels outils utiliser et dans quel ordre pour résoudre une tâche.

Son principe fondateur est le **"Right Tool for the Job"** (Le bon outil pour le travail).
* **Règle d'or :** Laisser l'agent décider des outils.
* **Communication :** Analyse → Sélection → Exécution.

---

## 2. Le Workflow ART

```
📥 TÂCHE
     │
     ▼
🧠 ANALYSEUR ──► Comprend ce qu'il faut faire
     │
     ▼
🔧 CATALOGUE D'OUTILS
     │
     ▼
✅ SÉLECTIONNEUR ──► Choisit les outils
     │
     ▼
📋 PLANIFICATEUR ──► Ordonne les appels
     │
     ▼
⚡ EXÉCUTEUR ──► Appelle les outils
     │
     ▼
📤 RÉSULTAT
```

---

## 3. Catalogue d'Outils (Exemple)

```
OUTILS DISPONIBLES:
- search(query) : Recherche web
- calculate(expr) : Calcul mathématique
- read_file(path) : Lire un fichier
- write_file(path, content) : Écrire un fichier
- run_code(code) : Exécuter du code
- send_email(to, subject, body) : Envoyer email
```

---

## 4. Agent Sélectionneur ART

```
## Format de Sortie

### 🔧 SÉLECTION D'OUTILS

**Tâche :** [Description]

**Analyse :**
- Type : [Recherche/Calcul/Fichier/...]
- Complexité : [Simple/Composée]

**Outils sélectionnés :**
| # | Outil | Paramètres | Raison |
|---|-------|------------|--------|
| 1 | [tool1] | [params] | [Pourquoi] |
| 2 | [tool2] | [params] | [Pourquoi] |

**Plan d'exécution :**
1. [Appel 1] → résultat A
2. [Appel 2 avec A] → résultat B
...

**Résultat attendu :**
[Ce qu'on devrait obtenir]
```

---

## 5. Exemple

**Tâche :** "Combien coûte l'essence aujourd'hui à Paris et calcule le coût pour 500km"

### 🔧 SÉLECTION D'OUTILS

**Analyse :**
- Type : Recherche + Calcul
- Complexité : Composée

**Outils sélectionnés :**
| # | Outil | Paramètres | Raison |
|---|-------|------------|--------|
| 1 | search | "prix essence Paris aujourd'hui" | Obtenir le prix actuel |
| 2 | calculate | "prix * (500/conso)" | Calculer le coût |

**Plan d'exécution :**
1. search("prix essence Paris") → 1.85€/L
2. calculate("1.85 * (500/7)") → 132.14€

---

## 6. Quand l'utiliser ?

- Agents autonomes
- Tâches variées nécessitant différents outils
- Automatisation de workflows
