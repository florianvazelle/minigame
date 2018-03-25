class Frog extends Rectangle {
  float move_x;
  float move_y;
  float move_x_other;
  float move_y_other;
  float pos_y_checkpoint;
  boolean onBois;
  Voiture onThisBois;


  public Frog(float x, float y, float w) {
    super(x, y, w, w);
    this.pos_y_checkpoint = height-grid;
    this.onBois = false;
  }

  void buildShow(float xSlate, float ySlate, float rad) {
    translate(xSlate, ySlate);
    rotate(radians(rad));
    image(imgFrog1, 0, 0, this.rect_width, this.rect_height);
    rotate(-radians(rad));
    translate(-(xSlate), -(ySlate));
  }

  void show() {
    if (move_x == 1 && move_y == 0) {
      buildShow(this.pos_x+this.rect_width, this.pos_y, 90.0);
    } else if (move_x == -1 && move_y == 0) {
      buildShow(this.pos_x, this.pos_y+this.rect_width, 270.0);
    } else if (move_x == 0 && move_y == 1) {
      buildShow(this.pos_x+this.rect_width, this.pos_y+this.rect_width, 180.0);
    } else
      image(imgFrog1, this.pos_x, this.pos_y, this.rect_width, this.rect_height);
  }

  void update() {
    if (onBois) {
      if (!this.dessus(this.onThisBois)) {
        this.onBois = false;
      }
    }
  }

  void move(float move_x, float move_y) {
    if (this.pos_x + move_x * grid < width && this.pos_x + move_x * grid >= -grid && this.pos_y + move_y * grid < height && this.pos_y + move_y * grid > 0) {
      this.pos_x += move_x * grid;
      this.pos_y += move_y * grid;
    }
    if (!(move_x == 0 && move_y == 0)) {
      this.move_x = move_x;
      this.move_y = move_y;
    }

    this.move_x_other = move_x;
    this.move_y_other = move_y;
    if (frog.pos_y == height-grid*7 && this.pos_y_checkpoint != height-grid*7) {
      this.pos_y_checkpoint = height-grid*7;
    }

    if (move_y != 0) {
      this.onBois = false;
    }
  }

  void onBois(Voiture bois) {
    if (this.pos_x + bois.speed < width-grid && this.pos_x > 0) {
      this.pos_x += bois.speed;
    }
  }

  void mort() {
    this.pos_x = width/2-grid/2;
    this.pos_y = pos_y_checkpoint;
    nb_frog_mort++;
  }

  void win(Rectangle nenuphar) {
    this.pos_y_checkpoint = height-grid;
    this.pos_x = width/2-grid/2;
    this.pos_y = pos_y_checkpoint;
    nb_frog_mort = 0;
    nb_frog_win++;

    Frog newFrogWin = new Frog(nenuphar.pos_x-grid/3, nenuphar.pos_y, grid);
    hitbox_derniere_ligne.add(new Rectangle(nenuphar.pos_x-grid/3, nenuphar.pos_y, grid, grid));
    frogWin.add(newFrogWin);
  }

  void showFrogWin() {
    for (int i = 0; i != frogWin.size(); i++) {
      buildShow(frogWin.get(i).pos_x + frogWin.get(i).rect_width, frogWin.get(i).pos_y + frogWin.get(i).rect_width, 180.0);
    }
  }

  void initFrog() {
    this.pos_y_checkpoint = height-grid;
    this.pos_x = width/2-grid/2;
    this.pos_y = pos_y_checkpoint;
    nb_frog_mort = 0;  
    nb_frog_win = 0;

    hitbox_derniere_ligne.clear();
    frogWin.clear();
  }
}