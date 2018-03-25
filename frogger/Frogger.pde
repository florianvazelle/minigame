Frog frog;
ArrayList<Frog> frogWin;
Voiture[] tab_voiture;
Voiture[] tab_bois;
Rectangle[] nenuphars;
Voiture[] tab_tortue;

ArrayList<Rectangle> hitbox_derniere_ligne;

PImage imgHerbe, imgRoute, imgEau, imgBuisson, imgNenuphar;
PImage imgPompier, imgVoitureBleu, imgVoitureJaune, imgVoitureVert, imgCamion;
PImage imgFrog1;
PImage imgBois1, imgBois2, imgBois3;
PImage imgMort;
PImage imgTortue;

float grid = 50;
int nb_frog_win = 0;
int nb_frog_mort = 0;

void setup() {
  size(700, 700);

  //Sprite Décors
  imgHerbe = loadImage("src/herbe.png");
  imgRoute = loadImage("src/route.png");
  imgEau = loadImage("src/eau.png");
  imgBuisson = loadImage("src/buisson.png");
  imgNenuphar = loadImage("src/nenuphar.png");

  //Sprite Voiture
  imgPompier = loadImage("src/pompier.png");
  imgVoitureBleu = loadImage("src/voiture-bleu.png");
  imgVoitureJaune = loadImage("src/voiture-jaune.png");
  imgVoitureVert = loadImage("src/voiture-vert.png");
  imgCamion = loadImage("src/camion.png");

  //Frog
  imgFrog1 = loadImage("src/frog1.png");

  //Sprite Riviere
  imgBois1 = loadImage("src/bois1.png");
  imgBois2 = loadImage("src/bois2.png");
  imgBois3 = loadImage("src/bois3.png");

  imgTortue = loadImage("src/tortue2.png");

  imgMort = loadImage("src/mort.png");

  frogWin = new ArrayList<Frog>();

  frog = new Frog(width/2-grid/2, height-grid, grid);

  tab_voiture = new Voiture[11];
  int numeroVoiture = 0;

  //Ligne 1
  /* deux camions lent */
  for (int i = 0; i != 2; i++) {
    tab_voiture[numeroVoiture] = new Voiture(grid*(i*6), height-grid*2, grid, grid*2, 2, "pompier");
    numeroVoiture++;
  }

  //Ligne 2
  /* trois voiture contre sens normal */
  for (int i = 0; i != 3; i++) {
    int[] espacement = {3, 4, 5};
    tab_voiture[numeroVoiture] = new Voiture(grid*(i*espacement[i]), height-grid*3, grid, grid+grid/2, -3, "voiture-bleu");
    numeroVoiture++;
  }

  //Ligne 3
  /* 3 voiture normal */
  for (int i = 0; i != 3; i++) {
    int[] espacement = {3, 3, 4};
    tab_voiture[numeroVoiture] = new Voiture(grid*(i*espacement[i]), height-grid*4, grid, grid+grid/2, 3, "voiture-vert");
    numeroVoiture++;
  }

  //Ligne 4
  /* une Voiture hyper rapide contre sens */
  for (int i = 0; i != 1; i++) {
    tab_voiture[numeroVoiture] = new Voiture(width+(grid*(i*2)), height-grid*5, grid, grid+grid/2, -6, "voiture-jaune");
    numeroVoiture++;
  }

  //Ligne 5 
  /* trois camions plus lent */
  for (int i = 0; i != 2; i++) {
    float espacement = random(6, 8);
    tab_voiture[numeroVoiture] = new Voiture(grid*(i*espacement), height-grid*6, grid, grid*3, 1, "camion");
    numeroVoiture++;
  }

  tab_bois = new Voiture[9];
  tab_tortue = new Voiture[13];
  int numeroBois = 0;
  int numeroTortue = 0;

  //Ligne Riviere 2
  for (int i = 0; i != 3; i++) {
    float espacement = 4+3;
    tab_bois[numeroBois] = new Voiture(grid*(i*espacement), height-grid*8, grid, grid*3, 4, "bois1");
    numeroBois++;
  }

  //Ligne Riviere 3
  for (int i = 0; i != 3; i++) {
    float espacement = 5+3;
    tab_bois[numeroBois] = new Voiture(grid*(i*espacement), height-grid*9, grid, grid*5, -2, "bois3");
    numeroBois++;
  }

  //Ligne Riviere 4
  for (int i = 0; i != 8; i++) {
    float espacement = 2;
    tab_tortue[numeroTortue] = new Voiture(grid*(i*espacement), height-grid*10, grid, grid, -3, "tortue");
    numeroTortue++;
  }

  //Ligne Riviere 5
  for (int i = 0; i != 3; i++) {
    float espacement = 2+5;
    tab_bois[numeroBois] = new Voiture(grid*(i*espacement), height-grid*11, grid, grid*5, 3, "bois2");
    numeroBois++;
  }

  //Ligne Riviere 6
  for (int i = 0; i != 5; i++) {
    float espacement = 3;
    tab_tortue[numeroTortue] = new Voiture(grid*(i*espacement), height-grid*12, grid, grid, -4, "tortue");
    numeroTortue++;
  }

  //Nenuphar
  nenuphars = new Rectangle[7];
  hitbox_derniere_ligne = new ArrayList<Rectangle>();
  int j = 0;
  for (int i = 0; i != 14; i++) {
    if (i%2 == 0) {
      //  hitbox_derniere_ligne.add(new Rectangle(i*grid-grid/2, height-grid*13, grid, grid));
    } else if (j < 7) {
      nenuphars[j] = new Rectangle(i*grid-grid/2+(grid/3), height-grid*13, grid/3, grid);
      j++;
    }
  }
}

void draw() {
  clear();
  for (int i = 0; i != 14; i++) {
    image(imgHerbe, i*grid, height-grid, grid, grid);
    image(imgRoute, i*grid, height-grid*2, grid, grid);
    image(imgRoute, i*grid, height-grid*3, grid, grid);
    image(imgRoute, i*grid, height-grid*4, grid, grid);
    image(imgRoute, i*grid, height-grid*5, grid, grid);
    image(imgRoute, i*grid, height-grid*6, grid, grid);
    image(imgHerbe, i*grid, height-grid*7, grid, grid);
    image(imgEau, i*grid, height-grid*8, grid, grid);
    image(imgEau, i*grid, height-grid*9, grid, grid);
    image(imgEau, i*grid, height-grid*10, grid, grid);
    image(imgEau, i*grid, height-grid*11, grid, grid);
    image(imgEau, i*grid, height-grid*12, grid, grid);
    if (i%2 == 0)
      image(imgBuisson, i*grid-grid/2, height-grid*13, grid, grid);
    else
      image(imgNenuphar, i*grid-grid/2, height-grid*13, grid, grid);
    image(imgBuisson, 14*grid-grid/2, height-grid*13, grid, grid);
  }

  for (Voiture bois : tab_bois) {
    bois.show();
    bois.update();
    if (frog.dessus(bois)) {
      frog.onBois = true;
      frog.onThisBois = bois;
      frog.onBois(bois);
    }
  }

  if (!frog.onBois && (frog.pos_y == height-grid*11 || frog.pos_y == height-grid*9 || frog.pos_y == height-grid*8)) {
    frog.mort();
  }

  for (Voiture t : tab_tortue) {
    t.show();
    t.update();
    if (frog.dessusTortue(t)) {
      frog.onBois = true;
      frog.onThisBois = t;
      frog.onBois(t);
    }
  }
  
   if (!frog.onBois && (frog.pos_y == height-grid*12 || frog.pos_y == height-grid*10)) {
    frog.mort();
  }

  for (int i = 0; i != hitbox_derniere_ligne.size(); i++) {
    if (frog.collision(hitbox_derniere_ligne.get(i)))
      frog.move(-(frog.move_x_other), -(frog.move_y_other));
  }

  for (Rectangle nenuphar : nenuphars) {
    if (frog.collision(nenuphar)) {
      frog.win(nenuphar);
    }
  }

  frog.show();
  frog.update();
  frog.showFrogWin();

  for (Voiture voiture : tab_voiture) {
    voiture.show();
    voiture.update();
    if (frog.collision(voiture)) {
      frog.mort();
    }
  }

  for (int i = 0; i != nb_frog_mort; i++) {
    image(imgMort, width-(grid*(i+1)), 0, grid, grid);
  }

  if (nb_frog_mort == 3) {
    textSize(32);
    text("GAME OVER !!!", 5, 32);
    textSize(13);
    text("Clique pour recommencer !", 6, 45);
    noLoop();
  }

  if (nb_frog_win == 7) {
    textSize(32);
    text("CONGRATULATION !!!", 5, 32);
    textSize(13);
    text("Clique pour recommencer !", 6, 45);
    noLoop();
  }
}

void keyPressed() {

  if (keyCode == UP) {
    frog.move(0, -1);
  }
  if (keyCode == DOWN) {
    frog.move(0, 1);
  }
  if (keyCode == LEFT) {
    frog.move(-1, 0);
  }
  if (keyCode == RIGHT) {
    frog.move(1, 0);
  }
}

void keyReleased() {
  frog.move(0, 0);
}

void mousePressed() {
  frog.initFrog();
  loop();
}