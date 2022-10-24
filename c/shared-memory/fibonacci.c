#include "stdlib.h"
#include "stdio.h"


int fibonacciRecursive(int nthNum) {

    if (nthNum < 0) {
        return -1; //should not be <0
    }
    if (nthNum == 0) {
        return 0;
    } else if (nthNum == 1) {
        return 1;
    }
    return fibonacciRecursive(nthNum - 1) + fibonacciRecursive(nthNum - 2);
}

int *generate_da_fibonacci(int howBig) {
    int *theNumbers = malloc(sizeof(int) * howBig);

    for (int i = 0; i < howBig; ++i) {
        theNumbers[i] = fibonacciRecursive(i);
    }

    return theNumbers;
}

int main(int argc, char **argv) {
    printf("hewwo, it is fibonacci time :3c\n");

    const int tenFib_SIZE = 10; //god i love c T_T
    int *tenFib = generate_da_fibonacci(tenFib_SIZE);

    for (int i = 0; i < tenFib_SIZE; i++) {
        printf("%dth fib num = %d\n", i, tenFib[i]);
    }

}