# testmpi
Hello World, but for MPI. Using this for buildroot + OpenMPI package testing

Written expecting MPI version 3.0.0 but may work for others. Requires `mpicc`
to be in your path, change it in the makefile if you need to.

Example usage:
```bash
make
mpirun -np 7 testmpi
```
