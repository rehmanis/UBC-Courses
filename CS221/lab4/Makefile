all : test
	
test: lab4testsuite.cpp arrayclass.o
	g++ -Wall lab4testsuite.cpp arrayclass.o -o test
	
arrayclass.o: arrayclass.h arrayclass.cpp
	g++ -Wall -c arrayclass.h arrayclass.cpp
	
clean:
	rm -f arrayclass.o
	rm -f test
	rm -fr test.dSYM/* 
	 
