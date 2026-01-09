# 02 - Régression et Classification : Les Piliers du Supervisé

![Régression Linéaire Artistique](..\assets\images\regression-curve.png)

Ces deux familles d'algorithmes représentent probablement 70% des cas d'usage réels du Machine Learning en entreprise aujourd'hui.

---

## 1. La Régression (Prédire une Valeur Continue)

La régression consiste à prédire une variable numérique continue (prix, température, durée, vent).

### 🏛️ Origine Scientifique
La **Méthode des Moindres Carrés** a été publiée par **Adrien-Marie Legendre** (1805) et **Carl Friedrich Gauss** (1809) pour prédire les orbites des planètes. C'était du Machine Learning avant l'heure !

### 🧠 L'Algorithme Roi : La Régression Linéaire
Le modèle le plus simple mais incroyablement puissant pour comprendre les tendances.
$$y = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + ... + \epsilon$$

L'algorithme doit trouver les paramètres $\beta$ (les poids) qui minimisent l'écart entre la ligne tracée et les points réels.
Pour cela, on utilise souvent l'algorithme de la **Descente de Gradient** : on glisse le long de la courbe d'erreur jusqu'à trouver le point le plus bas (l'erreur minimale).

#### 🧮 La Descente de Gradient (Gradient Descent)
Formule de mise à jour des poids :
$$\theta_j := \theta_j - \alpha \frac{\partial}{\partial \theta_j} J(\theta)$$
*   $\theta$ : le poids à ajuster.
*   $\alpha$ : le Learning Rate (vitesse d'apprentissage). Si trop grand, on rate le minimum ; si trop petit, c'est trop lent.
*   $J(\theta)$ : la fonction d'erreur (Coût).

### 🏢 Cas d'Usage Entreprise
1.  **Immobilier (Zillow)** : Estimation du prix des maisons (Zestimate). Variables : surface, quartier, nombre de chambres.
2.  **Assurance (AXA)** : Calcul du montant des sinistres attendus pour ajuster les primes.
3.  **Aéronautique (Safran/GE)** : *Predictive Maintenance*. Régression pour prédire le "Remaining Useful Life" (RUL) d'une pièce moteur avant panne.

---

## 2. La Classification (Prédire une Classe)

La classification consiste à prédire une étiquette discrète (Oui/Non, Chien/Chat, Spam/Pas Spam).

### 🏛️ Origine Scientifique
La **Régression Logistique** a été développée au milieu du XXe siècle pour les sciences biologiques. Malgré son nom "Régression", c'est un classifieur !

### 🧠 L'Algorithme Roi : La Régression Logistique
Elle utilise la fonction **Sigmoïde** (ou Logit) pour écraser une sortie linéaire entre 0 et 1, ce qui nous donne une probabilité.

#### La Fonction Sigmoïde
$$P(y=1|x) = \sigma(z) = \frac{1}{1 + e^{-z}}$$
Où $z = w^T x + b$.
*   Si le résultat est > 0.5, on classe en "Positif".
*   Si le résultat est < 0.5, on classe en "Négatif".

### 🧠 Autres Algorithmes Célèbres
1.  **SVM (Support Vector Machines)** : Très populaire années 90/2000. Cherche l'hyperplan qui sépare les données avec la plus grande marge  ("l'autoroute la plus large possible entre les deux classes").
2.  **Arbres de Décision (Decision Trees)** : Série de questions "Si X > 5 alors...". Très interprétable.
3.  **Random Forest** : On prend 100 arbres de décision et on les fait voter. C'est du "Bagging" (Bootstrap Aggregating). Très robuste.

### 🏢 Cas d'Usage Entreprise (Classification)
1.  **Banque (Credit Agricole)** : **Credit Scoring**. Le client va-t-il faire défaut ? (Oui/Non). Modèle : Souvent Régression Logistique ou Random Forest car *explicable* (régulation oblige).
2.  **E-commerce (Cdiscount)** : **Churn Prediction**. Ce client va-t-il nous quitter le mois prochain ? (Oui/Non).
3.  **Santé** : Dépistage de maladies. À partir des symptômes X, le patient a-t-il la grippe ?

---

## Résumé : Quand utiliser quoi ?

| Problème | Type | Algorithme à tester en premier | Exemple |
| :--- | :--- | :--- | :--- |
| Prédire le chiffre d'affaires du mois prochain | **Régression** | Régression Linéaire, XGBoost | Valeur continue |
| Savoir si une transaction est frauduleuse | **Classification** | Random Forest, Régression Logistique | Binaire (0/1) |
| Identifier de quel chiffre manuscrit il s'agit (0-9) | **Classification Multi-classe** | Réseau de Neurones (CNN), SVM | Catégorique (10 classes) |
