
//Utiliser PGraphics comme buffer car plus performant
// Permet de dessiner une image en mémoire puis de l'afficher à l'écran (moins de calculs)
PFont arial;

PGraphics page; // Page complète
PImage[] strips; // Morceaux de la page permet de manipuler l'image créer par PGraphics
int num = 25;
float tilt = 0;
float tilt_max= 0;
boolean shadows = true;

void setup () {
  size(700, 600);
  page = createGraphics(350, 450); // Création du buffer
  strips = new PImage[num]; // Création des strips de l'image
 
  arial=createFont("Arial Bold", 48);

  page.beginDraw(); // Dessin de la page
  page.background(#FFFFF0);
  page.fill(50);
  
  page.textFont(arial);
  page.textAlign(CENTER);
  page.textSize(50);
  page.text("Don't put this", page.width/2, page.height/5); //haut de page
  page.text("in the paper", page.width/2, 2*page.height/5);
  page.text("shredder,", page.width/2, 3*page.height/5);
  page.text("please...", page.width/2, 4*page.height/5); //bas de page
  page.endDraw();

  for (int i =0; i < num; i++) { // Découpage de la page en bandes
    int y = i* page.height / num;
    strips[i] = page.get(0, y, page.width, page.height /num); //stock les bandes dans strips[]
  
  }
}


void draw() {
//F7F2D7
  background(#F5E6BE);
  imageMode(CENTER);

  float offset = map(mouseX, 0, width, -200, 200); // Décalage à la souris

  tilt_max = map(mouseY, 0, height, 0, PI/6); // Rotation en Y
  tilt = lerp(tilt, tilt_max, 0.1); // Rend le mouvement plus fluide

  // Dessin des ombres des bandes (copies des bandes originelles en gris)
  if (shadows) {
    for (int i=0; i<num; i++) {
      float y = i*(page.height /(float)num);
      float x = width/2 + offset *sin(i *0.8);
      float al = tilt * (0.5 - noise(frameCount/60.0 + y /100.0));

      pushMatrix(); //isole chaque bandes
      translate(x+5, height/2 - page.height/2 + y +5 + strips[i].height/2);
      rotate(al);
      tint(0, 80);
      image(strips[i], 0, 0);
      noTint();
      popMatrix();
    }
  }

  // Ondulation des bandes
  for (int i=0; i<num; i++) {
    float y = i*(page.height /num);
    float x = width/2 + offset *sin(i *0.8); // Déplacement ondulé
    float al = tilt * (0.5 - noise(frameCount/60.0 + y /100.0)); //Rotation aléatoire avec noise

    pushMatrix(); // Isole chaque strips
    translate(x, height/2 - page.height/2 + y + strips[i].height/2);
    rotate(al);
    image(strips[i], 0, 0);
    popMatrix();

  }
 
}
