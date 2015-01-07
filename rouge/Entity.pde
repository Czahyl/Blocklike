abstract class Entity
{
  public PVector position, velocity;
  public int w, h;

  Entity(PVector position, PVector velocity, int w, int h)
  {
  }

  public void update()
  {
    position = new PVector(position.x - w/2, position.y - h/2);
    position.x += velocity.x;
    position.y += velocity.y;
  }

  public abstract void render();
}

