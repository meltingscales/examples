all: clean compile test

clean:
	rm -f *.o

compile:
	gcc fibonacciSharedMem.c -o fibonacciSharedMem.o

test:
	./fibonacciSharedMem.o 15

testPotato:
	./fibonacciSharedMem.o potato