class HeatSource extends GameObject
{
  ArrayList<Ellipse> dancingFlames;
  int numFlames;
  float baseFlameDistance;
  float flameDistance;
  float incrementer;
  
  HeatSource(PVector position, float w, float h, color c, int numFlames)
  {
    super(position, w, h, c);
    dancingFlames = new ArrayList<Ellipse>();
    this.numFlames = numFlames;
    angle = 0;
    baseFlameDistance = 100;
    flameDistance = baseFlameDistance;
    incrementer = 0;
    
    for(int i = 0; i < numFlames; ++i)
    {
      dancingFlames.add(new Ellipse(new PVector(), 10, 10, color(255, 0, 0)));
      dancingFlames.get(i).angle = i * (TWO_PI / numFlames);
      dancingFlames.get(i).range = 10;
      dancingFlames.get(i).position.x = position.x + (flameDistance * cos(dancingFlames.get(i).angle));
      dancingFlames.get(i).position.y = position.y + (flameDistance * -sin(dancingFlames.get(i).angle));
    }
  }
  
  void update()
  {
    c = color(cos(radians(incrementer)) * 255, 0, 0);
    
    for(int i = 0; i < dancingFlames.size(); ++i)
    {
      flameDistance += cos(incrementer + (5 * i)) * dancingFlames.get(i).range;
      
      dancingFlames.get(i).position.x = position.x + (flameDistance * cos(dancingFlames.get(i).angle));
      dancingFlames.get(i).position.y = position.y + (flameDistance * -sin(dancingFlames.get(i).angle));
      
      incrementer += .02;
      flameDistance = baseFlameDistance;
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