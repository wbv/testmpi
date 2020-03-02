AC_INIT(testmpi, 0.1, https://github.com/wbv/testmpi)

m4_include([m4/m4_ax_mpi.m4])

AM_INIT_AUTOMAKE([foreign])

AC_PROG_CC
AC_LANG([C])

AX_MPI
CC=$MPICC

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([
 Makefile
 src/Makefile
])
AC_OUTPUT
