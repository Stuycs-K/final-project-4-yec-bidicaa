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
    background(50);
    fill(255);
    rect(0, 0, 250, 750);
    int num_of_filts = 10; //how many filters will be used
    // change ^variable to accomodate if we add/remove filters
    for( int i=0; i<750; i+=(750/num_of_filts)){
      rect(0, i, 250, (750/num_of_filts));
    }
  }
  if(img != null){
    mode = true;
    image(img, 260, 10); // (Afia) changed x,y to go auto to display window
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
