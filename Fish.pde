class Fish {                                        //this establishs the fish class and declares the variables I use //<>//
  float fishX;      //Fish x position
  float fishY;      // fish y position
  float fishDirX;    //fish x velocity
  float fishDirY;    //fish y velocity
  float Dir;        // the direction the fish is facing
  float swimX;      //number used to decide if the fish changes it's  X direction
  float swimY;      // the number used to decide if the fish changes it's  Y direction

  Fish() {
    fishX = random(200,700);               
    fishY = random(300,400);
    fishDirX = random(-1, 1);
    if(fishDirX <0.3 && fishDirX >-0.3){      //this ensures the fish doesn't move too slow
      fishDirX = 0.5;
    }
    fishDirY = random(-1, 1);                  //this ensures the fish doesn't move too slow
    if(fishDirY <0.2 && fishDirY >-0.2){
      fishDirY = 0.5;
    }
  }
  void fishDraw() {            // this method draws the fish
    noStroke();              
    fill(#F38630);
    ellipse(fishX, fishY, 100, 50);
    triangle(fishX-45*Dir, fishY, fishX-80*Dir, fishY-30, fishX-80*Dir, fishY+30);
  }

  void fishSwim() {                              // this is the method I used to determine the fish's movements
    swimX = random(99);
    swimY = random(99);
    if (fishX<100 || fishX>800) {                //this keeps the fish in a certain area of the screen
      fishDirX = -fishDirX;
    }
    if (fishY<200 || fishY>500) {                //this keeps the fish in a certain area of the screen
      fishDirY = fishDirY*-1;
    }

    if (swimX <98) {                             //this gives the fish a 98% chance of remaining in he same direction by checking the swim value.
    } else if (swimX<99) {                       // over 30 times per second, it ends up changing more than expected
      fishDirX = -fishDirX;
    }

    if (swimY <98.78) {                          // similar idea to the previous block
    } else if (swimY<99) {
      fishDirY = -fishDirY;
    }

    fishX = fishX + fishDirX;
    fishY = fishY + fishDirY;                    // moves the fish

    if (fishDirX < 0) {
      Dir = -1;                                  //checks the fish's direction
    } else {
      Dir = 1;
    }
  }
}