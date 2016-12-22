class HeatSource extends GameObject
{
  ArrayList<Ellipse> dancingFlames;
  int numFlames;
  float angleInc;
  float amplitude;
  float radius;
  float speed;
  
  HeatSource(PVector position, float w, float h, color c, int numFlames)
  {
    super(position, w, h, c);
    dancingFlames = new ArrayList<Ellipse>();
    this.numFlames = numFlames;
    angle = 0;
    angleInc = 0.05;
    amplitude = 50;
    radius = 50;
    speed = 0;
    
    dancingFlames.add(new Ellipse(new PVector(0, 0), 5, 5, color(255)));
    dancingFlames.get(0).angle = radians(45);
    dancingFlames.get(0).position.x = position.x + (cos(dancingFlames.get(0).angle) * radius);
    dancingFlames.get(0).position.y = position.y + (-sin(dancingFlames.get(0).angle) * radius);
    
    /*for(int i = 0; i < numFlames; ++i)
    {
      dancingFlames.add(new Ellipse(new PVector(), 5, 5, color(255)));
      dancingFlames.get(i).angle = 45;
      dancingFlames.get(i).position.x = position.x + cos((degrees(TWO_PI) / numFlames) * i);
      dancingFlames.get(i).position.y = position.y + -sin((degrees(TWO_PI) / numFlames) * i);
    }*/
  }
  
  void update()
  {
    /*if(sin(radius) < 0)
    {
      speed *= -1;
    }
    
    if(sin(radius) > 0)
    {
      speed *= 1;
    }*/
    
    dancingFlames.get(0).position.x = position.x + (cos(dancingFlames.get(0).angle) * radius);
    dancingFlames.get(0).position.y = position.y + (-sin(dancingFlames.get(0).angle) * radius);
    
    //radius += 1;
    
    println(dancingFlames.get(0).position.x);
    println(dancingFlames.get(0).position.y);
    println(dancingFlames.get(0).angle);
    
    /*for(int i = 0; i < dancingFlames.size(); ++i)
    {
      dancingFlames.get(i).position.x += amplitude * cos(dancingFlames.get(i).angle) * i;
      dancingFlames.get(i).position.y += amplitude * -sin(dancingFlames.get(i).angle) * i;
      
      dancingFlames.get(i).angle += angleInc;
    }*/
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
