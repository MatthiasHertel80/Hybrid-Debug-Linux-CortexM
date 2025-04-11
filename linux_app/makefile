# Compiler and flags
CC = g++  # Default for local testing
CXXFLAGS = -g -std=c++17 -Wall -Wextra -pthread
LDFLAGS = -pthread
LDFLAGS += -static-libstdc++
TARGET = out/debug_test
SRCS = src/main.cpp
OBJS = $(SRCS:.cpp=.o)

# Cross-compilation setup (uncomment for aarch64)
CC = aarch64-linux-gnu-g++
#CXXFLAGS += --sysroot=/path/to/sysroot  # If needed

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) *.o

# Helper targets
run: $(TARGET)
	./$(TARGET)

debug: $(TARGET)
	gdb -q ./$(TARGET)
