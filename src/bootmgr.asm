; Bootmgr.asm – ładowany przez Boot.asm
[ORG 0x8000]

mov ah, 0x0E
mov al, 'S'
int 0x10
mov al, 't'
int 0x10
mov al, 'a'
int 0x10
mov al, 'g'
int 0x10
mov al, 'e'
int 0x10
mov al, ' '
int 0x10
mov al, '2'
int 0x10
mov al, '!'
int 0x10

hang:
    jmp hang
