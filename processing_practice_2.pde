GifRecorder recorder = new GifRecorder(this);

Backgroud background = new Backgroud();

void setup() {
  size(500, 500);

  background.update();
}

void draw() {
  background.update();
  
  recorder.onDraw();
}

class Backgroud {

  int unit_size = floor(random(1, 5.999999999999)) * 10;
  boolean reset_flag = true;
  int reset_second = 0;
  
  void update() {
    background(20, 20, 20);
    stroke(255);
    noFill();
    
    for (int i = 0; (i * unit_size) <= height; i++) {
      for (int j = 0; (j * unit_size) <= width; j++) {
        rect((i * unit_size), (j * unit_size), unit_size, unit_size);
      }
    }
    
    if (reset_flag) {
      unit_size = floor(random(1, 5.999999999999)) * 10;
      reset_flag = false;
    }
    
    int second = second();
    if ((second % 5) == 0) {
      if (second != reset_second) {
        reset_flag = true;
        reset_second = second;
      }
    }
  }

}

void mouseClicked() {
  recorder.recordForSeconds("out.gif", 10);
}
