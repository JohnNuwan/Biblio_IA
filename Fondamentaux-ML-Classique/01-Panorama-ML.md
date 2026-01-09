# 01 - Panorama des Types d'Apprentissage Machine (Machine Learning)

![Panorama ML Types](..\assets\images\ml-panorama.png)

Ce guide pose les fondations indispensables pour comprendre l'écosystème IA. Avant de parler de "Prompt Engineering" ou de "Transformers", il faut comprendre les paradigmes qui régissent l'apprentissage des machines depuis les années 1950.

---

## 1. L'Apprentissage Supervisé (Supervised Learning)

C'est le paradigme le plus répandu et le plus mature industriellement.

### 📜 Origine & Histoire
Le concept remonte aux travaux de **Frank Rosenblatt** avec le **Perceptron (1957)**, bien que les méthodes statistiques sous-jacentes (comme la régression linéaire) datent de **Gauss** et **Legendre** (début XIXe siècle). L'idée est simple : l'humain enseigne à la machine par l'exemple.

### 🎯 Le Problème Résolu
Comment automatiser une décision ou une prédiction quand on dispose d'un historique de données fiables (Vérité Terrain / Ground Truth) ?
*   "Voici 10 000 emails, ceux marqués 'spam' et ceux marqués 'non-spam'. Apprends à classer le 10 001ème."

### 🧮 Le Concept Mathématique
On cherche à approximer une fonction $f$ telle que $Y = f(X) + \epsilon$ (où $\epsilon$ est l'erreur irréductible).
On dispose d'un dataset $D = \{(x_1, y_1), (x_2, y_2), ..., (x_n, y_n)\}$ où $x$ est l'entrée (features) et $y$ la sortie attendue (label).
L'objectif est de minimiser une **Fonction de Coût (Loss Function)**, par exemple l'erreur quadratique moyenne (MSE) :
$$MSE = \frac{1}{n} \sum_{i=1}^{n} (y_i - \hat{y}_i)^2$$

### 🏢 Qui l'utilise ?
- **Banques (JPMorgan, HSBC)** : Scoring de crédit, détection de fraude.
- **Médecine (IBM Watson Health)** : Diagnostic à partir d'imageries (Classification Tumeur bénigne/maligne).
- **Email Providers (Gmail)** : Filtrage anti-spam.

---

## 2. L'Apprentissage Non-Supervisé (Unsupervised Learning)

Ici, la machine est livrée à elle-même face à des données brutes, sans étiquettes.

### 📜 Origine & Histoire
Popularisé dans les années 60-70 pour l'analyse exploratoire de données. Les algorithmes de **Clustering** comme **K-Means** (proposé par Stuart Lloyd en 1957) sont des piliers.

### 🎯 Le Problème Résolu
Comment trouver une structure cachée, des motifs ou des anomalies dans des données que personne n'a triées ?
*   "Voici les comportements d'achat de 1 million de clients. Regroupe-les par types de profils, sans que je te dise quels sont ces profils."

### 🧮 Le Concept Mathématique
Il n'y a pas de $y$ (label). On cherche à modéliser la distribution de probabilité $P(X)$.
Pour le **Clustering (K-Means)**, on cherche à minimiser l'inertie intra-classe (la distance entre les points et le centre de leur groupe) :
$$J = \sum_{j=1}^{k} \sum_{i=1}^{n} ||x_i^{(j)} - \mu_j||^2$$
Où $\mu_j$ est le centre du cluster $j$.

### 🏢 Qui l'utilise ?
- **Netflix / Amazon** : Systèmes de recommandation (filtrage collaboratif "Ceux qui ont acheté A ont aussi acheté B").
- **Cybersécurité (Darktrace)** : Détection d'anomalies réseau (détecter un comportement qui s'éloigne de la "norme" apprise, sans savoir à quoi ressemble une attaque précise).
- **Marketing** : Segmentation client automatique.

---

## 3. L'Apprentissage par Renforcement (Reinforcement Learning - RL)

C'est l'apprentissage par l'expérience, inspiré de la psychologie comportementale.

### 📜 Origine & Histoire
Inspiré par les travaux sur le conditionnement animal (Pavlov, Skinner). Formalisé mathématiquement par **Richard Bellman** (années 50) avec les **Processus de Décision Markoviens (MDP)**. A explosé médiatiquement avec **DeepMind** (AlphaGo) en 2016.

### 🎯 Le Problème Résolu
Comment apprendre à prendre une suite de décisions complexes pour atteindre un but lointain, dans un environnement incertain ?
*   "Apprends à piloter cet hélicoptère. Si tu te crashes, c'est mal (-1000 points). Si tu restes stable, c'est bien (+1 point)."

### 🧮 Le Concept Mathématique
Un **Agent** interagit avec un **Environnement**.
- À l'état $s_t$, il choisit une action $a_t$.
- Il reçoit une récompense $r_{t+1}$ et passe à l'état $s_{t+1}$.
Il cherche à maximiser le **Retour cumulé espéré** (la somme des récompenses futures) :
$$G_t = r_{t+1} + \gamma r_{t+2} + \gamma^2 r_{t+3} + ... = \sum_{k=0}^{\infty} \gamma^k r_{t+k+1}$$
(Où $\gamma$ est le facteur d'actualisation entre 0 et 1 : préfère-t-on le gain immédiat ou futur ?).

### 🏢 Qui l'utilise ?
- **Tesla (Autopilot)** : Navigation et décision de conduite.
- **Google (DeepMind)** : Optimisation du refroidissement des Data Centers (40% d'économie d'énergie).
- **Finance (Citadel, Two Sigma)** : Trading algorithmique (apprendre à exécuter des ordres pour maximiser le profit sans perturber le marché).
- **Robotique (Boston Dynamics)** : Locomotion et équilibre des robots.

---

## Résumé Comparatif

| Type | Données | Objectif | Exemple mathématique | Analogie Humaine |
| :--- | :--- | :--- | :--- | :--- |
| **Supervisé** | Étiquetées $(X, y)$ | Prédire $y$ | Minimiser l'erreur $(y - \hat{y})^2$ | Un élève apprend avec un prof qui corrige chaque exercice. |
| **Non-Supervisé** | Brutes $(X)$ | Trouver une structure | Minimiser la distance intra-groupe | Un explorateur découvre une nouvelle langue et essaie d'en déduire la grammaire tout seul. |
| **Renforcement** | États/Actions/Récompenses | Maximiser le gain | Équation de Bellman | Un bébé apprend à marcher : il tombe (douleur), se relève, marche (joie). |
