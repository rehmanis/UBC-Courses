#include <iostream>
#include <cstdlib>
#include "insertion.h"

// insertion sort with several errors

// store command-line arguments in x[] array 
void getArgs( int argc, char **argv ) {
  x_size = argc - 1;
  for(int i = 0; i < x_size; i++ )
    x[i] = atoi( argv[ i + 1 ] );
}

void scootOver( int j ) {
  for(int k = y_size; k > j; k-- ){
  	std::cout << "			inside scoot. k= "<< k << " j= "<< j << std::endl;
    y[k] = y[ k - 1 ];
  } 
}

void insert( int xx ) {
	//std::cout << "inside of insert" << std::endl;
	std::cout << "value of y_size is " << y_size << std::endl;	
  if( y_size == 0 ) {
  	std::cout << "	inside ifstat of insert. Value of xx = " << xx << std::endl;
    y[0] = xx;
 
    return;
  }
  
  // Need to insert just before the first y element that xx is less than
  for(int j = 0; j < y_size; j++ ) {
  std::cout << "	inside loop j = "<< j <<" xx = "<< xx << std::endl;
    if( xx < y[j] ) {
      // shift y[j], y[ j+1 ], ... rightward before inserting xx
      std::cout << "		inside ifstat of loop" << std::endl;
      scootOver( j );
      y[j] = xx;
      std::cout << "		value of y at index " << j << " is " << y[j] << std::endl;
      return;
    }
    else
    	y[y_size] = xx;
    
  }
}

void processData() {
  for(int i = 0; i < x_size; i++ ) {
    y_size = i; 
    // put  x[ i ] in the proper place among y[0],....,y[ y_size - 1 ]
    insert( x[ i ] );
  } 
}

void printResults() {
  for(int i = 0; i < x_size; i++ ){
    std::cout << y[i] << " ";
  } 
  std::cout << std::endl;
}

int main( int argc, char ** argv ) {
  getArgs( argc, argv );
  processData();
  printResults();
}
