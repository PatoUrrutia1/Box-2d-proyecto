class Boundary {
  
  float x;
  float y;
  float w;
  float h;
  
  Body b;

  Boundary(float x_,float y_, float w_,float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
  
   
  // Create the polygon.
    PolygonShape sd = new PolygonShape();
  
  //Box2d coordinates.
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    
    sd.setAsBox(box2dW, box2dH);
    
  // Create the body.
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
        
  //Create the body.  
    b = box2d.createBody(bd);
    
  // Create a Fixture.
   b.createFixture(sd,1);
   b.setUserData(this);
  }
  
void display(){
  
    fill(0);
    stroke(0);
    //arc(x,y,150,120,radians(0),radians(180),OPEN);
    rectMode(CENTER);
    rect(x,y,w,h);
   
  }
  
}

class Boundary2 {
  
  float x;
  float y;
  float w;
  float h;
  
  Body b;

  Boundary2(float x_,float y_, float w_,float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
  
   
  // Create the polygon.
    PolygonShape sd = new PolygonShape();
  
  //Box2d coordinates.
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    
    sd.setAsBox(box2dW, box2dH);
    
  // Create the body.
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
        
  //Create the body.  
    b = box2d.createBody(bd);
    
  // Create a Fixture.
   b.createFixture(sd,1);
   b.setUserData(this);
  }
  
void display(){
  
    fill(0);
    stroke(0);
    //arc(x,y,150,120,radians(0),radians(180),OPEN);
    rectMode(CENTER);
    rect(x,y,w,h);
   
  }
  
}