#include <stdio.h>
#include <mpi.h>
#include <windows.h>


int main(int argc, char *argv[])
{
	int rank, size;
	int master = 0;


	MPI_Init(NULL, NULL);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);

	printf("%2d / %2d, ", rank, size);

	if (rank == master) // it's the master
	{
		printf("[M]\n");


		char* basket[MPI_MAX_PROCESSOR_NAME]; //prepare to recieve a string

		for (int i = 1; i < size; i++) //go from 1-max, as we are zero.
		//for (int i = size; i >= 1; i--) //backwards 
		{

			MPI_Status status; //recieve status as we are accepting from any source and don't know in advance

			//MPI_Recv(&basket, MPI_MAX_PROCESSOR_NAME, MPI_CHAR, MPI_ANY_SOURCE, 0, MPI_COMM_WORLD, &status); //out of order.
			MPI_Recv(&basket, MPI_MAX_PROCESSOR_NAME, MPI_CHAR, i, 0, MPI_COMM_WORLD, &status); //ordered from start to finish.

			printf("  Got: '%s' from process '%d'.\n", basket, status.MPI_SOURCE);
		}
	}
	else
	{
		printf("[s] - ");

		char* processor_name[MPI_MAX_PROCESSOR_NAME];
		int name_len;
		MPI_Get_processor_name(processor_name, &name_len);

		printf("Sending '%s'!", processor_name);

		MPI_Send(processor_name, name_len + 1, MPI_CHAR, master, 0, MPI_COMM_WORLD); // plus one to send null terminator
	}


	///printf("[P_%d] process %d said: \"%s\"]\n", rank, recvfrom, inbuf);

	MPI_Finalize();
	return 0;
}
