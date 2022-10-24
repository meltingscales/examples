#include "stdlib.h"
#include "stdio.h"
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>

//YOINK'd from https://stackoverflow.com/questions/5656530/how-to-use-shared-memory-with-linux-in-c
void *create_shared_memory(size_t size) {
    // Our memory buffer will be readable and writable:
    int protection = PROT_READ | PROT_WRITE;

    // The buffer will be shared (meaning other processes can access it), but
    // anonymous (meaning third-party processes cannot obtain an address for it),
    // so only this process and its children will be able to use it:
    int visibility = MAP_SHARED | MAP_ANONYMOUS;

    // The remaining parameters to `mmap()` are not important for this use case,
    // but the manpage for `mmap` explains their purpose.
    return mmap(NULL, size, protection, visibility, -1, 0);
}


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


const int tenFib_MAX_SIZE = 100;

int main(int argc, char **argv) {
    printf("hewwo, it is fibonacci time :3c\n\n");

    if (argc < 2) {
        printf("Error! You should give us a number on the command line. \n"
               "Example: \n"
               "%s 10"
               "\n\n", argv[0]);
        return 1;
    }

    int cliArgNum = 0;
    int fieldsConverted = sscanf(argv[1], "%d", &cliArgNum);
    if (fieldsConverted <= 0) {
        printf("Error! You need to provide a number on the command line, not '%s'!\n", argv[1]);
        return 1;
    }

    if (cliArgNum > tenFib_MAX_SIZE) {
        printf("Error! Number larger than %d !\n", tenFib_MAX_SIZE);
        return 1;
    }

    const int tenFib_SIZE = cliArgNum; //god i love c T_T

    int *tenFib = generate_da_fibonacci(tenFib_SIZE);

    const int SHMEM_SIZE = 128;
//    void *shmem = create_

    for (int i = 0; i < tenFib_SIZE; i++) {
        printf("%dth fib num = %d\n", i, tenFib[i]);
    }

}