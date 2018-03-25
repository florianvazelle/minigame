class Carre {
  float x;
  float y;
  float w;

  public Carre(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
  }

  public boolean collision(Carre other) {
    return (this.x == other.x && this.y == other.y);
  }
}