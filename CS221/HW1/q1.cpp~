#include <iostream>

double arrayMax1 (double arr[], int sz, int start);
double arrayMax2 (double arr[], int sz, int start);


int main () {
	
	//double maxV1 = 0.0;
	double maxV2 = 0.0;
	double array[] = {1.0,3.2,2.1,10.6,9.7, 8.6,11.1, 13};
	//maxV1 = arrayMax1 (array, 6, 0);
	maxV2 = arrayMax2 (array, 8, 5);
	//std::cout << maxV1 << std::endl;
	std::cout << maxV2 << std::endl; 
	return 0;
}

double arrayMax1 (double arr[], int sz, int start) {

	double maxVal ;
	if (start == sz-1) {
		return arr[start]; 
	}
	
	maxVal = arrayMax1(arr, sz, start+1);
	std::cout <<"outside if "<< maxVal << std::endl;
	if(arr[start] > maxVal)
		return arr[start];
		
	else	
		return maxVal;

}

double arrayMax2 (double arr[], int sz, int start) {

	double maxVal ;
	if (sz == 1 ) {
		//std::cout <<"inside if "<< maxVal << std::endl; 
		return arr[sz-1];
	
	}
	
	maxVal = arrayMax2(arr, sz-1, start);
	std::cout <<"outside if "<< maxVal << std::endl;
	if(arr[sz-1] > maxVal)
		return arr[sz-1];
		
	else	
		return maxVal;

}
