//  testmpi.c - A simple MPI example for an arbitrary number of MPI nodes
//    Copyright (C) 2020  Walter B. Vaughan (@wbv)
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <https://www.gnu.org/licenses/>.

#include <stdio.h>
#include <mpi.h>

int main(int argc, char** argv)
{
	// index and total size of the MPI cluster used
	int rank, size;

	// each node receives and sends from different neighbors,
	// these specify which neighbors
	int src, dst;

	// piece of data sent around nodes
	int data;

	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);

	src = (rank - 1) % size;
	dst = (rank + 1) % size;

	// arbitrary nonzero data = part of stack address
	data = ((int)&data >> 7) & 0xffff; 

	// send a value sequentially around each node, modifying it before
	// returning it back to node 0
	if (rank == 0)
	{
		// root node sends data first
		printf("%6d/%d: Sending %d...\n", rank+1, size, data);
		MPI_Send(&data, 1, MPI_INT, dst, 0, MPI_COMM_WORLD);

		// wait for return value from last node
		MPI_Recv(&data, 1, MPI_INT, src, 0, MPI_COMM_WORLD, NULL);

		printf("%6d/%d: Final Value: %d\n", rank+1, size, data);
	}
	else
	{
		MPI_Recv(&data, 1, MPI_INT, src, 0, MPI_COMM_WORLD, NULL);
		
		// add the rank to the data before passing it along
		printf("%6d/%d: %5d + %d => %5d\n",
		       rank+1, size, data, rank, data+rank);
		data = data + rank;

		MPI_Send(&data, 1, MPI_INT, dst, 0, MPI_COMM_WORLD);
	}


	MPI_Finalize();
	return 0;
}
