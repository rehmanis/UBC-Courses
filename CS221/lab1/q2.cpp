// File I-O ----------------------------------------

#include <fstream>
#include <iostream>
#include <string>

using namespace std;

int main() {
  ifstream in("infile.txt");       // input file-stream
  ofstream out("outfile.txt");     // output file-stream 
  string ss;
  // getline() puts next line in ss and discards any newline characters
  while (getline(in, ss))   
    out << ss << endl; // add each line to the new file, appending endl 
  cout << "End of program" << endl;
  return 0;
}
