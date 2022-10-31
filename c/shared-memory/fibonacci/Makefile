all: clean build test

clean:
	rm -f *.o

build:
	gcc -g fibonacciSharedMem.c -o fibonacciSharedMem.o

test: build
	./fibonacciSharedMem.o 15

testCases: clean build testPotato testOverflow testUnderflow testZero

testPotato:
	-./fibonacciSharedMem.o potato

testOverflow:
	-./fibonacciSharedMem.o 9999999

testUnderflow:
	-./fibonacciSharedMem.o -9999999

testZero:
	-./fibonacciSharedMem.o 0