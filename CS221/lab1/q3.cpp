#include <iostream>
using namespace std; // use standard functions without qualifier
void fillArray(int first_value, int increment );
int arr[10];
int main(){

fillArray(4,2);
for (int i=0; i<10; i++) {
	cout <<  arr[i] << endl ;
	}

return 0;
}

void fillArray(int first_value, int increment){
	
for (int i=0; i< 10; i++){
	arr[i]=first_value+i*increment;
	}
}
