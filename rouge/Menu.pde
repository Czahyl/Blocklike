class GUIText
{
  String text;
  PFont font;
  int size;
  PVector position;
  color clr;

  GUIText(String text, PFont font, int size, PVector position, color clr)
  {
    this.text = text;
    this.font = font;
    this.size = size;
    this.position = position;
    this.clr = clr;
  }
}

class Menu
{
  private ArrayList<PImage> renderables = new ArrayList<PImage>();
  private ArrayList<PVector> renderPos = new ArrayList<PVector>();
  private ArrayList<GUIText> guiText = new ArrayList<GUIText>();

  ArrayList<String> selections = new ArrayList<String>();
  PVector selectPosition;
  int selection = 0;

  PImage bg;

  private int wX, hY;
  boolean closed = false;

  Menu(int wX, int hY)
  {
    this.wX = wX;
    this.hY = hY;

    bg = textureList.get(0);
  }
  
  void keyPressed() 
{
  if (key == CODED)
  {
    if (keyCode == UP)
      currentMenu.selection--;
    else if (keyCode == DOWN)
      currentMenu.selection++;
  }
}

  void show()
  {
    if(closed) return;
    
    image(bg, 0, 0);

    if (selection < 0)
      selection = selections.size()-1;
    else if (selection > selections.size()-1)
      selection = 0;

    for (int i = 0; i < selections.size (); i++)
    {
      if (selection == i)
        fill(125);
      else
        fill(50);

      textFont(mainFont, 32);
      textAlign(CENTER);
      text(selections.get(i), selectPosition.x, selectPosition.y + (32 * i));
    }

    for (int i = 0; i < guiText.size (); i++)
    {
      GUIText text = guiText.get(i);

      textFont(text.font, text.size);
      textAlign(CENTER);
      fill(text.clr);
      text(text.text, text.position.x, text.position.y);
    }
  }

  void addRenderable(PImage img, PVector pos)
  {
    renderables.add(img);
    renderPos.add(pos);
  }
}

