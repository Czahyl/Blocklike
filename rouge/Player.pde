class Player
{
  PImage sprite;
  PVector position, velocity;
  boolean attackLeft = true;

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
    image(sprite, position.x, position.y);

    drawSword(attackLeft);
  }

  private void drawSword(boolean left)
  {
    fill(150, 150, 150);
    rotate(0);

    if (!left)
      rotate(radians(90));

    rect(position.x + sprite.width/2 - 8, position.y + sprite.height/2, 5, 3);
    rect(position.x + sprite.width / 2 - 11, position.y + sprite.height/2-1, 3, 5);
    fill(255);
    rect(position.x + sprite.width / 2 - 21, position.y + sprite.height/2, 10, 3);
  }
}

