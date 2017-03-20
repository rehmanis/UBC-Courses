// Towers of Hanoi -------------------------

#include <cstdlib> // for atoi
#include <iostream>

using namespace std;

// forward function declaration
void moveDisks(int n, const char* FROM, const char* VIA, const char* TO);

int main(int argc, char* argv[]) {
  if (argc != 2) {
    cout << "Usage: " << argv[0] << " number_of_disks" << endl;
    return -1;
  }
  int n = atoi(argv[1]);
  moveDisks(n, "peg A", "peg B", "peg C");
  return 0;
}

void moveDisks(int n, const char* FROM, const char* VIA, const char* TO){

	if (n==1) 
		cout << "MOVE disk from " << FROM << " to " << TO << endl;
	
	else if (n == 0)
		cout << "No disks needed to move";
			
	else {
		moveDisks(n-1, FROM, TO, VIA);
		moveDisks(1, FROM, VIA, TO);
		moveDisks(n-1, VIA,FROM ,TO);
		
	}
}

