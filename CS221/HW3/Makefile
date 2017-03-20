OBJS = stockitem.o stocksystem.o a3simpledriver.o
CC = g++
DEBUG = -g
CFLAGS = -Wall -c $(DEBUG)
LFLAGS = -Wall $(DEBUG)

a3test : $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -o a3test

stockitem.o : stockitem.h stockitem.cpp
	$(CC) $(CFLAGS) stockitem.cpp -o stockitem.o

stocksystem.o : stocksystem.h stocksystem.cpp stockitem.o rbtree.h rbtreeprivate.h rbtree.cpp
	$(CC) $(CFLAGS) stocksystem.cpp -o stocksystem.o

a3simpledriver.o : rbtree.h rbtreeprivate.h rbtree.cpp a3simpledriver.cpp
	$(CC) $(CFLAGS) a3simpledriver.cpp -o a3simpledriver.o

clean :
	rm -f *.o *~ a3test
