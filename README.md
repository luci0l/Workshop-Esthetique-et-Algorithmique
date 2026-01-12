#Dessin Algorithmique

##Projet
Les fichiers correspondent au premier jour du Workshop

---

###Figure 5 :

Dans mon code, la ligne hue = map(W, PI/4, 3.6, 0, 360); indique que la couleur de chaque ligne dépend de l'angle W.
Cette progression fait évoluer la teinte/hue sur tout le spectre de couleurs : quand W est petit, la couleur est proche du rouge quand W augmente la couleur parcourt le spectre.

map() permet de convertir l'angle en une teinte entre 0 et 360.

---

###Création Originale:

Je me suis inspiré de la pochette d'album _Unknown Pleasures_ de Joy Divison, un design fait par Peter Saville que nous avons étudié en cours d'Art appliqué à l'IMAC.

Ici une ligne se déplace, change de couleur et laisse des traces qui disparaissent progressivement. J'ai pu animer cette ligne grace à la variable time.

Pour le dessin de la courbe, on parcourt toute la largeur de la page et on dessine un point mais sa position vertical (height) est contrôlé par du noise ce qui créer un effet fluide du déplacement de la courbe.

Ensuite j'ai animé simplement la couleur avec le temps qui parcourt le spectre de couleurs.

Enfin, car trop brouillon, j'ai programmé un effacement des anciennes courbes grâce à un dessin d'un rectangle noir peu opaque qui recouvre l"écran a chaque image ce qui efface les anciennes courbes progressivement.
