#ifndef _INSERTION_H_
#define _INSERTION_H_

int  x[10];	// input array
int  y[10];	// workspace array
int  x_size = 0;	// length of input array
int  y_size = 0;	// current number of elements in y[]

void getArgs( int argc, char** argv );
void scootOver( int jj );
void insert( int xx );
void processData();
void printResults();

#endif
