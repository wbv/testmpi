# testmpi
Think "hello, world", but for MPI. Using this for buildroot + OpenMPI package
testing.

Written expecting MPI version 3.0.0 but may work for others.

# Installation
Example usage:
```bash
make
sudo make install # optional
mpirun -np 7 testmpi
```

# Custom Compilation
To facilitate cross-compiling, you can manually specify the (cross-) compiler,
compile flags, and link flags when invoking the Makefile. For example (in some
hypothetical cross-compilation):

```bash
MPICC=arm-linux-gnueabihf-gcc \
MPICFLAGS="-pthread" \
MPILFLAGS="-Wl,-rpath -Wl,/usr/lib -Wl,--enable-new-dtags -lmpi" \
make
```
