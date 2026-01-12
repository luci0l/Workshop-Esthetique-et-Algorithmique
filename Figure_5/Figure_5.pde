float W, R;
float X,Y;
int A,B;
float hue; 
float brightness; 

void setup(){
size(800, 800);
background(0);
strokeWeight(1.5);
colorMode(HSB, 360, 100, 100); //hue saturation and brightness
 A= width/2;
 B= height/2;
}

void draw(){

for (int I = 1 ; I <11; I++){
  R=height*0.7;
  
  for (W=PI/4; W < 3.6 ; W+=0.05){
    X=R*cos(W);
    Y=R*sin(W);
    
    hue = map(W, PI/4, 3.6, 0, 360); //couleur dépend de l'angle W, on obtient un degradé
     
     stroke(hue, 70, 100);
      
    line(A+X, B-Y, A-Y, B-X);
    line(A-Y, B-X, A-X, B+X);
    line(A-X, B+Y, A+X, B-Y);
    line(A-X,B+Y, A+Y, B+X);
    line(A+Y, B+X, A+X, B-Y);
    
    R=R*0.94;
  }
}


}
    
