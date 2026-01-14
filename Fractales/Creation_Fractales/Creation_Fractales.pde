float[][] old_gridX, old_gridY; //coordonnées de la grille actuelle
float[][] new_gridX, new_gridY;// coordinnées après subdivision

int subdivision, old_subdivision;
float scale, old_scale;
float xb, yb; //position de la souris

void setup() {
  size(600, 600);
  subdivision = 8;
  scale = 0.12;
  old_subdivision = subdivision;
  old_scale= scale;
}

void draw() {

  xb = mouseX;
  yb = mouseY;
  subdivision = int((xb/600)*8); //la subdivision dépend de la souris en x
  scale = yb *10/(8*5);
  scale = scale /1000; //permet de garder la forme du cube sinon la grille explose car le hasard devient trop grand

  if ((old_subdivision != subdivision) || (old_scale != scale)) //!ligne suggérée par Chat GPT! Elle permet de ne pas recalculer la grille en permanence et d'avoir un programme plus fluide. Le calcul se fait seulement quand la souris bouge
  {

    background(#FFFEF2);
    int level=0; //niveau actuel de subdivision
    int n=2;

    //grille initiale 2*2
    old_gridX = new float[n][n];
    old_gridY= new float[n][n];

    // création des 4 points de départ dans les coins
    old_gridX[0][0] = 100;
    old_gridY[0][0] = 100;

    old_gridX[0][1] = 100;
    old_gridY[0][1] = 500;

    old_gridX[1][0] = 500;
    old_gridY[1][0] = 100;

    old_gridX[1][1] = 500;
    old_gridY[1][1] = 500;

    while (level<subdivision) { //boucle de subdivision
      int newN = 2*n-1; //nouvelle taille de la grille après la subdivision
      new_gridX = new float[newN][newN]; //nouvelles grilles
      new_gridY = new float[newN][newN];


      for (int i = 0; i < newN; i++) {
        for (int j = 0; j < newN; j++) {

          int ii = i / 2; // indice correspondant à l'ancienne grille
          int jj = j / 2;

          // Cas 1 : Coin de la grille (point déja existant)
          
          if (i % 2 == 0 && j % 2 == 0) { //si i et j sont pairs alors le point existait déja dans l'ancienne grille
            new_gridX[i][j] = old_gridX[ii][jj];//on le recopie
            new_gridY[i][j] = old_gridY[ii][jj];
          }

          // Cas 2 : Point situé entre 2 points sur une ligne
          else if (i % 2 == 0 && j % 2 == 1) {
            
            //Moyenne des coordonnées des deux points en horizontal
            float x = (old_gridX[ii][jj] + old_gridX[ii][jj + 1]) / 2; //nouvelle coordonnée x du nouveau point
            float y = (old_gridY[ii][jj] + old_gridY[ii][jj + 1]) / 2; // nouvelle coordonnée y du nouveau point

            float d = dist(
              old_gridX[ii][jj], old_gridY[ii][jj],
              old_gridX[ii][jj + 1], old_gridY[ii][jj + 1] //calcul distance entre 2 points existants
              );

            float rng = d * scale; // le hasard est proprtionnel à la distance

            new_gridX[i][j] = x + random(-rng, rng); // ajout du hasard sur la position moyenne
            new_gridY[i][j] = y + random(-rng, rng);
          }

          // Cas 3 : Point situé entre 2 points sur une colonne
          else if (i % 2 == 1 && j % 2 == 0) {
            float x = (old_gridX[ii][jj] + old_gridX[ii + 1][jj]) / 2; //Moyenne
            float y = (old_gridY[ii][jj] + old_gridY[ii + 1][jj]) / 2;

            float d = dist(
              old_gridX[ii][jj], old_gridY[ii][jj],
              old_gridX[ii + 1][jj], old_gridY[ii + 1][jj]
              );

            float rng = d * scale;

            new_gridX[i][j] = x + random(-rng, rng);
            new_gridY[i][j] = y + random(-rng, rng);
          }

          // Cas 4 : Centre du carré (diagonale)
          else {
            float x = (old_gridX[ii][jj] +old_gridX[ii + 1][jj + 1])/ 2; // Moyenne diagonale des coins d'un carré
            float y = ( old_gridY[ii][jj] +old_gridY[ii + 1][jj + 1]) / 2;

            float d = dist(old_gridX[ii][jj], old_gridY[ii][jj], old_gridX[ii + 1][jj + 1], old_gridY[ii + 1][jj + 1]);

            float rng = d * scale;

            new_gridX[i][j] = x + random(-rng, rng);
            new_gridY[i][j] = y + random(-rng, rng);
          }
        }
      }


      drawGrid(new_gridX, new_gridY);
      
      //préparer la grille pour la prochaine subdivision
      old_gridX= new_gridX;
      old_gridY= new_gridY;
      n= newN;
      level++;
    }


    old_subdivision = subdivision;
    old_scale=scale;
  }
}


// Dessine la grille, relie les points voisins horizontalement et verticalement
void drawGrid(float[][] X, float[][] Y) {
  stroke(0, 80);
  for (int i = 0; i < X.length; i++) {
    for (int j = 0; j < Y.length; j++) {
      // ligne verticale
      if (i < X.length-1) line(X[i][j], Y[i][j], X[i+1][j], Y[i+1][j]);//je relie chaque point à ses voisins
      // ligne horizontale
      if (j < Y.length-1) line(X[i][j], Y[i][j], X[i][j+1], Y[i][j+1]);
    }
  }
}
