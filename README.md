# testmpi
Think "hello, world", but for MPI. Using this for buildroot + OpenMPI package
testing.

Written expecting MPI version 3.0.0 but may work for others. Requires `mpicc`
to be in your path, change it in the makefile if you need to.

# Installation
Example usage:
```bash
make
sudo make install # optional
mpirun -np 7 testmpi
```
