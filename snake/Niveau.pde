class Niveau {
  int niveau;
  int pastille;
  int obstacle;

  public Niveau(int niveau, int pastille, int obstacle) {
    this.niveau = niveau;
    this.pastille = pastille;
    this.obstacle = obstacle;
  }

  void update() {
    for (int i = 0; i != this.pastille; i++) {
      int x = (int) random(0, height/grid);
      int y = (int) random(0, width/grid);
      if (_map[x][y]) {
        i--;
      } else {
        listePastille.add(new Pastille(x * grid, y * grid, grid));
        _map[x/grid][y/grid] = true;
      }
    }
    for (int i = 0; i != this.obstacle; i++) {
      int x = (int) random(0, height)/grid;
      int y = (int) random(0, width)/grid;
      if (_map[x][y]) {
        i--;
      } else {
        listeObstacle.add(new Obstacle(x * grid, y * grid, grid));
        _map[x][y] = true;
      }
    }
  }

  public void upgrade() {
    this.niveau++;
    this.pastille++;
    this.obstacle++;

    listeObstacle.clear();
    currentNiveau.update();

    int newSpeed = snake.speed;
    //Reinitialise le serpent
    snake = new Serpent(height/2, width/2, grid);
    snake.ajoutQueue(4);
    snake.speed -= 5;

    //Reinitialise la map
    _map = new boolean[height/grid][width/grid];
    _map[(height/2)/grid][(width/2)/grid] = true;
  }
}