class Serpent extends Carre {
  Serpent suivant;
  int dirx;
  int diry;
  int speed;

  public Serpent(float x, float y, float w) {
    super(x, y, w);
    this.suivant = null;
    this.speed = 300;
  }

  void show() {
    fill(102);
    rect(this.x, this.y, this.w, this.w);
    if (this.suivant != null) {
      if (suivant.x == this.x && suivant.y == this.y)
        return;
      else {
        this.suivant.show();
      }
    }
  }

  void updateTete() {
    this.x += this.dirx * grid;
    this.y += this.diry * grid;

    this.updateSuivant();
  }

  void updateSuivant() {
    if (this.suivant != null) {
      if (this.suivant.x == this.x - (this.dirx * grid) && this.suivant.y == this.y - (this.diry * grid)) {
        this.suivant.initMove(this.dirx, this.diry);
        return;
      } else {
        this.suivant.x = this.x  - (this.dirx * grid);
        this.suivant.y = this.y  - (this.diry * grid);
        this.suivant.updateSuivant();
        this.suivant.initMove(this.dirx, this.diry);
      }
    }
  }

  void initMove(int dirx, int diry) {
    this.dirx = dirx;
    this.diry = diry;
  }

  public void ajoutQueue(int count) {
    Serpent next = this;
    while (next.suivant != null) {
      next = next.suivant;
    }
    for (int i = 0; i != count; i++) {
      next.suivant = new Serpent(next.x, next.y, next.w);
      next = next.suivant;
    }
  }

  public void mort() {
    textSize(32);
    text("GAME OVER", height/2, width/2);

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
    noLoop();
  }

  public boolean collisionSuivant() {
    Serpent next = this.suivant;
    for (int i = 0; next != null; i++) {
      if (this.x == next.x && this.y == next.y) {
        return true;
      } else {
        next = next.suivant;
      }
    }
    return false;
  }
}