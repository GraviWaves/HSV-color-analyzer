
class GUI{
 int buttonX, buttonY, buttonW, buttonH;
 color button_normal, button_pressed;
 
  GUI(){
    this.buttonW = 200;
    this.buttonH = 40;
    this.buttonX = width/2 - buttonW/2;
    this.buttonY = height/2 + 150;    
    this.button_normal = color(0, 126, 219);
    this.button_pressed = color(13, 56, 88);
  }
  
  void show(){
   add_text();
  }
  
  void add_button(){
     Button.addButton("folder_searcher") //Add button and set GUI things
      .setLabel("Open")
      .setPosition(this.buttonX, this.buttonY)
      .setSize(this.buttonW, this.buttonH)  
      .setColorBackground(this.button_normal)
      .setColorActive(this.button_pressed);
  }
 
  void add_text(){
   pushMatrix();
     fill(0);
     textAlign(CENTER);
     textSize(20);
     strokeWeight(1);
     text("SELECT A FOLDER", this.buttonX, this.buttonY - 40, 200, 50); 
   popMatrix();
  }
  
}
