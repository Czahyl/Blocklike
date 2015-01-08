ArrayList<PImage> textureList = new ArrayList<PImage>();
PFont mainFont;

Menu currentMenu;

Game game;

void setup() 
{
  size(350, 350);

  textureList.add(loadImage("menu_bg.png")); 
  textureList.add(loadImage("player.png"));

  mainFont = createFont("8-BIT WONDER", 32);

  game = new Game();

  showMenu(new MainMenu());
}

void keyPressed() 
{
  if (currentMenu != null)
  {
    currentMenu.keyPressed(keyCode);
  }
  else
  {
    if (keyCode == UP)
      game.moveKeys[0] = true;
    if (keyCode == DOWN)
      game.moveKeys[1] = true;
    if (keyCode == LEFT)
      game.moveKeys[2] = true;
    if (keyCode == RIGHT)
      game.moveKeys[3] = true;
  }
}

void keyReleased() 
{
  if(currentMenu == null)
  {
    if (keyCode == UP)
      game.moveKeys[0] = false;
    if (keyCode == DOWN)
      game.moveKeys[1] = false;
    if (keyCode == LEFT)
      game.moveKeys[2] = false;
    if (keyCode == RIGHT)
      game.moveKeys[3] = false;
  }
}

void draw() 
{

  boolean skip = false;

  background(0);
  translate(0, 0);
  noStroke();
  rotate(0);

  if(currentMenu != null)
  {
    currentMenu.draw();

    skip = currentMenu.doesPause();
  }

  if(!skip)
  {
    game.update();
    game.render();
  }
}


void showMenu(Menu menu)
{
    currentMenu = menu;
    if(currentMenu != null)
      currentMenu.init(this);
}
