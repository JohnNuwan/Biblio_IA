# 01 - Les Réseaux de Neurones Composants de Base

![Neural Network Schematic](..\assets\images\neural-network.png)

Bienvenue sous, capot. Ici, on quitte les statistiques classiques pour entrer dans le **biomimétisme mathématique** qui a permis l'émergence de ChatGPT.

---

## 1. Le Neurone Artificiel (Le Perceptron)

C'est l'unité atomique.

### 📜 Origine & Histoire
Inventé par **Frank Rosenblatt** en **1957** au Cornell Aeronautical Laboratory. C'était une machine physique (le Mark I Perceptron), câblée manuellement !
L'idée était de reproduire le fonctionnement d'un neurone biologique : recevoir des signaux électriques (inputs), les sommer, et "tirer" (fire) un signal de sortie si un seuil est dépassé.

### 🧮 La Mathématique du Neurone
Un neurone fait une opération très simple. Il reçoit des entrées $x$, chacune multipliée par un poids $w$ (l'importance de l'entrée), et ajoute un biais $b$.

$$z = \sum (w_i \cdot x_i) + b$$
$$z = w_1 x_1 + w_2 x_2 + ... + w_n x_n + b$$

Puis, il passe ce résultat $z$ dans une **Fonction d'Activation** $\sigma(z)$ pour décider de la sortie $a$.
$$a = \sigma(z)$$

---

## 2. Les Fonctions d'Activation (Donner vie à la non-linéarité)

Sans elles, un réseau de neurones (même immense) ne serait qu'une grosse régression linéaire. Elles introduisent la **non-linéarité**, permettant d'apprendre des courbes complexes.

### 🔹 Sigmoïde (La vieille école)
$$\sigma(z) = \frac{1}{1 + e^{-z}}$$
*   Écrase tout entre 0 et 1.
*   **Problème** : "Vanishing Gradient" (l'apprentissage s'arrête si les valeurs sont trop grandes). Peu utilisée aujourd'hui dans les couches cachées.

### 🔹 ReLU (Rectified Linear Unit) - Le standard actuel
$$f(x) = \max(0, x)$$
*   Si c'est négatif, ça vaut 0 (neurone éteint).
*   Si c'est positif, on garde la valeur.
*   **Pourquoi ça marche ?** : C'est extrêmement rapide à calculer et ça résout le problème du gradient qui disparaît. C'est le moteur des LLMs modernes.

---

## 3. Le Réseau (Multi-Layer Perceptron - MLP)

On empile ces neurones en couches :
1.  **Input Layer** : Les données brutes (les pixels d'une image, les mots d'une phrase).
2.  **Hidden Layers** : C'est là que la "magie" opère. Chaque couche détecte des motifs de plus en plus complexes (bords -> formes -> yeux -> visages).
3.  **Output Layer** : La décision finale (Chat/Chien).

---

## 4. Comment ça apprend ? (Backpropagation)

C'est LA révolution qui a tout débloqué dans les années 80 (popularisée par **Hinton, LeCun, Bengio**).

### Le cycle d'apprentissage en 4 étapes :
1.  **Forward Pass (Prédiction)** : On fait passer les données dans le réseau. Le réseau dit "C'est un Chat (80%)".
2.  **Calcul de l'Erreur (Loss)** : On compare avec la réalité (C'était un Chien). L'erreur est grande.
3.  **Backward Pass (Backpropagation)** : C'est l'étape cruciale. On remonte le réseau **à l'envers** (de la sortie vers l'entrée) pour trouver *qui* est responsable de l'erreur.
    *   "Neurone A, tu as trop crié 'Chat', baisse un peu ton poids."
    *   "Neurone B, tu étais éteint alors qu'il fallait t'allumer, augmente ton poids."
    *   Mathématiquement, on utilise la **Règle de la Chaîne (Chain Rule)** pour calculer le gradient : $\frac{\partial Loss}{\partial w}$.
4.  **Mise à jour (Optimizer)** : On modifie légèrement tous les poids ($w$) pour réduire l'erreur (via la Descente de Gradient).

### 🏢 Cas d'Usage
Avant les Transformers (2017), ces réseaux (CNN, RNN) ont révolutionné :
*   **La Poste** : Lecture automatique des codes postaux manuscrits (Yann LeCun, 1989).
*   **Siri / Alexa** : Reconnaissance vocale (RNN / LSTM).
*   **Facebook** : Tagging automatique des visages sur les photos.
