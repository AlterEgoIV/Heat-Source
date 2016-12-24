class HeatSource extends GameObject
{
  ArrayList<Ellipse> dancingFlames;
  int numFlames;
  float amplitude;
  float radius;
  
  HeatSource(PVector position, float w, float h, color c, int numFlames)
  {
    super(position, w, h, c);
    dancingFlames = new ArrayList<Ellipse>();
    this.numFlames = numFlames;
    angle = 0;
    amplitude = 100;
    radius = 50;
    
    for(int i = 0; i < numFlames; ++i)
    {
      dancingFlames.add(new Ellipse(new PVector(), 5, 5, color(255)));
      dancingFlames.get(i).angle = radians(i * (degrees(TWO_PI) / numFlames));
      //println(dancingFlames.get(i).angle);
      dancingFlames.get(i).position.x = position.x + cos(dancingFlames.get(i).angle) * radius;
      dancingFlames.get(i).position.y = position.y + -sin(dancingFlames.get(i).angle) * radius;
    }
  }
  
  void update()
  {        
    for(int i = 0; i < dancingFlames.size(); ++i)
    {
      dancingFlames.get(i).position.x = position.x + (amplitude * (cos(dancingFlames.get(i).angle) * cos(radius)));
      dancingFlames.get(i).position.y = position.y + (amplitude * (-sin(dancingFlames.get(i).angle) * -sin(radius)));
      
      radius += .01;
    }
  }
  
  void render()
  {
    fill(c);
    ellipse(position.x, position.y, w, h);
    
    for(Ellipse e : dancingFlames)
    {
      fill(e.c);
      e.render();
    }
  }
}
