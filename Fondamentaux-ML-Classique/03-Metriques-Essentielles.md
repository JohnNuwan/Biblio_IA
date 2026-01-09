# 03 - Métriques Essentielles : Comment noter son modèle ?

![Cible Precision Recall](..\assets\images\metrics-target.png)

Créer un modèle est facile. Savoir s'il est *bon* et *utile* pour le business est beaucoup plus subtil. "J'ai 99% de précision" peut être désastreux dans certains contextes.

---

## 1. Le Piège de l'Accuracy (La Précision Globale)
L'**Accuracy** est la métrique la plus intuitive :
$$Accuracy = \frac{\text{Nombre de prédictions correctes}}{\text{Nombre total de prédictions}}$$

### ⚠️ Le problème (Le Paradoxe de l'Accuracy)
Imaginez un modèle de détection de fraude. Dans la réalité, 99.9% des transactions sont légitimes et 0.1% sont frauduleuses.
Si je crée un modèle "idiot" qui dit **toujours** "Légitime" (qui ne détecte rien), j'aurai une Accuracy de **99.9%** !
Pourtant, mon modèle est inutile (0% des fraudes détectées).
**Conclusion** : L'Accuracy est dangereuse sur les jeux de données déséquilibrés (imbalanced datasets).

---

## 2. La Matrice de Confusion
C'est la carte d'identité réelle du modèle. Elle croise Réalité vs Prédiction.

| | **Prédit : Positif (1)** | **Prédit : Négatif (0)** |
| :--- | :--- | :--- |
| **Réalité : Positif (1)** | **Vrai Positif (VP)** <br> *(Bravo, détecté !)* | **Faux Négatif (FN)** <br> *(Raté, danger !)* |
| **Réalité : Négatif (0)** | **Faux Positif (FP)** <br> *(Fausse alerte)* | **Vrai Négatif (VN)** <br> *(Correct)* |

---

## 3. Précision vs Recall (Le grand dilemme)

Dérivons deux métriques cruciales de cette matrice.

### 🎯 Precision (La fiabilité)
Quand le modèle dit "C'est positif", a-t-il raison ?
$$Precision = \frac{VP}{VP + FP}$$

*   **Cas d'usage : Filtre Spam**. On veut une Précision maximale.
    *   Si un email est classé "Spam", il doit l'être vraiment.
    *   On déteste les Faux Positifs (un mail important qui part en spam). On préfère laisser passer quelques pubs (Faux Négatifs).

### 🔍 Recall (Le Rappel / La Sensibilité)
De tous les cas positifs réels, combien en a-t-on trouvé ?
$$Recall = \frac{VP}{VP + FN}$$

*   **Cas d'usage : Détection de Cancer**. On veut un Recall maximal.
    *   On veut trouver TOUS les malades.
    *   Un Faux Négatif (dire à un malade "tout va bien") est dramatique.
    *   Un Faux Positif (fausse alerte, on refait un test) est acceptable.

### ⚖️ F1-Score (Le compromis)
La moyenne harmonique entre les deux. Utile quand on veut un équilibre.
$$F1 = 2 \times \frac{Precision \times Recall}{Precision + Recall}$$

---

## 4. Courbe ROC et AUC
Pour comparer des modèles indépendamment du seuil de décision.
L'**AUC (Area Under the Curve)** est un score entre 0.5 (hasard) et 1 (parfait).
*   0.7 - 0.8 : Acceptable
*   0.8 - 0.9 : Excellent
*   0.9+ : Suspect (Overfitting ?)

---

## 5. Overfitting vs Underfitting (Le Bias-Variance Tradeoff)

### Sur-apprentissage (Overfitting) - "L'étudiant qui apprend par cœur"
Le modèle apprend "le bruit" des données d'entraînement.
*   **Symptôme** : 99% de réussite sur les données d'entraînement, mais 60% sur les nouvelles données (Test).
*   **Solution** : Ajouter plus de données, simplifier le modèle, Regularization (L1/L2), Dropout (en Deep Learning).

### Sous-apprentissage (Underfitting) - "L'étudiant qui n'a rien compris"
Le modèle est trop simple pour capturer la complexité du problème.
*   **Symptôme** : Mauvaise performance partout.
*   **Solution** : Utiliser un modèle plus puissant (ex: passer d'une régression linéaire à un réseau de neurones).

---

## Conclusion Business
Avant de lancer un projet IA, posez-vous la question :
**"Qu'est-ce qui coûte le plus cher à mon entreprise ? Un Faux Positif ou un Faux Négatif ?"**
C'est cette réponse qui dictera le choix mathématique de la métrique à optimiser.
