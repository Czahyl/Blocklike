import java.awt.Rectangle;

Rectangle prect; //The 'player' rectangle
Rectangle srect; //The sword or weapon animation rectangle

Vector2 pos = new Vector2(100, 100);
Vector2 pvel = new Vector2(0, 0); //Player velocity

boolean attacking = false;

void setup() {
    size(300, 300);
    prect = new Rectangle(pos.getX(), pos.getY(), 16, 16);
    srect = new Rectangle((prect.x / 2) - 10, prect.y, 20, 4);
}

void keyPressed() {
    if(key == 'q')
    {
        exit();
    }

    if(key == 'x')
    {
        attacking = true;
    }

    if(keyCode == 37)
    {
        pvel = new Vector2(-2, 0);
    }
    else if(keyCode == 39)
    {
        pvel = new Vector2(+2, 0);
    }
    else if(keyCode == 38)
    {
        pvel = new Vector2(0, -2);
    }
    else if(keyCode == 40)
    {
        pvel = new Vector2(0, +2);
    }
}

void keyReleased() {
    if(key == 'x')
    {
        attacking = false;
    }

    if(keyCode == 37 || keyCode == 38 || keyCode == 39 || keyCode == 40) {
        pvel = new Vector2(0, 0);
    }
}

void draw() {
    clear();
    
    pos.offset(pvel);

    prect.x = pos.x;
    prect.y = pos.y;

    fill(255, 0, 0);
    rect(prect.x, prect.y, prect.width, prect.height);

    if(attacking)
    {
        srect.x = prect.x - 10;
        srect.y = prect.y;
    }
    else
    {
        srect.x = prect.x;
        srect.y = prect.y;
    }

    fill(255, 255, 255);
    rect(srect.x, srect.y, srect.width, srect.height);
}
