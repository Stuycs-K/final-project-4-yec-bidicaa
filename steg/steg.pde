PImage img;

void setup(){
  size(1000,750);
  img = loadImage("Untitled.jpeg");
  print("Select afile");
  selectInput("Select a file to process:", "fileSelected");
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
  
}

//windowResizable()

void draw(){
  stroke(0);
  fill(0);
  rect(0, 0, 250, height); 
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
