#include <iostream>
#include <stdlib.h> 
#include <time.h> 

using namespace std; // use standard functions without qualifier


int main() {
	
	srand(time(NULL));  
	int num = rand() % 20 +1;
	int guess;
	cout << "Enter your guess between (0 and 20) and enter -1 to exit: " ;
	cin >> guess;
	
	cout << "num:"<< num << endl;
	while (num != guess){

		if (guess == -1){
			cout << "Exiting game..."<< endl;
			break;
		}

		cout << "Incorrect guess. Please enter your guess again (enter -1 to exit): " ;
		cin >> guess;

		if(guess == num){
			cout << "Correct guess. Ending the game..." << endl;
			break;
		}
	}

  return 0;
}
