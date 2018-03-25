class Voiture extends Rectangle {
  int speed;
  String id;

  public Voiture(float x, float y, float h, float w, int speed, String id) {
    super(x, y, h, w);
    this.speed = speed;
    this.id = id;
  }

  void show() {
    if (id == "pompier")
      image(imgPompier, pos_x, pos_y, rect_width, rect_height);
    if (id == "voiture-bleu")
      image(imgVoitureBleu, pos_x, pos_y, rect_width, rect_height);
    if (id == "voiture-jaune")
      image(imgVoitureJaune, pos_x, pos_y, rect_width, rect_height);
    if (id == "voiture-vert")
      image(imgVoitureVert, pos_x, pos_y, rect_width, rect_height);
    if (id == "camion")
      image(imgCamion, pos_x, pos_y, rect_width, rect_height);
    if (id == "bois1")
      image(imgBois1, pos_x, pos_y, rect_width, rect_height);
    if (id == "bois2")
      image(imgBois2, pos_x, pos_y, rect_width, rect_height);
    if (id == "bois3")
      image(imgBois3, pos_x, pos_y, rect_width, rect_height);
    if (id == "tortue") {
      image(imgTortue, pos_x, pos_y, rect_width, rect_height);
    }
  }

  void update() {
    if (speed > 0) {
      if (this.pos_x + speed < width && this.pos_x + this.rect_width + speed > -grid)
        this.pos_x += speed;
      else
        this.pos_x = -grid-this.rect_width;
    } else {
      if (this.pos_x + this.rect_width + speed > -grid && this.pos_x + speed < width+grid)
        this.pos_x += speed;
      else
        this.pos_x = width+grid;
    }
  }
}