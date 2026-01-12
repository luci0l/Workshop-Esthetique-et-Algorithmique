//Initialisation
size(640, 400);
background (255);


float X=width;
float Y= height;
int N=0;
int D=0;

while (N<Y){
 D=D+1;
 strokeWeight(D+1);
 N=N+D+1;
 X=X-D-10;
 Y=Y-D-10;
 
 line(N,N,N,Y);
 line(N,Y,X,Y);
 line(X,Y,X,N);
 line(X,N,N,N);
}
