class LOGO{
 PImage logo;
 
 LOGO(){
   this.logo = loadImage("Images/hsv_logo.png");   
 }
  
  void show(){
    imageMode(CENTER);
    image(logo, width/2, logo.height/2);   
    key_explanation();
    credits();
  }
  
  void key_explanation(){
   textAlign(LEFT);
   textSize(15);
   text("1) Select folder", 20, height/2, 300, 50);
   text("2) IMAGE file only", 20, height/2 + 20, 300, 50);
   text("3) Control camera by using mouse", 20, height/2 + 40, 300, 50);
   text("4) Press (P) for csv output", 20, height/2 + 60, 300, 50);
    
  }
  
  void credits(){   
   textAlign(RIGHT);
   textSize(15);
   text("Program created by Mirko Romano",width-320, height - 20, 300, 50);     
  }
  
}
