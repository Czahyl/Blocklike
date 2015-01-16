public class MenuManager
{
  private currentMenu;

  private HashMap<String, PFont> fontCache;

  public MenuManager()
  {
    fontCache = new HashMap<String, PFont>();
  }

  public boolean doesMenuPause()
  {
    if(currentMenu != null)
        return currentMenu.doesPause();

    return false;
  }

  public void draw()
  {
    if(currentMenu != null)
        currentMenu.draw()
  }

  public void showMenu(Menu menu)
  {
    currentMenu = menu;

    if(currentMenu != null)
        currentMenu.init(this);
  }

  public PFont cacheFont(String key, String name, int size)
  {
    if(fontCache.keys().contains(key))
    {
        return fontCache.get(key);
    }

    return createFont(name, size);
  }
}

abstract class Menu
{
  public abstract void init(MenuManager parent);
  public abstract void draw();
  public abstract void keyPressed(int keyCode);
  public abstract boolean doesPause();
}

public final class MainMenu extends Menu
{
  private int index = 0;
  private String[] selections = { "Play", "Options", "Quit"  };
  private MenuManager parent;

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

    if(keyCode == ENTER)
        itemSelected();
  }

  public void itemSelected()
  {
    
  }

  public boolean doesPause()
  {
    return true;
  }
}

