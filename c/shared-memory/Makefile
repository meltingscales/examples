all: clean compile test

clean:
	rm -f *.o

compile:
	gcc fibonacciSharedMem.c -o fibonacciSharedMem.o

test:
	./fibonacciSharedMem.o 15

testCases: clean compile testPotato testOverflow testUnderflow testZero

testPotato:
	-./fibonacciSharedMem.o potato

testOverflow:
	-./fibonacciSharedMem.o 9999999

testUnderflow:
	-./fibonacciSharedMem.o -9999999

testZero:
	-./fibonacciSharedMem.o 0