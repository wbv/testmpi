CC := mpicc
CFLAGS := 

.PHONY: all clean

all: testmpi

testmpi: testmpi.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f testmpi
