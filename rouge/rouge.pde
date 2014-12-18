import java.awt.Rectangle;

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
      game.player.velocity.y = -2;
    if (keyCode == DOWN)
      game.player.velocity.y = 2;
    if (keyCode == LEFT)
    {
      game.player.facingLeft = true;
      game.player.velocity.x = -2;
    }
    if (keyCode == RIGHT)
    {
      game.player.facingLeft = false;
      game.player.velocity.x = 2;
    }
  }
}

void keyReleased() 
{
   if (!title.closed)
  {
  } else
  {
    if (keyCode == UP || keyCode == DOWN)
      game.player.velocity.y = 0;
    if(keyCode == LEFT || keyCode == RIGHT)
      game.player.velocity.x = 0;
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

