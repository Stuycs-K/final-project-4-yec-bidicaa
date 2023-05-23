
void setup(){
  size(1000,750);
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
      
void draw() {
  background(0);
  fill(255);
  rect(0, 0, 250, 750);
  int num_of_filts = 10; //how many filters will be used
  // change ^variable to accomodate if we add/remove filters
  for( int i=0; i<750; i+=(750/num_of_filts)){
    rect(0, i, 250, (750/num_of_filts));
  }
}
/*
 pseudocode for each method:
 for pixels in height:
   for pixels in width:
     redraw each pixel by calculating new val
   make an arraylist of pixel values
   redraw entire image in window based on values*/
   
// HOW ARE WE READING THE IMAGE??
// I NEED TO KNOW THIS BEFORE CREATING FUNCTIONS
// ^i added this because i keep forgetting to ask lol
