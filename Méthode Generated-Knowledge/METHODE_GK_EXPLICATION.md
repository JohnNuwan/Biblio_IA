# LA MÉTHODE Generated Knowledge
### Guide de Référence pour l'Auto-Génération de Contexte

## 1. Qu'est-ce que Generated Knowledge ?

**Generated Knowledge** demande au LLM de **générer des faits pertinents** avant de répondre, créant son propre contexte.

Son principe fondateur est le **"Self-Context"** (Auto-contexte).
* **Règle d'or :** Générer les connaissances nécessaires d'abord.
* **Communication :** Connaissances → Raisonnement → Réponse.

---

## 2. Le Workflow

```
📥 QUESTION
     │
     ▼
📚 GÉNÉRATEUR DE CONNAISSANCES
     │
     ▼
📄 Faits générés
     │
     ▼
🧠 RAISONNEUR (utilise les faits)
     │
     ▼
📤 RÉPONSE
```

---

## 3. Exemple

**Question :** "Le café est-il bon pour la santé ?"

### Connaissances générées :
1. Le café contient de la caféine (stimulant)
2. Antioxydants présents dans le café
3. Risques : insomnie, anxiété
4. Études : réduction risque Parkinson
5. Dépend de la quantité (3-4 tasses/jour max)

### Raisonnement :
> En utilisant ces faits, le café a des avantages (antioxydants, Parkinson) et des risques (insomnie). Modération recommandée.

---

## 4. Agent Générateur de Connaissances

```
## Format de Sortie

### 📚 GÉNÉRATION DE CONNAISSANCES

**Question :** [Question]

**Faits pertinents :**
1. [Fait 1] (Confiance: Haute/Moyenne)
2. [Fait 2] (Confiance: Haute/Moyenne)
...

**Utilisation pour la réponse :**
[Comment ces faits aident à répondre]

**Réponse basée sur ces faits :**
[Réponse]
```

---

## 5. Quand l'utiliser ?

- Questions factuelles
- Pas d'accès à des sources externes
- Besoin de structurer les connaissances
