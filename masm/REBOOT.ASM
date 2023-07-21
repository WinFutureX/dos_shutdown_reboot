.model  small
.stack
.data
CMOSA   equ     070h
CMOSD   equ     071h
.code
vector  segment use16 at 0FFFFh
reset   label   far
vector  ends
main    proc
        cli
        mov     ah, 0Dh			; reset disk
        int     21h
        mov     al, 08Fh		; cmos shutdown status
        out     CMOSA, al
        xor     ax, ax			; soft or unexpected reset
        out     CMOSD, al
        mov     ds, ax
        mov     bx, 0472h
        mov     word ptr [bx], 01234h	; soft reboot flag
        jmp     reset
main    endp
        end     main
