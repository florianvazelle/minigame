class Pastille extends Carre {

  public Pastille(float x, float y, float w) {
    super(x, y, w);
  }

  void show() {
    fill(255, 0, 0);
    ellipse((this.x+this.w/2), (this.y+this.w/2), this.w, this.w);
  }
}