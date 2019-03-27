class Csv_print{
  
  void make_file(){
   PrintWriter writer;
   
   //Create csv file 
   writer = createWriter("Csv/hsv.csv");
    
    //Write Hsv in csv file
   for(int i = 0; i< imalyzer.img_num - 1; i++){
     writer.print(imalyzer.file_name[i] + "," + imalyzer.hsvFinalSum[i][0] + "," + imalyzer.hsvFinalSum[i][1] + "," + imalyzer.hsvFinalSum[i][2] + "\n");
   }
    
    //Writer data save
    writer.flush();
    //Close file
    writer.close();   
  }
   
}
