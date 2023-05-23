PImage img;

void setup(){
  size(1000,750);
  img = null;

}

//windowResizable()

void draw(){
  background(255);
  
  textSize(50);
  fill(0);
  text("Steg", 350, 100);
  text("Select an image", 350, 400);
  
  stroke(0);
  fill(0);
  //rect(300, 400, 350, 80);
  
  if(img != null){
    image(img, 0, 0);
  }
}

void mouseClicked(){
  selectInput("Select a file to process:", "fileSelected");
  //press button
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
