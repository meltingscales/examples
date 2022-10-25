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

    for (size_t i = 0; i < howBig; ++i) {
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

    if (cliArgNum <= 0) {
        printf("Error! Number must be > 0!\n");
        return 1;
    }

    const int someFibonacciNumbers_SIZE = cliArgNum; //god i love c T_T

    //make some fib numbers
    int *someFibonacciNumbers = generate_da_fibonacci(someFibonacciNumbers_SIZE);
    printf("Made %d fibonacci numbers:\n", someFibonacciNumbers_SIZE);
    for (size_t i = 0; i < someFibonacciNumbers_SIZE; ++i) {
        printf("  %2zu fib = %d\n", i, *(someFibonacciNumbers + i));
    }

    //make shared memory
    const size_t SHMEM_SIZE = (sizeof(int) * someFibonacciNumbers_SIZE);
    void *shmem = create_shared_memory(SHMEM_SIZE);
    printf("Created shared memory\n");

    //copy fibonacci numbers to shared memory
    for (size_t i = 0; i < someFibonacciNumbers_SIZE; ++i) {
        memset(shmem + i, someFibonacciNumbers[i], sizeof(int));
    }
    printf("Copied fibonacci numbers to shared memory\n");

    free(someFibonacciNumbers);
    printf("Freed fibonacci numbers\n");

    //above this line, we are parent.
    //after this line, we could be either parent or child.
    int pid = fork();
    printf("Forked! My PID is %d\n", pid);

    if (pid == 0) {
        //we are child
        printf("Hello from child! Sleeping...\n");
        //wait for parent to mess it up
        sleep(3);

        for (size_t i = 0; i < someFibonacciNumbers_SIZE; i++) {
            int onenum = ((int *) (shmem))[i];
            printf("%zuth fib num = %d\n", i, onenum);
        }
        printf("Goodbye from Child!");

    } else {
        //we are parent
        printf("Hello from parent!\n");

        //let's mess up the fib numbers :)
        //put a 420 in the middle

        int myFunnyMemeNumber = 420;

        memcpy(shmem + ((size_t) (SHMEM_SIZE / 2)), myFunnyMemeNumber, sizeof(int));

        printf("lol. lmao. weed.");
        printf("Goodbye from Parent!");
    }

}