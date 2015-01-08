import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class rouge extends PApplet {

ArrayList<PImage> textureList = new ArrayList<PImage>();
PFont mainFont;

Menu currentMenu;

Game game;

public void setup() 
{
  size(350, 350);

  textureList.add(loadImage("menu_bg.png")); 
  textureList.add(loadImage("player.png"));

  mainFont = createFont("8-BIT WONDER", 32);

  game = new Game();

  showMenu(new MainMenu());
}

public void keyPressed() 
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

public void keyReleased() 
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

public void draw() 
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


public void showMenu(Menu menu)
{
    currentMenu = menu;
    if(currentMenu != null)
      currentMenu.init(this);
}
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

class Game
{
  public boolean[] moveKeys = new boolean[4];

  Player player;

  Game()
  {
    player = new Player(new PVector(width/2, height/2));
  }

  public void update()
  {
    player.velocity.x = (moveKeys[2])?-2:(moveKeys[3])?2:0;
    player.velocity.y = (moveKeys[0])?-2:(moveKeys[1])?2:0;
    
    if (moveKeys[2])   
      player.facingLeft = true;
    else if (moveKeys[3])
      player.facingLeft = false;
      
    player.update();
  }

  public void render()
  {
    player.render();
  }
  
  public void printVector(String id, PVector p)
  {
    println(id+": ["+p.x+", "+p.y+"]");
  }
}

abstract class Menu
{
  public abstract void init(PApplet parent);
  public abstract void draw();
  public abstract void keyPressed(int keyCode);
  public abstract boolean doesPause();
}

public final class MainMenu extends Menu
{
  private int index = 0;
  private String[] selections = { "Play", "Options", "Quit"  };
  private PApplet parent;

  public void init(PApplet parent)
  {
    this.parent = parent;
  }

  public void draw()
  {
    textSize(32);
    text("Blocklike", 75, 25);

    if(this.index > selections.length-1 || this.index < 0)
        this.index = 0;

    for(int i = 0; i < selections.length; i++)
    {
      if(i == this.index)
        fill(125);
      else
        fill(50);

      textAlign(CENTER);
      text(selections[i], width / 2, (height / 2) + (32 * i));
    }
  }

  public void keyPressed(int keyCode)
  {
    if(keyCode == UP)
      index--;
    if(keyCode == DOWN)
      index++;
  }

  public void itemSelected()
  {
  }

  public boolean doesPause()
  {
    return true;
  }
}

class Player extends Entity
{
  PImage sprite;
  boolean facingLeft = true;
  boolean attackLeft = false;

  Player(PVector position)
  {
    super(position, new PVector(0, 0), textureList.get(1).width, textureList.get(1).height);
    
    sprite = textureList.get(1);
    this.position = position;
    velocity = new PVector(0, 0);
  }

  public void update()
  { 
    super.update();
  }

  public void render()
  {
    noStroke();
    fill(0);
    
    pushMatrix();
    translate(position.x, position.y);
    
    if(facingLeft)
    {
      scale(1, 1);
      image(sprite, 0, 0);
    }
    else
    {
      scale(-1, 1);
      image(sprite, -sprite.width, 0);   
    }
    popMatrix();
    
    drawSword(facingLeft);
  }
  
  public Rectangle getBounds()
  {
     return new Rectangle((int)position.x, (int)position.y, sprite.width, sprite.height);
  }

  private void drawSword(boolean left)
  {
    translate(0, 0);
    fill(150, 150, 150);
    rotate(0);

    if (!left)
    {
      rect(position.x + sprite.width/2 + 8, position.y + sprite.height/2, 5, 3);
      rect(position.x + sprite.width / 2 + 11, position.y + sprite.height/2-1, 3, 5);
      fill(255);
      rect(position.x + sprite.width / 2 + 14, position.y + sprite.height/2, 10, 3);
    } else
    {
      rect(position.x + sprite.width/2 - 11, position.y + sprite.height/2, 5, 3);
      rect(position.x + sprite.width / 2 - 14, position.y + sprite.height/2-1, 3, 5);
      fill(255);
      rect(position.x + sprite.width / 2 - 24, position.y + sprite.height/2, 10, 3);
    }
  }
}

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
  
  public PVector getCenter()
  {
     return new PVector(x - w/2, y - h/2); 
  }
  
  public boolean contains(PVector v)
  {
     return x < v.x && x + w >  v.x && y < v.y && y + h > v.y;
  }
  
  public boolean intersects(Rectangle r)
  {
     return r.x > x && r.x < x + w && r.y > y && r.y > y + h;
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "rouge" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
