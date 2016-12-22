ArrayList<GameObject> objects;

void setup()
{
  size(800, 600);
  
  objects = new ArrayList<GameObject>();
  objects.add(new HeatSource(new PVector(width / 2, height / 2), 50, 50, color(255, 0, 0), 10));
  objects.add(new Player(new PVector(width - (width / 4), height - (height / 4)), 50, 50, color(255)));
}

void draw()
{
  background(0);
  
  for(GameObject object : objects)
  {
    object.update();
    object.render();
  }
}
