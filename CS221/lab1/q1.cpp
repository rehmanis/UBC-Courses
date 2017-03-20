// WARNING: This code will NOT compile.  
// It contains the code samples from the cs221 lab 1 write-up.

#include <iostream>

using namespace std; // use standard functions without qualifier

float circleArea(float radius);  // forward function declaration

int main() {
  float circle_radius;
  cout << "Enter radius: " << endl;
  cin >> circle_radius;
  cout << "Area is: " << circleArea(circle_radius) << endl;
  return 0;
}

float circleArea(float radius) {
  return 3.14159 * radius * radius;  // = pi * r^2
}


