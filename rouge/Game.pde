class Game
{
  public boolean[] moveKeys = new boolean[4];

  Player player;

  Game()
  {
    player = new Player(new PVector(width/2, height/2));
  }

  void update()
  {
    player.velocity.x = (moveKeys[2])?-2:(moveKeys[3])?2:0;
    player.velocity.y = (moveKeys[0])?-2:(moveKeys[1])?2:0;
    
    if (moveKeys[2])   
      player.facingLeft = true;
    else if (moveKeys[3])
      player.facingLeft = false;
      
    player.update();
  }

  void render()
  {
    player.render();
  }
  
  void printVector(String id, PVector p)
  {
    println(id+": ["+p.x+", "+p.y+"]");
  }
}

