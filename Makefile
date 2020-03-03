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

ifndef MPICC
MPICC := mpicc
endif

.PHONY: all install uninstall clean

all: testmpi

testmpi: testmpi.c
	$(MPICC) $(CFLAGS) $< -o $@

install: testmpi
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $< $(DESTDIR)$(PREFIX)/bin/testmpi

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/testmpi

clean:
	rm -f testmpi
