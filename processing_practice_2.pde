GifRecorder recorder = new GifRecorder(this);

int unit_size = floor(random(1, 5.999999999999)) * 10;

void setup() {
  size(500, 500);
  background(20, 20, 20);
}

void draw() {
  background(20, 20, 20);
  
  stroke(255);
  noFill();
  for (int i = 0; (i * unit_size) <= height; i++) {
    for (int j = 0; (j * unit_size) <= width; j++) {
      rect((i * unit_size), (j * unit_size), unit_size, unit_size);
    }
  }
  
  if ((second() % 5) == 0) {
    unit_size = floor(random(1, 5.999999999999)) * 10;
  }
  
  recorder.onDraw();
}

void mouseClicked() {
  recorder.recordForSeconds("out.gif", 10);
}

