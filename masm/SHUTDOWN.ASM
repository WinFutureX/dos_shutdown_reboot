.model  small
.stack
.data
msg     db      "Unable to shut down.", "$", 0
.code
main    proc
        mov     ax, 05300h	; apm check
        xor     bx, bx		; bios
        int     15h
        jc      @@err
        cli
        mov     ah, 0Dh		; reset disk
        int     21h
        mov     ax, 05301h	; apm real mode interface connect
        xor     bx, bx		; bios
        int     15h
        mov     ax, 0530Eh	; apm driver version (v1.1 and 1.2)
        xor     bx, bx		; bios
	mov	cx, 0102h	; ver 1.2
        int     15h
        mov     ax, 05307h	; apm set power state
        mov     bx, 1		; all devices
        mov     cx, 3		; off
        int     15h
        jmp     $		; shouldn't get here(?)
@@err:  mov     ax, seg msg
        mov     ds, ax
        mov     ah, 9
        lea     dx, msg
        int     21h
        mov     ax, 04C00h
        int     21h
main    endp
        end     main
