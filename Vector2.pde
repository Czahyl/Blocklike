public class Vector2
{
    private int x;
    private int y;

    public Vector2(int X, int Y) {
        x = X;
        y = Y;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public void setX(int X) {
        x = X;
    }

    public void setY(int Y) {
        y = Y;
    }

    public void offset(int xoff, int yoff) {
        x += xoff;
        y += yoff;
    }

    public void offset(Vector2 offset) {
        x += offset.x;
        y += offset.y;
    }
}
