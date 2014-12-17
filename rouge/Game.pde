class Game
{
  Player player;
  
  Game()
  {
    player = new Player(new PVector(width/2, height/2));  
  }
  
  void update()
  {
    player.update();
  }
  
  void render()
  {
    player.render();
  }
}
