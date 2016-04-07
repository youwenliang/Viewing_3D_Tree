// Viewing a 3D recursive tree
// Modified from Alasdair Turner's code
 
boolean init = false;
ArrayList rotation1 = new ArrayList();
ArrayList rotation2 = new ArrayList();
int id1 = 0;
int id2 = 0;
int moveX = 0;
int moveY = 0;
int angle = 6;

void setup()
{
  size(displayWidth,displayHeight ,P3D);
  smooth();
  noLoop();
}

void draw()
{ 
  background(255);
  strokeWeight(15);
  stroke(45);
  
  translate(width/2,height);
  if(init) {
    // rotateX(-PI/2*(mouseY)/width);
    rotateY(2*PI*(mouseX-moveX)/width);
  }
  //Draw Tree
  branch(-5);
  init = true;
}
 
void branch(int depth)
{ 
    if (depth < 10) {
      line(0,0,0,-height/4);
      pushMatrix();
      {
        translate(0,-height/6);
        if(!init) {
          float k1x = random(-PI/angle,PI/angle); 
          rotateX(k1x);
          float k1y = random(-PI/angle,PI/angle);
          rotateY(k1y);
          float k1z = random(-PI/angle,PI/angle);
          rotateZ(k1z);
          rotation1.add(k1x);
          rotation1.add(k1y);
          rotation1.add(k1z);
        }
        else {
          float kp1x = (Float)rotation1.get(id1); 
          rotateX(kp1x);
          id1++;
          float kp1y = (Float)rotation1.get(id1); 
          rotateY(kp1y);
          id1++;
          float kp1z = (Float)rotation1.get(id1); 
          rotateZ(kp1z);
          id1++;
          
        }
        
        scale(0.7);
        branch(depth + 1);
      }
      popMatrix();
      pushMatrix();
      {
        translate(0,-height/4);
        if(!init) {
          float k2x = random(-PI/angle,PI/angle); 
          rotateX(k2x);
          float k2y = random(-PI/angle,PI/angle);
          rotateY(k2y);
          float k2z = random(-PI/angle,PI/angle);
          rotateZ(k2z);
          rotation2.add(k2x);
          rotation2.add(k2y);
          rotation2.add(k2z);
        }
        else {
          float kp2x = (Float)rotation2.get(id2); 
          rotateX(kp2x);
          id2++;
          float kp1y = (Float)rotation2.get(id2); 
          rotateY(kp1y);
          id2++;
          float kp1z = (Float)rotation2.get(id2); 
          rotateZ(kp1z);
          id2++;
          
        }
        
        scale(0.7);
        branch(depth + 1);
      }
      popMatrix();
    }
}

void mouseClicked(){
  init = false;
  rotation1 = new ArrayList();
  rotation2 = new ArrayList();
  id1 = 0;
  id2 = 0;
  redraw();
  moveX = mouseX;
  moveY = mouseY;
}

void mouseMoved(){
  if(init) {
    id1 = 0;
    id2 = 0;
    redraw();
  }
}
