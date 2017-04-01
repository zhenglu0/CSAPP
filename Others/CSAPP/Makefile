# the compiler: g++ for C++ program, define as g++ for C++
CXX = g++
CC = gcc
RM = rm -f
CFLAGS = $(CXXFLAGS)
# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CXXFLAGS  = -Wall -Werror
#LDFLAGS = -lm
SPECIAL_FLAGS = -std=c++0x -D_GNU_SOURCE

# the build target executable:
TARGET =shellex

all: $(TARGET)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@ 

.cpp.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@ 

shellex: shellex.o csapp.o
	$(CC) $(CFLAGS) -o $@ shellex.o csapp.o -pthread

clean:
	$(RM) $(TARGET) *.o
