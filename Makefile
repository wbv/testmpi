## Makefile - basic, default build file for testmpi.c
## Copyright (C) 2020  Walter B. Vaughan (@wbv)
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

.PHONY: all install uninstall clean

all: testmpi


# if you're compiling the program in a weird environment, you'll probably want
# to manually specify the C compiler (MPICC), compile flags (MPICFLAGS), and
# linker flags (MPILFLAGS) manually when invoking the makefile. Otherwise,
# defaults get set below:
ifndef MPICC
MPICC=$(shell which cc)
endif

ifndef MPICFLAGS
MPICFLAGS=$(shell mpicc -showme:compile)
endif

ifndef MPILFLAGS
MPILFLAGS=$(shell mpicc -showme:link)
endif


testmpi: testmpi.c
	$(MPICC) $(MPICFLAGS) $< $(MPILFLAGS) -o $@

install: testmpi
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $< $(DESTDIR)$(PREFIX)/bin/testmpi

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/testmpi

clean:
	rm -f testmpi
