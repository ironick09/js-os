;***********************************
; bootloader.asm
; A Simple Bootloader
;***********************************
;org 0x7c00
bits 16
start: jmp boot

;; constant and variable definitions
msg db "Welcome to Josh OS!", 0ah, 0dh, 0h

boot:
    cli         ; no interrupts
    cld         ; to init

    mov ax, 0x50

    ;; set the buffer
    mov es, ax
    xor bx, bx

    mov al, 2   ; read 2 sector
    mov ch, 0   ; track 0
    mov cl, 2   ; sector to read (second sector)
    mov dh, 0   ; head num
    mov dl, 0   ; drive num

    mov ah, 0x02    ; read sectors from disk
    int 0x13        ; call the bios routine
    jmp 0x50:0x0    ; jump and execute sector

    hlt             ; halt system

times 510 - ($-$$) db 0
dw 0xaa55           ; boot sig