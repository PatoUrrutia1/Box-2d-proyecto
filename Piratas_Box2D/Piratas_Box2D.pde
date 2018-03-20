/********* VARIABLES GLOBALES *********/

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world.
Box2DProcessing box2d;

PImage Pantalla1;
PImage Pantalla2;
PImage Pantalla3;
PImage Pantalla4;
PImage Pantalla5;
PImage Pantalla6;

ArrayList<Bala> balas;
ArrayList<Bala2> balas2;


Boundary wall;
Boundary2 wall2;

int gameScreen;
int turn;
float hp1, hp2;

  
// Player 1, 2.
  
barco player1;
barco player2;
  
//Turno para seleccionar.
int ts = 0;

boolean player1Selection = false;
boolean player2Selection = false;
    

/********* SETUP BLOCK *********/
void setup(){
  
  size(800,600);
  background(255);
  
// Initialize box2d physics and create the world.
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
// Turn on collision listening!
  box2d.listenForCollisions();
  
  balas = new ArrayList<Bala>();
  balas2 = new ArrayList<Bala2>();
  
  wall = new Boundary(width/4,height-250,width/5,10);
  wall2 = new Boundary2(3*width/4,height-250,width/5,10); 
  
    
// Barcos jugador 1.
  ElPerlaNegra1 = new barco("El Perla Negra", 80, 7);
  LaHispaniola1 = new barco("La Hispaniola", 70, 10); 
  ElPequod1 = new barco("Pequod", 100, 5);

// Barcos jugador 2.
  ElPerlaNegra2 = new barco("Perla Negra", 80, 7);
  LaHispaniola2 = new barco("La Hispaniola", 70, 10); 
  ElPequod2 = new barco("El Pequod", 100, 5);
  
  
}

/********* DRAW BLOCK *********/
void draw(){
  
  background(255);
  
  // Always step.
  box2d.step();
  
  // Display the contents of the current screen.
  switch (gameScreen) {
    case 0:
      iniScreen();
      break;
    case 1:
      stScreen();
    break;
    case 2:
      charScreen();
    break;
    case 3:
      figScreen();
      
//Barra de vida Player1.

    pushMatrix();
    noStroke();
    fill(0);
    rectMode(CORNER);
    rect(100,50,hp1,30);
    noFill();
    popMatrix();
    
//Barra de vida Player2.

    pushMatrix();
    fill(0);
    rect(500,50,hp2,30);
    noFill();
    popMatrix();
      
      for (int i = balas.size()-1; i >= 0; i--) {
        Bala p = balas.get(i);
        p.display();
        
  // Particles that leave the screen, we delete them.
  // (note they have to be deleted from both the box2d world and our list.
  
          if (p.done()) {
          balas.remove(i);
          }
        }
                
        for (int i = balas2.size()-1; i >= 0; i--) {
        Bala2 p = balas2.get(i);
        p.display();
        
  // Particles that leave the screen, we delete them.
  // (note they have to be deleted from both the box2d world and our list.
  
          if (p.done()) {
          balas2.remove(i);
          }
        }
            
      // Display all the boundaries.
      //wall.display();{
      //}
      //wall2.display();{
      //}
      
    break;
    case 4:
      vicScreen();
    break;
  }
  
   
}

// Collision event functions!

void beginContact(Contact cp) {
  
// Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
// Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
 
  

// Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
 


// Balas desaparecen si se tocan.  
  if (o1.getClass() == Bala.class && o2.getClass() == Bala2.class) {
    Bala p1 = (Bala) o1;
    p1.delete();
    Bala2 p2 = (Bala2) o2;
    p2.delete();
  }
    
  
  if (o1.getClass() == Bala2.class && o2.getClass() == Bala.class) {
    Bala2 p1 = (Bala2) o1;
    p1.delete();
    Bala p2 = (Bala) o2;
    p2.delete();
  }
 
 
  
// Bala.  
  if (o1.getClass() == Boundary2.class) {
    hp2 = hp2 - (random(10,40) - player1.def);
    println(player2.name, hp2);
    Bala p = (Bala) o2;
    p.delete();
    
  }
  
  
// Bala 2.   
  if (o1.getClass() == Boundary.class) {
    hp1 = hp1 - (random(10,40) - player2.def);
    println(player1.name, hp1);
    Bala2 p = (Bala2) o2;
    p.delete();
  }
 

   
// Friendly fire.  


  
}

// Objects stop touching each other
void endContact(Contact cp) {
}

/********* PANTALLAS *********/

// 0: Initial Screen                  (iniScreen)
// 1: Story Screen                    (stScreen)
// 2: Character Selection Screen      (charScreen)                     
// 3: Fighting Screen                 (figScreen)
// 4: Victory Screen                  (VicScreen) 

void iniScreen(){
   
  Pantalla1 = loadImage("Pantalla1.jpg");
  image(Pantalla1,0,0);
  if (mousePressed) {
    gameScreen = 1;
  }
}

void stScreen(){
  
  Pantalla2 = loadImage("Pantalla2.jpg");
  image(Pantalla2,0,0);
  
   if (keyPressed) {
    gameScreen = 2;
  }
}

void charScreen(){
  
  Pantalla3 = loadImage("Pantalla3.jpg");
  image(Pantalla3,0,0);
  
   if (player1Selection && player2Selection){
      
    gameScreen = 3;
    turn =+1;
  }
}
 

void figScreen(){
  
   
  Pantalla4 = loadImage("Pantalla4.jpg");
  image(Pantalla4,0,0);
  
  //BATALLA
  
  switch (turn){
   case 1:
  keyPressed();
      if ((key == 'Q') || (key == 'q')){
        balas.add (new Bala(300,300,5));
      
        turn = 2;
      }
      break;
          
   case 2:   
  keyPressed();
      if ((key == 'P') || (key == 'p')){
        balas2.add (new Bala2(500,300,5));
        turn = 1;
      }
    
  }
  
  if(hp1 <= 0 || hp2 <=0){
    gameScreen = 4;
  }
}

void vicScreen(){
  
// Código de pantalla de victoria.
  background(0);
  
  textAlign(CENTER, CENTER);
  fill(255);
  
  if (hp1 > 0){
    Pantalla5 = loadImage("Pantalla5.jpg");
    image(Pantalla5,0,0);
  }
  else if(hp2 > 0){
    Pantalla6 = loadImage("Pantalla6.jpg");
    image(Pantalla6,0,0);
  }
  
  //text("Haz click para seleccionar personaje", 400, 300);
  if (mousePressed){
    gameScreen = 2;
    player1Selection = false;
    player2Selection = false;
    ts = 0;
    turn = 0;
   
  }
}

/********* INPUTS *********/
void mousePressed (){
  
  if (gameScreen == 2) {
      
     if ((mouseX> 0) && (mouseX< 267) && (mouseY> 0) && (mouseY< 600)){
        //println("mouse sobre Batman");
        if (ts == 0){
          player1 = ElPerlaNegra1;
          hp1 = player1.hp;
          player1Selection = true;
          ts = 1;
          println("Player 1 elige al Perla Negra");           
        }
        else if (ts == 1){
          player2 = ElPerlaNegra2;
          hp2 = player2.hp;
          player2Selection = true;
          println("Player 2 elige al Perla Negra");
           
         }
         //cBatman = color(random(255),random(255),random(255)); 
     }
                       
     if( (mouseX> 267) && (mouseX< 533) && (mouseY> 0) && (mouseY< 600)){
        //println("mouse sobre Spiderman");
        if (ts == 0){
          player1 = LaHispaniola1;;
          hp1 = player1.hp;
          player1Selection = true;
          ts = 1;
          println("Player 1 elige a La Hispaniola");
        }
        else if (ts == 1){
          player2 = LaHispaniola2;
          hp2 = player2.hp;
          player2Selection = true;
          println("Player 2 elige a La Hispaniola");
    
        }
        //cSpiderman = color(random(255),random(255),random(255));
     }
           
     if( (mouseX> 533) && (mouseX< 800) && (mouseY> 0) && (mouseY< 600)){
        //println("mouse sobre Kick-Ass");
        if (ts == 0){
          player1 = ElPequod1;
          hp1 = player1.hp;
          player1Selection = true;
          ts = 1;
          println("Player 1 elige al Pequod");
        }
        else if (ts == 1){
          player2 = ElPequod2;
          hp2 = player2.hp;
          player2Selection = true;
          println("Player 2 elige al Pequod");
          
        }
        //cKickAss = color(random(255),random(255),random(255)); 
     }
            
     
  }
}

    
  