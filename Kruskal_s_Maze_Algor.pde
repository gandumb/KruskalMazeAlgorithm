/*
*/
MazeGen gen;
int time;

void setup() {
  fill(255);
  size(832,832);
  frameRate(10);
  int scaleFactor = 64;
  gen = new MazeGen(896/scaleFactor, 896/scaleFactor, scaleFactor);
}

void draw() {
  fill(255);
  strokeWeight(4);
  background(255);
  time = second();
  if(!gen.getEdges().isEmpty()) {
      gen.process((gen.getEdges().remove(0)));
    }
  gen.drawMaze();
}
