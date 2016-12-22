abstract class GameObject
{
  PVector position;
  float w, h;
  float angle;
  color c;
  
  GameObject(PVector position, float w, float h, color c)
  {
    this.position = position;
    this.w = w;
    this.h = h;
    this.c = c;
  }
  
  abstract void update();
  abstract void render();
}
