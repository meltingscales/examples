#include <stdio.h>
#include <string.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <stdlib.h>

int main() {
    key_t shm_key = 6166529;
    const int shm_size = 1024;

    int shm_id;
    char *shmaddr, *ptr;
    int next[2];

    printf("writer started.\n");

    /* Allocate a shared memory segment. */
    shm_id = shmget(shm_key, shm_size, IPC_CREAT | S_IRUSR | S_IWUSR);

    /* Attach the shared memory segment. */
    shmaddr = (char *) shmat(shm_id, 0, 0);

    printf("shared memory attached at address %p\n", shmaddr);

    /* Start to write data. */
    ptr = shmaddr + sizeof(next);
    next[0] = sprintf(ptr, "mandy") + 1;
    ptr += next[0];
    next[1] = sprintf(ptr, "73453916") + 1;
    ptr += next[1];
    sprintf(ptr, "amarica");
    memcpy(shmaddr, &next, sizeof(next));
    printf("writer ended.\n");

    /*calling the other process*/
    system("./read");

    /* Detach the shared memory segment. */
    shmdt(shmaddr);
    /* Deallocate the shared memory segment.*/
    shmctl(shm_id, IPC_RMID, 0);

    return 0;
}
