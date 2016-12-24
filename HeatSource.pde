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
    baseFlameDistance = 50;
    flameDistance = baseFlameDistance;
    incrementer = 0;
    
    for(int i = 0; i < numFlames; ++i)
    {
      dancingFlames.add(new Ellipse(new PVector(), 5, 5, color(255, 0, 0)));
      dancingFlames.get(i).angle = i * (TWO_PI / numFlames);
      dancingFlames.get(i).range = 5;
      dancingFlames.get(i).position.x = position.x + (flameDistance * cos(dancingFlames.get(i).angle));
      dancingFlames.get(i).position.y = position.y + (flameDistance * -sin(dancingFlames.get(i).angle));
    }
  }
  
  void update()
  {
    for(int i = 0; i < dancingFlames.size(); ++i)
    {
      flameDistance += cos(incrementer) * dancingFlames.get(i).range;
      
      dancingFlames.get(i).position.x = position.x + (flameDistance * cos(dancingFlames.get(i).angle));
      dancingFlames.get(i).position.y = position.y + (flameDistance * -sin(dancingFlames.get(i).angle));
      
      incrementer += .01;
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
