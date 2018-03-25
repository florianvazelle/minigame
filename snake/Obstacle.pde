class Obstacle extends Carre {

  public Obstacle(float x, float y, float w) {
    super(x, y, w);
  }

  void show() {
    fill(91, 60, 17);
    ellipse((this.x+this.w/2), (this.y+this.w/2), this.w, this.w);
  }
}