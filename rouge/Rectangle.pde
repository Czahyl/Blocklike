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
  
  PVector getCenter()
  {
     return new PVector(x - w/2, y - h/2); 
  }
  
  boolean contains(PVector v)
  {
     return x < v.x && x + w >  v.x && y < v.y && y + h > v.y;
  }
  
  boolean intersects(Rectangle r)
  {
     return r.x > x && r.x < x + w && r.y > y && r.y > y + h;
  }
}

