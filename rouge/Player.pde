class Player
{
  PImage sprite;
  PVector position, velocity;
  boolean facingLeft = true;
  boolean attackLeft = false;

  Player(PVector position)
  {
    sprite = textureList.get(1);
    this.position = position;
    velocity = new PVector(0, 0);
  }

  void update()
  {
    position.x += velocity.x;
    position.y += velocity.y;
  }

  void render()
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
      rect(position.x + sprite.width/2 - 8, position.y + sprite.height/2, 5, 3);
      rect(position.x + sprite.width / 2 - 11, position.y + sprite.height/2-1, 3, 5);
      fill(255);
      rect(position.x + sprite.width / 2 - 21, position.y + sprite.height/2, 10, 3);
    }
  }
}

