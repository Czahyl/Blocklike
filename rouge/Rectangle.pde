class Rectangle
{
  int x, y, w, h;

  Rectangle(int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  boolean intersects(Rectangle r)
  {
     return r.x > x && r.x < x + w && r.y > y && r.y > y + h;
  }
}

