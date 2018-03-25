class Rectangle {
  float pos_x;
  float pos_y;
  float rect_height;
  float rect_width;

  public Rectangle(float x, float y, float h, float w) {
    this.pos_x = x;
    this.pos_y = y;
    this.rect_height = h;
    this.rect_width = w;
  }

  public boolean collision(Rectangle other) {
    return !(this.pos_x >= other.pos_x + other.rect_width
      || this.pos_x + this.rect_width <= other.pos_x
      || this.pos_y >= other.pos_y + other.rect_height
      || this.pos_y + this.rect_height <= other.pos_y);
  }

  public boolean dessus(Rectangle other) {
    return (this.pos_y == other.pos_y && this.pos_x <= (other.pos_x + other.rect_width-grid) && this.pos_x >= other.pos_x);
  }
  
    public boolean dessusTortue(Rectangle other) {
    return (this.pos_y == other.pos_y && this.pos_x <= (other.pos_x + other.rect_width) && this.pos_x >= other.pos_x);
  }
}