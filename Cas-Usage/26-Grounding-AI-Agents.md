# 🔌 Grounding AI Agents with a Governed Universal API Catalog

## 🌍 Contexte & Enjeux
L'hallucination est la maladie infantile des Agents. Un agent qui invente un stock produit ou un solde bancaire est dangereux.
Pour soigner ça, il faut du **Grounding** (Ancrage) : connecter l'agent à des sources de vérité tangibles.
Mais comment connecter un agent à 500 systèmes d'entreprise (SAP, Salesforce, Legacy) sans créer un plat de spaghettis ?
La réponse est le **Universal API Catalog** : un menu unique, gouverné, où l'agent vient "faire son marché" d'outils sécurisés.

---

## L'Architecture "Hub & Spoke"

Au lieu de connecter chaque agent à chaque base de données (n x n connexions), on crée une couche intermédiaire.
*   **L'Agent** ne voit que le Catalogue API (via OpenAPI/Swagger).
*   **L'API Gateway** gère l'auth, le rate limiting et la transformation.

### Le Rôle de la "Semantic Layer"
L'API technique s'appelle `GET /kna1/vbak`. L'agent ne comprend pas.
Le Catalogue ajoute une couche sémantique : `GetCustomerOrders(customerId)`.
C'est cette traduction (Grounding) qui rend le Legacy accessible à l'IA moderne.

---

## 🏢 Ils l'utilisent déjà

*   **MuleSoft (Salesforce)** : A lancé "MuleSoft AI Chain", permettant d'exposer n'importe quelle API d'entreprise comme un "Skill" pour les agents Einstein Copilot.
*   **Uber** : Utilise une "Metric Store" universelle. Si un agent demande "Quel est le revenu ?", il tape dans la définition unique et certifiée du revenu, pas dans une table SQL brute.
*   **Palantir** : Leur "Ontology" est un catalogue d'objets (Avion, Usine, Employé) qui sert de terrain de jeu sécurisé pour leurs agents AIP (Artificial Intelligence Platform).

## Conclusion
Un agent sans accès aux données réelles est un poète.
Un agent connecté à un Catalogue API gouverné est un **employé**.
Le Grounding est ce qui transforme le bavardage en business.
