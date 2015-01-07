ArrayList<PImage> textureList = new ArrayList<PImage>();
PFont mainFont;


Menu currentMenu;
Menu title;

Game game;

void setup() 
{
  size(350, 350);

  textureList.add(loadImage("menu_bg.png")); 
  textureList.add(loadImage("player.png"));

  title = new Menu(7, 7);
  mainFont = loadFont("8BITWONDERNominal.vlw");

  title.selectPosition = new PVector(width/2, height/2);
  title.selections.add("Play");
  title.selections.add("Options");
  title.selections.add("Quit");
  title.guiText.add(new GUIText("BITLIKE", mainFont, 42, new PVector(width/2, 100), color(100, 100, 100)));

  currentMenu = title;

  game = new Game();
}

void keyPressed() 
{
  if (!title.closed)
  {
    if (keyCode == UP)
      currentMenu.selection--;
    else if (keyCode == DOWN)
      currentMenu.selection++;

    if (key == 'x' && currentMenu.selection == 0)
    {
      currentMenu.closed = true;
    }
  } else
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
  if (!title.closed)
  {
  } else
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
  background(0);
  translate(0, 0);
  noStroke();
  rotate(0);

  currentMenu.show();

  if (!title.closed) return;

  game.update();
  game.render();
}

