; Boot.asm – ładowany przez BIOS
ORG 0x7C00                  ; punkt wejścia boot sektora

mov ah, 0x0E                ; BIOS teletype output
mov al, 'B'
int 0x10
mov al, 'o'
int 0x10
mov al, 'o'
int 0x10
mov al, 't'
int 0x10
mov al, '!'
int 0x10

; Wczytaj drugi etap bootloadera – Bootmgr (sektor 2)
mov bx, 0x8000              ; adres w pamięci, gdzie załadujemy drugi etap
mov ah, 0x02                ; funkcja BIOS – czytaj sektory
mov al, 1                   ; liczba sektorów do odczytu
mov ch, 0                   ; cylinder
mov cl, 2                   ; sektor (sektor 2 – bo 1. to boot sektor)
mov dh, 0                   ; głowica
mov dl, 0x80                ; dysk twardy
int 0x13                    ; przerwanie BIOS – odczyt sektora

jmp 0x0000:0x8000           ; skok do załadowanego kodu (bootmgr)

times 510 - ($ - $$) db 0   ; wypełnij do 510 bajtów zerami
dw 0xAA55                   ; sygnatura boot sektora
