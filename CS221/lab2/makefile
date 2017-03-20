all : insertion

insertion : insertion.cpp insertion.h
	g++ -Wall -g insertion.cpp -o insertion

pointers : pointers.cpp
	g++ -Wall -g pointers.cpp -o pointers

clean : 
	rm -f insertion 
	rm -f pointers
	rm -fr insertion.dSYM/* 
	rm -fr pointers.dSYM/* 
	#rmdir insertion.dSYM
	#rmdir pointers.dSYM
	

