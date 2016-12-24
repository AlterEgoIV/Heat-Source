class Ellipse extends GameObject
{
  float range;
  
  Ellipse(PVector position, float w, float h, color c)
  {
    super(position, w, h, c);
    angle = 0.0f;
    range = 0.0f;
  }
  
  void update()
  {
    
  }
  
  void render()
  {
    ellipse(position.x, position.y, w, h);
  }
}
