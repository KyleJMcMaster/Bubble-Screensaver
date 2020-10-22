class Bubble {                  //this sets up the properties of each bubble and the fuctions for each

  float x;
  float y;
  float lifespan;
  float size;
  float speed;
  boolean alive = true;
  boolean grow = true;


  Bubble() {                // the constructor to initialize most variables used in the later functions
    x = random(100, 800);    // I used random values here in order to ensure there will be variety
    y = 600;                // in the bubbles
    size = random(20, 80); 
    speed = 8-size/16;      // I wanted speed to be relative to size, the larger the bubble, the slower it goes
    lifespan = 200;
  }

  void ascend() {
    y = y - speed;
  }

  void display() {
    if (lifespan == 0 && alive == true) { 
      activeBubbles--;                    // this updates the number of active bubbles and also 
      alive = false;                      // tells the program when to stop animating the bubble
    }
    if (alive == true) {
      strokeWeight(size/10);              // edge of each bubble is relative to the size
      stroke(255);
      fill(#add8e6, 175);
      ellipse(x, y, size, size);    
      lifespan--;                          // the lifespan lowers each time the bubble is moved
    if (lifespan<4 && grow == true){        
    size = size+20-lifespan;              // the bubble grows as it pops
    grow = false;
    }
    }
  }

  void top() {
    if (y < size/2) {                       // checks when the bubble collides witht the top edge of the screen
      y = size/2;
    }
  }
}