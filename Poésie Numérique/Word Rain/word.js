class Word {
  constructor(x, y) {
    this.word = random(mot_liste);
    this.x = x;
    this.y = y;
    this.dy = 1;
    this.c = color(random(0, 255), random(0, 255), random(0, 255));
  }

  update() {
    let color = video.get(this.x, this.y);
    let b = brightness(color);

    if (b > thresholdVAL * 100) {
      //lorsque c'est blanc les mots descendent
      this.y += this.dy;
    } else {
      if (this.y > 0 && b < thresholdVAL * 100) {
        //lorsque c'est noir les mots remontent
        this.y -= this.dy;
        color = video.get(this.x, this.y);
        b = brightness(color);
      }
    }
    //fait passer les lettre en haut de l'écran quand ils touchent le fond
    if (this.y >= height) {
      thi.y = 0;
      this.y = 1;
    }
  }

  display() {
    fill(254, 0, 0);
    textSize(10);
    fill(this.c);
    text(this.word, this.x, this.y);
  }
}
