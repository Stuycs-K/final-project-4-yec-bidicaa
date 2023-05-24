PImage img;
Boolean mode;

void setup(){
  size(1000,750);
  img = null;
  mode = false;

}

//windowResizable()

void draw(){
  if(!mode){
    background(54, 85, 119);
    
    stroke(255);
    strokeWeight(5);
    fill(54, 85, 119);
    rect(340, 345, 350, 80, 10);
    
    textSize(100);
    fill(255);
    text("Steg", 415, 280);
    textSize(50);
    text("Select an image", 350, 400);
  }
  if(mode){
    background(0);
  }
  if(img != null){
    mode = true;
    image(img, 0, 0);
  }
}

void mouseClicked(){
  if(mouseX >= 340 && mouseX <= 340+350 && mouseY >= 345 && mouseX >= 345+80){
    selectInput("Select a file to process:", "fileSelected");
  } //press button
}

void fileSelected(File selection){
  if (selection == null) {
    println("Window closed or cancelled.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    img = loadImage(selection.getAbsolutePath());
  }
  
}

//Filename Window
  //this is a window at the start that sets var for file name
  //user types file name in the window then clicks enter 
    //if the file is not valid, call the filename window again
    //else, go to filters
//Filters window
  //option/list
    //everytime a filter is chosen from list
      //a function is called to redraw the window
      //basically each filter is one function
    //window with picture
      //this part of the screen shows the image
