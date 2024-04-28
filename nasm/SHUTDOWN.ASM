	org     0x100
	section .text
main:
	mov     ax, 0x5300	; apm check
	xor     bx, bx		; bios
	int     0x15
	jc      unsupported
	cli
	mov     ah, 0xD		; reset disk
	int     0x21
	mov     ax, 0x5301	; apm real mode interface connect
	xor     bx, bx		; bios
	int     0x15
	mov     ax, 0x530E	; apm driver version (v1.1 and 1.2)
	xor     bx, bx		; bios
	mov     cx, 0x102	; ver 1.2
	int     0x15
	mov     ax, 0x5307	; apm set power state
	mov     bx, 1		; all devices
	mov     cx, 3		; off
	int     0x15
	jmp     $		; shouldn't get here(?)
unsupported:
	mov     dx, msg
	mov     ah, 9
	int     0x21
	mov     ax, 0x4C00
	int     0x21
msg:
	db      "Unable to shut down.", 0xD, 0xA, "$", 0
