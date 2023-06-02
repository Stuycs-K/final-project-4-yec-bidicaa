PImage img;
PImage imgnew;
Boolean mode;
int num_of_filts;
int funct_to_call = 0;
String label = "";

void setup(){
  size(750,750);
  img = null;
  mode = false;
  num_of_filts = 32; //how many filters will be used
  // change ^variable to accomodate if we add/remove filters

}

void draw(){
  //Filename Window
  //window start that sets var for file name
  if(!mode){
    background(54, 85, 119);
    
    stroke(255);
    strokeWeight(5);
    fill(54, 85, 119);
    rect(200, 345, 350, 80, 10);
    
    textSize(100);
    fill(255);
    text("Steg", 275, 280);
    textSize(50);
    text("Select an image", 210, 400);
  }
  if(mode){
    String rgb = "";
    
    background(50);
    fill(50);
    stroke(255);
    strokeWeight(3);
    rect(320, 700, 50, 30, 10);
    rect(380, 700, 50, 30, 10);
    textSize(30);
    fill(255);
    text("<", 338, 725);
    text(">", 398, 725);
    
    if(funct_to_call == 0){
      label = "Normal Image";
      
    } else if(funct_to_call == 1){
      for(int i = 0; i < img.width * img.height; i++){
        color c = img.pixels[i];
        int r = ((int)red(c) ^ 255);
        int g = ((int)green(c) ^ 255);
        int b = ((int)blue(c) ^ 255);
        imgnew.pixels[i] = color(r, g, b);
      }
      imgnew.updatePixels();
      label = "Color Inversion (Xor)";
      
    } else if(funct_to_call >= 2 && funct_to_call <= 33){
      int col = (funct_to_call-2)/8;
      int bit = 7-(funct_to_call - 2)%8;
      
      if(col == 0){
        rgb = "a";
        label = "Alpha Plane ";
      } else if(col == 1){
        rgb = "r";
        label = "Red Plane ";
      } else if(col == 2){
        rgb = "g";
        label = "Green Plane ";
      } else if(col == 3){
        rgb = "b";
        label = "Blue Plane ";
      }
      fil(bit,rgb);
      label += str(bit);
    } else if(funct_to_call == 34){
      label = "Full Alpha";
      fil(9,"a");
    } else if(funct_to_call == 35){
      label = "Full Red";
      fil(9,"r");
    } else if(funct_to_call == 36){
      label = "Full Green";
      fil(9,"g");
    } else if(funct_to_call == 37){
      label = "Full Blue";
      fil(9,"b");
    }
    fill(255);
    textSize(20);
    text(label, 10, 20);
    
  }
  
  if(img != null){
    mode = true;
    if(funct_to_call == 0){
      image(img, 0, 30);
    } else {
    image(imgnew, 0, 30);
    }
  }
  
}

void mouseClicked(){
  if(!mode && mouseX >= 200 && mouseX <= 200+350 && mouseY >= 345 && mouseY <= 345+80){
    selectInput("Select a file to process:", "fileSelected");
  }
  if(mode){
    if(mouseX >= 320 && mouseX <= 320+50 && mouseY >= 700 && mouseY <= 700+30){
      if(funct_to_call == 0){
        funct_to_call = 37;
      } else {
        funct_to_call--;
      }
    }
    if(mouseX >= 380 && mouseX <= 380+50 && mouseY >= 700 && mouseY <= 700+30){
      if(funct_to_call == 37){
        funct_to_call = 0;
      } else {
        funct_to_call++;
      }
    }
    
   }

}

void fileSelected(File selection){
  if (selection == null) {
    println("Window closed or cancelled.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    img = loadImage(selection.getAbsolutePath());
    imgnew = img.copy();
  }
}

void fil(int bitVal, String rgb) {
  for(int i = 0; i < img.width * img.height; i++){
    int c = img.pixels[i];
    if(bitVal == 9){
      if(rgb == "r") {
        imgnew.pixels[i] = color((int)red(c), 0, 0);
      } else if(rgb == "g") {
        imgnew.pixels[i] = color(0, (int)green(c), 0);
      } else if(rgb == "b") {
        imgnew.pixels[i] = color(0, 0, (int)blue(c));
      } else if(rgb == "a") {
        imgnew.pixels[i] = color((int)alpha(c),0,0,0);
      }
    } else {
      int bit = (int)Math.pow(2, bitVal);
      int col = 0;
      if(rgb == "r") {
        col = (int)red(c);
      } else if(rgb == "g") {
        col = (int)green(c);
      } else if(rgb == "b") {
        col = (int)blue(c);
      } else if(rgb == "a") {
        col = (int)alpha(c);
      }
      col = (col & bit) >> bitVal;
      imgnew.pixels[i] = color(col * 255);
    }  
  }
  imgnew.updatePixels();
}

void keyPressed(){
  if(keyCode == RIGHT && mode){
    if(funct_to_call == 37){
        funct_to_call = 0;
      } else {
        funct_to_call++;
      }
  }
  if(keyCode == LEFT && mode){
    if(funct_to_call == 0){
        funct_to_call = 37;
      } else {
        funct_to_call--;
      }
  }
  //testing purposes
  if(key == 'p'){
    selectInput("Select a file to process:", "fileSelected");
  }
  if(key == 'm' && mode == true){
    mode = false;
  } else if(key == 'm' && mode == false){
    mode = true;
  } 
}

    
