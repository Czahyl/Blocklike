class Door
{
  Rectangle bounds;
  private int side;
  PVector moveOffset;

  Door(int side)
  {
    this.side = side;

    switch(side)
    {
    case 1: // Up
      bounds = new Rectangle(width/2 - 20, 0, 40, 21);
      moveOffset = new PVector(0, 1);
      break;
    case -1: // Down
      bounds = new Rectangle(width/2 - 20, height - 21, 21, 40);
      moveOffset = new PVector(0, -1);
      break;
    case 2: // Left
      bounds = new Rectangle(0, height/2 - 20, 21, 40);
      moveOffset = new PVector(-1, 0);
      break;
    case -2: // Right
      bounds = new Rectangle(width - 21, height/2 - 20, 21, 40);
      moveOffset = new PVector(1, 0);
      break;
    }
  }

  void update()
  {
  }

  void render()
  {
    noStroke();
    fill(255);
    rect(bounds.x, bounds.y, bounds.w, bounds.h);
  }

  int getSide()
  {
    return side;
  }
}

class Room
{
  private PVector gridPos;

  ArrayList<Door> doorList = new ArrayList<Door>();
  Door parent;

  Room(Door parent, PVector gridPos)
  {
    this.parent = parent;
    this.gridPos = gridPos;

    if (parent != null)
    {
      doorList.add(new Door(-parent.getSide()));
    } else
      doorList.add(new Door(1));
  }

  void update()
  {
  }

  void render()
  {
    fill(50);
    rect(0, 0, width, 20);
    rect(width-20, 0, 20, height);
    rect(0, 0, 20, height);
    rect(0, height-20, width, 20);

    for (Door door : doorList)
    {
      door.render();
    }
  }

  PVector getGridPos()
  {
    return gridPos;
  }
}

