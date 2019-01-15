# js-os
Josh OS

WORK IN PROG


### gdb shortcuts
Add these to ~/.gdbinit for quick and easy debugging
Connect to remote gdb target: `gdb remote localhost:2600`

```
set disassembly-flavor intel
set startup-with-shell off

define hook-stop
    printf "[%4x:%4x] ", $cs, $eip
    x/i $cs*16+$eip
end

layout asm
layout reg
set architecture i8086
target remote localhost:26000
b *0x7c00
```
