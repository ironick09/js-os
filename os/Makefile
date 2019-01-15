BUILD_DIR=../build/os
OS=$(BUILD_DIR)/os

CFLAGS+=-ffreestanding -nostdlib -gdwarf-4 -m32 -ggdb3

OS_SRCS := $(wildcard *.c)
OS_OBJS := $(patsubst %.c, $(BUILD_DIR)/%.o, $(OS_SRCS))

all: $(OS)

$(BUILD_DIR)/%.o: %.c
	gcc $(CFLAGS) -m32  -c $< -o $@

$(OS): $(OS_OBJS)
	ld -lSystem -macosx_version_min 10.14.2 $(OS_OBJS) -o $@

clean:
	rm $(OS_OBJS)