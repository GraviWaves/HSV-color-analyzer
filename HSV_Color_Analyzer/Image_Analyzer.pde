
class Image_Analyzer{
  String[] file_name;
  String directory;
  
  int img_num;
  int pix[];   //Image's pixels sum
  int hSum[]; //Sum of the pixels hue
  int sSum[]; //Sum of the pixels saturations
  int vSum[]; //Sum of the pixels value
  int hsvFinalSum[][];
  
  float x_max, x_min, y_max, y_min, z_max, z_min;
  
  boolean is_been_loaded;
  
  PImage img[];
  //Constuctor
  Image_Analyzer(String[] _file_name, String _directory, int _file_len){
    this.file_name = _file_name;
    this.directory = _directory.replace("\\", "/"); //Replace escape key \
    this.img_num = _file_len;  
    
    this.hsvFinalSum = new int[img_num][3];
    this.pix = new int[img_num]; 
    this.hSum = new int[img_num];
    this.sSum = new int[img_num];
    this.vSum = new int[img_num];
    this.img = new PImage[img_num];
    this.is_been_loaded = false;
    
    //For translate image in 3D space
    this.x_max = -1000; 
    this.x_min = 1000;
    this.y_max = -1000; 
    this.y_min = 1000;
    this.z_max = -1000; 
    this.z_min = 1000;
    
    image_load();
  }
  
  
  void Update(){
     for(int i = 0; i <= this.img_num - 1; i++){
     // Visualize image on 3D space
       pushMatrix();
         translate(trasl_x(this.hsvFinalSum[i][0]), trasl_y(this.hsvFinalSum[i][1]), trasl_z(this.hsvFinalSum[i][2]));
         rotateX(cam.getRotations()[0]); //Follow the camera rotation X 
         rotateY(cam.getRotations()[1]); //Follow the camera rotation Y
         rotateZ(cam.getRotations()[2]); //Follow the camera rotation Ztake_rotation();
         
         //Show image
           image(img[i], 0, 0, 40, 30);  
           textSize(10);
           text(str(i + 1), 0, 0, 30, 20); //Image number text            
       popMatrix();
    }
  }
  
  void image_load(){
    for(int i = 0; i <= this.img_num - 1; i++){     
      img[i] = loadImage(this.directory + "/" + this.file_name[i]); //Loading alle the image that ezist in the user folder
      println(this.directory + "/" + this.file_name[i]);
    }    
    color_capture(); //Find the average color of every image
  }

  void color_capture(){  
    for(int i = 0; i <= this.img_num - 1; i++){
      int image_heigth = img[i].height; //Image height
      int image_width = img[i].width; //Image width
      
        for(int y = 0; y < image_heigth; y ++){
          for(int x = 0; x < image_width; x ++){
            color c = img[i].get(x, y); //Get pixel from image
      
            int coloH = (int)hue(c); //Get hue from image
            int coloS = (int)saturation(c); //Get saturation from image
            int coloV = (int)brightness(c); // Get brightness from image
      
            this.hSum[i] += coloH;
            this.sSum[i] += coloS;
            this.vSum[i] += coloV;
      
            this.pix[i] ++;        
          } 
        }    
    }
    hvs_average(); //Do the average of the pixels
  }
  
  void hvs_average(){
      // Do the average of hue, saturation and brightness value
      for(int i = 0; i <= this.img_num-1; i++){       
       
        this.hsvFinalSum[i][0] = this.hSum[i]/this.pix[i];
        this.hsvFinalSum[i][1] = this.sSum[i]/pix[i];
        this.hsvFinalSum[i][2] = this.vSum[i]/pix[i];
       
        img_adjust(i); //Adjust the positioning of the images
        
        //println(i+ "| " + hsvFinalSum[i][0], hsvFinalSum[i][1], hsvFinalSum[i][2]);        
    }
        is_been_loaded = true;
  }
  
  void img_adjust(int i){
    //Set 3D space(x, y, z) translate variables
        if (this.x_max < this.hsvFinalSum[i][0]) this.x_max = this.hsvFinalSum[i][0];
        if (this.x_min > this.hsvFinalSum[i][0]) this.x_min = this.hsvFinalSum[i][0];
        if (this.y_max < this.hsvFinalSum[i][1]) this.y_max = this.hsvFinalSum[i][1];
        if (this.y_min > this.hsvFinalSum[i][1]) this.y_min = this.hsvFinalSum[i][1];
        if (this.z_max < this.hsvFinalSum[i][2]) this.z_max = this.hsvFinalSum[i][2];
        if (this.z_min > this.hsvFinalSum[i][2]) this.z_min = this.hsvFinalSum[i][2];      
    } 

  //Disperse image in all the 3D ambient
  float trasl_x(float x) {
    return (x - this.x_min)*(300 - (-300)) / (this.x_max - this.x_min) + (-300);
  }

  float trasl_y(float y) {
    return (y - this.y_min)*(300 - (-300)) / (this.y_max - this.y_min) + (-300);
  }

  float trasl_z(float z) {
    return (z - this.z_min)*(300 - (-300)) / (this.z_max - this.z_min) + (-300);
  }
  
}
