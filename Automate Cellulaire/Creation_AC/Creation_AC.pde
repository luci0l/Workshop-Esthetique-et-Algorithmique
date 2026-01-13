int rec = 5;
color[]buffer;
int strength(color c) {
  return int(saturation(c) + brightness(c)/2);
}


void update() {
  buffer=pixels.clone();

  for (int x=0; x<width; x++) {
    for (int y=rec; y<height; y++) {
      int i =width*y+x;

      switch(int(random(4))) { // choix random de direction : 0 droite, gauche, bas, haut

      case 0: //droite
        if (x+1 < width && strength(buffer[i])>= strength(buffer[i+1])) {
          pixels[i+1]=buffer[i];
        }
        break;

      case 1: //gauche

        if (x-1>0 && strength(buffer[i]) >= strength(buffer[i-1])) {
          pixels[i-1] = buffer[i];
        }
        break;

      case 2: //bas

        if (y+1 < height && strength(buffer[i]) >= strength(buffer[i+width])) {
          pixels[i+width] = buffer[i];
        }
        break;

      case 3: //haut
        if (y-1 >= 0 && strength(buffer[i]) >= strength(buffer[i-width])) {
          pixels[i-width]= buffer[i];
        }
        break;
      }
    }
  }
  updatePixels();
}

void mousePressed() {
  rec = mouseY;
  loadPixels();
  for (int i = rec*width; i < width*height; i++) {
    pixels[i] = color(random(256), random(256), random(256));
  }
  updatePixels();
  buffer = pixels.clone();
}



void setup() {
  size(600, 600);
  background(0);
  colorMode(HSB, 255);
  loadPixels();
  
  for(int i = rec*width; i<width*height; i++){
    pixels[i] = color(random(256), random(256), random(256));
  }
  updatePixels();
  buffer = pixels.clone();
}
  

void keyPressed() {
  if (key=='r')
    setup();
}


void draw() {
  update();
}
