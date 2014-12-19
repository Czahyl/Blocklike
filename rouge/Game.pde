class Game
{
  final PVector spLeft = new PVector(22, height/2);
  final PVector spRight = new PVector(width/2, 22);

  ArrayList<Room> roomList = new ArrayList<Room>();
  Room currentRoom;
  int xInc, yInc;

  Player player;

  Game()
  {
    roomList.add(new Room(null, new PVector(0, 0)));
    currentRoom = roomList.get(0);
    player = new Player(new PVector(width/2, height/2));
  }

  void update()
  {
    for (Door door : currentRoom.doorList)
    {
      if (door.bounds.intersects(player.getBounds()))
      {
        println(door.bounds.inter
        PVector moveOffset = new PVector(currentRoom.getGridPos().x - door.moveOffset.x, currentRoom.getGridPos().y - door.moveOffset.y);
        if (getRoom(moveOffset) != null)
        {
          currentRoom = getRoom(moveOffset);
          player.position = new PVector(door.bounds.x + door.moveOffset.x*20, door.bounds.y + door.moveOffset.y*20);
        } else
        {
          roomList.add(new Room(door, moveOffset));
        }
      }
    }
    currentRoom.update();
    player.update();
  }

  void render()
  {
    currentRoom.render();

    player.render();
  }

  Room getRoom(PVector gridOffset)
  {
    for (Room room : roomList)
    {
      if (room.getGridPos() == gridOffset)
        return room;
    }

    return null;
  }
}

