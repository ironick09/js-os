BUILD_DIR=../build/bootloader

BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))

all: $(BOOTLOADER_OBJS)

$(BUILD_DIR)/%.o: %.asm
	nasm -f elf $< -F dwarf -g -o $@
	ld -lSystem -macosx_version_min 10.14  $@ -o $@.elf
	objcopy -O binary $(BUILD_DIR)/bootloader.o.elf $@

clean:
	rm $(BUILD_DIR)/*