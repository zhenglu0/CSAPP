# the compiler: g++ for C++ program, define as g++ for C++
CXX = g++
CC = gcc
RM = rm -f
CFLAGS = $(CXXFLAGS)
# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CXXFLAGS  = -g -Wall -Werror
#LDFLAGS = -lm
SPECIAL_FLAGS = -std=c++0x -D_GNU_SOURCE

# the build target executable:
TARGET =shellex \
		waitpid1\
		waitpid2\
		signal1\
		signal2\
		signal3\
		signal4\
		procmask1\
		procmask2\
		procmask3\
		procmask4\
		setjmp\
		restart\

all: $(TARGET)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@ 

.cpp.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@ 

shellex: shellex.o csapp.o
	$(CC) $(CFLAGS) -o $@ shellex.o csapp.o -pthread

waitpid1: waitpid1.o csapp.o
	$(CC) $(CFLAGS) -o $@ waitpid1.o csapp.o -pthread

waitpid2: waitpid2.o csapp.o
	$(CC) $(CFLAGS) -o $@ waitpid2.o csapp.o -pthread

signal1: signal1.o csapp.o
	$(CC) $(CFLAGS) -o $@ signal1.o csapp.o -pthread

signal2: signal2.o csapp.o
	$(CC) $(CFLAGS) -o $@ signal2.o csapp.o -pthread

signal3: signal3.o csapp.o
	$(CC) $(CFLAGS) -o $@ signal3.o csapp.o -pthread

signal4: signal4.o csapp.o
	$(CC) $(CFLAGS) -o $@ signal4.o csapp.o -pthread

procmask1: procmask1.o csapp.o
	$(CC) $(CFLAGS) -o $@ procmask1.o csapp.o -pthread

procmask2: procmask2.o csapp.o
	$(CC) $(CFLAGS) -o $@ procmask2.o csapp.o -pthread

procmask3: procmask3.o csapp.o rfork.o
	$(CC) $(CFLAGS) -o $@ procmask3.o csapp.o rfork.o -pthread

procmask4: procmask4.o csapp.o rfork.o
	$(CC) $(CFLAGS) -o $@ procmask4.o csapp.o rfork.o -pthread

setjmp: setjmp.o csapp.o
	$(CC) $(CFLAGS) -o $@ setjmp.o csapp.o -pthread

restart: restart.o csapp.o
	$(CC) $(CFLAGS) -o $@ restart.o csapp.o -pthread

clean:
	$(RM) $(TARGET) *.o
