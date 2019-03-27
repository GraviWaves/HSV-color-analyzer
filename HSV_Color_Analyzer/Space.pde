class Space{
  
 void Update(){
  //Draw the background line
  
 
    // write hue, saturation, brightness (x, y, z)line
        
    stroke(255, 0, 0);
      line(-255, 0, 0, 300, 0, 0);
        //Rotate text on X
        pushMatrix();
          text("Hue", 255, 0, 0);
              rotateX(cam.getRotations()[0]); //Follow the camera rotation X 
        popMatrix();
        
    stroke(0, 255, 0);
      line(0, -255, 0, 0, 300, 0);
        
        //Rotate text on Y
        pushMatrix();
          text("Saturation", 0, 255, 0);
          rotateY(cam.getRotations()[1]); //Follow the camera rotation Y
        popMatrix();
        
    stroke(0, 0, 255);
      line(0, 0, -255, 0, 0, 300);
        
        //Rotate text on Z
        pushMatrix();
          text("Brightness", 0, 0, 255);
          rotateZ(cam.getRotations()[2]); //Follow the camera rotation Z
        popMatrix();
        
    // create the rect
    pushMatrix();
      stroke(0);
        noFill();  
          box(100);
    popMatrix();
   
 }
  
}
