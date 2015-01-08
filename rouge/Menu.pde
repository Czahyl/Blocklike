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

