#include <iostream>

int main() {
  int* p1;
  int* p2;
  int x = 5;
  int y = 15;

  p1 = &x; 	 	// x contains 5; y 15; p1 points to address of x; p2 points to garbage address
  
 	
 
  p2 = &y;	 	// x contains 5; y 15; p1 points to address of x; p2 points to address of y
 
  *p1 = 6; 		// x contains 6; y 15; p1 points to address of x with value 6; p2 points to address of y
 
  *p1 = *p2;	// x contains 15; y 15; p1 points to address of x with value 15 ; p2 points to address of y
 
  p2 = p1; 		// x 15; y 15; p1 points to address of x ; p2 points to p1 which points to address of x
 
  *p1 = *p2+10; // x 25; y 15;p1 points to x ; p2 points to p1 which points to x
 		
 	std::cout << "x: " << x << "y: "<< y << std::endl; 	 
  return 0;
}
