import java.io.File;
import controlP5.*; //GUI
import peasy.*; //Camera control

ControlP5 Button;  
LOGO logo;
GUI gui;
PeasyCam cam;
Image_Analyzer imalyzer;
Space space;
Csv_print csv_print;

// --------------- Camera Variables -----------------
float minCamDistance = 30;
float maxCamDistance = 1500;

// --------------- Background color variables -----------------
color background = color(255, 255, 255);

// --------------- Image load boolean -----------------
public boolean image_has_been_loaded = false;

// --------------- file path variables -----------------
java.io.File folder_path; //It will contain the path selected by users
String[] filenames;  //It will contain all the images path
String directory_path;

//----------------------------------------------------------------------------
//|                               Initialize                                 |
//----------------------------------------------------------------------------
void setup() {
  size(1024, 600, P3D);   //set windows size
  background(background);
  
  Button = new ControlP5(this); //Initialize button from library
  logo = new LOGO();  //Initialize class Logo
  gui = new GUI();   //Initialize class GUI
  space = new Space(); //Initialize class Space
  csv_print = new Csv_print();
  
  gui.add_button(); 
}


//----------------------------------------------------------------------------
//|                               Draw                                       |
//----------------------------------------------------------------------------
void draw() {
 background(255); 
  
  if(!image_has_been_loaded){  //Draw the logo and permit to load image
    gui.show();  
    logo.show();
  }else if(image_has_been_loaded){  //When image has been loaded, hide logo and button and visualize the image
    space.Update();
    imalyzer.Update();
  }

}


//----------------------------------------------------------------------------
//|                             Select folder                                |
//----------------------------------------------------------------------------
void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());        
    folder_path = new java.io.File(selection.getAbsolutePath()); //Take the directory path 
    filenames = folder_path.list();  //Take all the files name
    directory_path = selection.getAbsolutePath();
    
    
    Analyze(); //Inizialize the Image_Analyzer class
  }
}

void Analyze(){
  imalyzer = new Image_Analyzer(filenames, directory_path, filenames.length); //Initialize the Image_Analyzer class
  set_camera();
  image_has_been_loaded = true; //Hide logo and GUI
  Button.hide();  //Hide button

}

//----------------------------------------------------------------------------
//|                        Event Controller                                  |
//----------------------------------------------------------------------------

void controlEvent(ControlEvent theEvent) {
  if (theEvent.getController().getName() == "folder_searcher") {
    selectFolder("Select a folder to process:", "folderSelected"); //Take the image folder path
  }
}

void keyPressed(){
 if (key == ESC) exit(); 
 if (key == 'p') csv_print.make_file();
}


//----------------------------------------------------------------------------
//|                        Camera Controller                                  |
//----------------------------------------------------------------------------

void set_camera(){
 cam = new PeasyCam(this, 0, 0, 0, 800);
   cam.setMinimumDistance(minCamDistance);
     cam.setMaximumDistance(maxCamDistance);   
}
