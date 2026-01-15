let video;
let w = 450; //WIDTH
let h = 300; //HEIGHT
let thresholdVAL = 0.3; //intéressant de jouer avec cette valeur pour l'adapter à son environnement

let word;
let x, y;

let mot_liste = [];

let verbes = [
  "touche",
  "vibre",
  "adore",
  "aime",
  "rêve",
  "peine",
  "brille",
  "brise",
  "charme",
  "brule",
];

let noms = [
  "plume",
  "foudre",
  "rayon",
  "lumière",
  "bruit",
  "pluie",
  "chant",
  "voeux",
  "trésor",
  "amour",
  "tristesse",
  "drame",
];

let liens = ["avec", "dans", "sans", "au", "lui", "eux", "elle", "tu", "je"];

let adjectif = [
  "tendre",
  "calme",
  "profond",
  "ensemble",
  "amoureux",
  "magnifique",
  "beau",
  "drôle",
  "léger",
  "lourd",
];

let letters = [];

let num = 30; //nombre de mots affichés à l'écran

function setup() {
  createCanvas(w, h);
  video = createCapture(VIDEO);
  video.size(w, h);

  mot_liste = [...verbes, ...noms, ...liens, ...adjectif]; //concaténation des tableaux de mots

  for (let i = 0; i < num; i++) {
    let x = (width / num) * i;
    let y = 1;
    letters[i] = new Word(x, y);
  }
}

function draw() {
  background(220);
  image(video, 0, 0);
  filter(THRESHOLD, thresholdVAL); //transforme l'image en noir et blanc, possible de désactiver pour voir l'effet

  for (let i = 0; i < num; i++) {
    letters[i].update();
    letters[i].display();
  }
}
