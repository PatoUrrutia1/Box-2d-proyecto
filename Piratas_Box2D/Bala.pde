class Bala {
  
//Atributos
  Body body;
  float r;
  
  color col;

  boolean delete = false;

  
// Parámetros del método de consturcción de clase.
  
  Bala (float x, float y,float r_){
    
// Parámetros del método de construcción se asignan como valores de atributos.
  
    r = r_;
    
// This function puts the particle in the Box2d world.
    makeBody(x, y, r);
    body.setUserData(this);
    col = color(0);     
    body.setLinearVelocity(new Vec2(random(0,30),random(0,20)));
      
  }
  
//This function removes the particle from the box2d world.
  void killBody() {
    box2d.destroyBody(body);
  }
  
  void delete() {
    delete = true;
  }

// Change color when hit
  void change() {
    col = color(255, 0, 0);
  }
  
  boolean done() {
    
// Let's find the screen position of the particle.

    Vec2 pos = box2d.getBodyPixelCoord(body);
    
// Is it off the bottom of the screen?
   
    if (pos.y > height+r*2 || delete) {
      killBody();
      return true;
    }
    return false;
  }
  

void display(){
  
//Look at each body and get its screen position.

  Vec2 pos = box2d.getBodyPixelCoord(body);
  
  pushMatrix();
  translate(pos.x,pos.y);
  fill(col);
  noStroke();
  ellipse(0,0,r*2,r*2);
  popMatrix();
}

// Here's our function that adds the particle to the Box2D world.
   
   void makeBody(float x, float y, float r){
     
// Define the body.
    BodyDef bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
        
//Create the body.  
    body = box2d.createBody(bd);
    
// Create the shape.
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
 // Parameters that affect physics.
    fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.5;
    
// Attach fixture to body.
    body.createFixture(fd);
     
   }
  
  
  // Here's our function that adds the particle to the Box2D world.
   
   void makeBody2(float x, float y, float r){
     
// Define the body.
    BodyDef bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
        
//Create the body.  
    body = box2d.createBody(bd);
    
// Create the shape.
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
 // Parameters that affect physics.
    fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.5;
    
// Attach fixture to body.
    body.createFixture(fd);
     
   }
  
    
}


class Bala2 {
  
//Atributos
  Body body;
  float r;
  
  color col;

  boolean delete = false;

  
// Parámetros del método de consturcción de clase.
  
  Bala2 (float x, float y,float r_){
    
// Parámetros del método de construcción se asignan como valores de atributos.
  
    r = r_;
    
// This function puts the particle in the Box2d world.
    makeBody(x, y, r);
    body.setUserData(this);
    col = color(175);     
    body.setLinearVelocity(new Vec2(random(-20,0),random(20,0)));
      
  }
  
//This function removes the particle from the box2d world.
  void killBody() {
    box2d.destroyBody(body);
  }
  
  void delete() {
    delete = true;
  }

// Change color when hit
  void change() {
    col = color(255, 0, 0);
  }
  
  boolean done() {
    
// Let's find the screen position of the particle.

    Vec2 pos = box2d.getBodyPixelCoord(body);
    
// Is it off the bottom of the screen?
   
    if (pos.y > height+r*2 || delete) {
      killBody();
      return true;
    }
    return false;
  }
  

void display(){
  
//Look at each body and get its screen position.

  Vec2 pos = box2d.getBodyPixelCoord(body);
  
  pushMatrix();
  translate(pos.x,pos.y);
  fill(col);
  noStroke();
  ellipse(0,0,r*2,r*2);
  popMatrix();
}

// Here's our function that adds the particle to the Box2D world.
   
   void makeBody(float x, float y, float r){
     
// Define the body.
    BodyDef bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
        
//Create the body.  
    body = box2d.createBody(bd);
    
// Create the shape.
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
 // Parameters that affect physics.
    fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.5;
    
// Attach fixture to body.
    body.createFixture(fd);
     
   }
  
  
  // Here's our function that adds the particle to the Box2D world.
   
   void makeBody2(float x, float y, float r){
     
// Define the body.
    BodyDef bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
        
//Create the body.  
    body = box2d.createBody(bd);
    
// Create the shape.
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
 // Parameters that affect physics.
    fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.5;
    
// Attach fixture to body.
    body.createFixture(fd);
     
   }
  
    
}