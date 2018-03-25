Serpent snake;
ArrayList<Pastille> listePastille;
ArrayList<Obstacle> listeObstacle;

Niveau currentNiveau;
boolean[][] _map;
int score;

int grid = 25;

void setup() {
  //fullScreen();
  size(800, 800);
  background(0);

  listePastille = new ArrayList<Pastille>();
  listeObstacle = new ArrayList<Obstacle>();

  _map = new boolean[height/grid][width/grid];
  _map[(height/2)/grid][(width/2)/grid] = true;

  currentNiveau = new Niveau(0, 5, 0);
  currentNiveau.update();
  score = 0;

  //Création du serpent
  snake = new Serpent(height/2, width/2, grid);
  snake.ajoutQueue(4);
}

void draw() {
  clear();

  textSize(32);
  text("Niveau : "+currentNiveau.niveau, 5, 32);
  textSize(32);
  text("Score : "+score, 5, 32+32);

  int size = listePastille.size();
  if (size == 0) {
    currentNiveau.upgrade();
  }

  for (int i = 0; i != size; i++) {
    listePastille.get(i).show();
    if (snake.collision(listePastille.get(i))) {
      score+=5;
      snake.ajoutQueue(2);
      listePastille.remove(i);
      size--;
      i--;
    }
  }

  size = listeObstacle.size();
  for (int i = 0; i != size; i++) {
    listeObstacle.get(i).show();
    if (snake.collision(listeObstacle.get(i))) {
      snake.mort();
    }
  }

  snake.updateTete();
  snake.show();
  delay(snake.speed);
  if (snake.x < 0 || snake.x > height-grid || snake.y < 0 || snake.y > width-grid)
    snake.mort();

  if (snake.collisionSuivant() && !(snake.dirx == 0 && snake.diry == 0))
    snake.mort();
}

void keyPressed() {
  if (keyCode == UP) {
    if (!(snake.dirx == 0 && snake.diry == 1)) {
      snake.initMove(0, -1);
    }
  }
  if (keyCode == DOWN) {
    if (!(snake.dirx == 0 && snake.diry == -1)) {
      snake.initMove(0, 1);
    }
  }
  if (keyCode == LEFT) {
    if (!(snake.dirx == 1 && snake.diry == 0)) {
      snake.initMove(-1, 0);
    }
  }
  if (keyCode == RIGHT) {
    if (!(snake.dirx == -1 && snake.diry == 0)) {
      snake.initMove(1, 0);
    }
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    noLoop();
  } else if (mouseButton == LEFT) {
    loop();
  }
}