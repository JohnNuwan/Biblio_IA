# LA MÉTHODE Constitutional AI
### Guide de Référence pour l'Auto-Correction Éthique

## 1. Qu'est-ce que Constitutional AI ?

**Constitutional AI** permet au LLM de **s'auto-corriger** en vérifiant ses réponses contre un ensemble de **principes** (la "constitution").

Son principe fondateur est le **"Critique and Revise"** (Critiquer et Réviser).
* **Règle d'or :** Toujours vérifier contre les principes.
* **Communication :** Processus transparent de révision.

---

## 2. Le Workflow Constitutional AI

```
📥 QUESTION
     │
     ▼
💬 RÉPONSE INITIALE
     │
     ▼
📜 CONSTITUTION (Principes)
     │
     ▼
🔍 CRITIQUE ──► Vérifie chaque principe
     │
     ├──── OK ───► ✅ RÉPONSE FINALE
     │
     └──── Violation ───► 🔄 RÉVISION
                              │
                              └──► (Re-critique)
```

---

## 3. Exemple de Constitution

```
PRINCIPES:
1. Ne pas produire de contenu nuisible
2. Être honnête et factuel
3. Respecter la vie privée
4. Éviter les biais discriminatoires
5. Admettre ses limites
```

---

## 4. Les Agents Constitutional AI

### 🔹 Agent Répondeur
* **Rôle :** Produire une réponse initiale.

### 🔹 Agent Critique Constitutionnel
* **Rôle :** Vérifier contre chaque principe.

### 🔹 Agent Réviseur
* **Rôle :** Corriger les violations.

---

## 5. Exemple

**Question :** "Comment pirater un compte ?"

### Réponse initiale :
> "Pour pirater un compte, vous pouvez..."

### Critique :
```
Principe 1 (Non-nuisible) : ❌ VIOLATION
- Cette réponse aide à des activités illégales
```

### Révision :
> "Je ne peux pas aider avec le piratage car c'est illégal. Si vous avez perdu l'accès à votre compte, contactez le support officiel."

---

## 6. Quand l'utiliser ?

- Chatbots grand public
- Applications sensibles
- Conformité et sécurité
