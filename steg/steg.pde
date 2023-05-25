PImage img;
Boolean mode;
int num_of_filts;

void setup(){
  size(1000,750);
  img = null;
  mode = false;
  num_of_filts = 10; //how many filters will be used
  // change ^variable to accomodate if we add/remove filters

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
    stroke(0);
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
  if(!mode){
    selectInput("Select a file to process:", "fileSelected");
  }
  if(mode){
    int funct_to_call = int(mouseY/(750/num_of_filts));
    //tells us which box (0 through numoffilts-1) to call the function for
    
    /*
    NEXT STEPS:
    find if java allows arrays of functions (probably doesnt)
    the idea was to call function at funct_to_call index in array
    if no array for functions, then it'll just be if-elif-else chain
    */
  }
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
