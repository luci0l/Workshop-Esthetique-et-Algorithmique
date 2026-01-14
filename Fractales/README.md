# Fractale

## Projet : Feuille froissée

Dans le but de représenter le thème des fractales, j'ai décidé de représenter une feuille qui se froisse en fonction des déplacements de la souris.
J'ai utilisé le principe de subdivision récursive d'une grille, c'est à dire qu'à chaque niveau, la grille est subdivisée et le résultat sert de base pour la subdivision suivante.
Ainsi on obtient des motifs auto-similaires qui rappellent le comportement des fractales.

### Logique de subdivision de la grille

On commence avec une grille initiale de 4 points aux coins. Chaque fois que l'on subdivise, on ajoute des points entre les points existants, chaque segment entre deux points existants va produire de nouveaux points intermédiaires :

- Milieu horizontale : entre deux points sur la même ligne
- Milieu verticale : entre deux points sur la même colonne
- Centre : entre les diagonales

Pour calculer les positions de ces nouveaux points, on fait la moyenne des coordonnées des points existants.
On ajoute ensuite un peu de hasard à ces nouvelles positions. Cet effet va créer un effet plus organique et donne l'impression d'une feuille froisée.
Le hasard est proportionnel à la distance d'un segment de points, plus la distance est grande, plus le déplacement aléatoire peut être important.

Ensuite on met à jour la grille avec ces nouveaux points et on répète le processus. Chaque niveau de subdivision dépend des points calculés au niveau précédent. Alors, les points d'avant servent de base pour placer les nouveaux points. J'ai trouvé difficile de devoir rédiger cette logique de subdivision de manière claire alors je me suis permis d'utiliser chat gpt pour mettre en forme l'idée que chauqe ancien point sert de base pour créer les nouveaux points intermédiaires.

Après l'étape de subdivision, on peut enfin dessiner la grille en reliant tous les points avec des lignes.
La fonction DrawGrid parcourt tous les points de la grille et relie chaque point à son voisin de droite et son voisin du dessous pour créer la grille.

### Interactivité

La création est interactive. En fonction des déplacements de la souris, la feuille va plus ou moins évoluer :

- Sur l'axe des X : la souris contrôle le nimbre de subdivision
- Sur l'axe des Y : la souris contrôle l'intensité du hasard (ou des positions aléatoires des points)
