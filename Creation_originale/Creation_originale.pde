float time = 0; 
void setup(){
size(600, 600); 
background(0); 
colorMode(HSB, 360, 100, 100, 100);
} 

void draw(){ 
  //effacer progressivement l'image précédente
  fill(0, 4);
  noStroke();
  rect(0,0, width, height); //rect noir transparent posé par dessus l'image
  strokeWeight(3);


float x=0; 
 

while(x<width){ 
point(x, height*noise(x/100, time));
stroke((time*50)%360, 80, 100, 100); //hue, saturation, brightness, alpha

x=x+1; 
} 

time = time + 0.02; 
}
