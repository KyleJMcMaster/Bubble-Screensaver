Bubble[] bubbles = new Bubble[10000]; //setting up the array and object for bubbles and Bubble
Fish fish0;
Fish fish1;

int clicks = 0;
int saves = 0;
int activeBubbles = 0;
boolean once = true;

void setup() {
  size(900, 640);
  for (int i = 0; i < bubbles.length-1; i++) { //Loop to create new bubbles and to ensure 
    bubbles[i] = new Bubble();                 // none go over then array limit
    fish0 = new Fish();
    fish1 = new Fish();
  }
}
void keyPressed() { 
  if (key == ' ') {                            // each key press adds another bubble to the array
    clicks ++;
    activeBubbles++;
  }
}


void mousePressed(){
 saves++;
 save("Screenshots"+"/"+"Kyle_McMaster_Project_1_"+ saves + hour()+"_"+minute()+"_"+second()+"_"+".jpg"); // save function but with a variable so you can save various screen shots
 }
 
void draw() {
  drawing();                                   //function to draw the background
  if (keyPressed == false && once == true) {   // tells the user what to do, disappears when done
    fill(96, 152, 200);
    textSize(100);
    text("Press Space", 175, height/2);
  } else {
    once = false;
  }

  for (int i = 0; i < clicks; i++) {            //loop to creat a new bubble after every
    bubbles[i].ascend();                        //space press and then move it, draw it, 
    bubbles[i].display();                        // and check for if it hits the top
    bubbles[i].top();
  }
  fish0.fishDraw();
  fish0.fishSwim();
  fish1.fishDraw();
  fish1.fishSwim();
  println(activeBubbles);                        // prints total number of active bubbles
  // I used it to check what my array max should be
}