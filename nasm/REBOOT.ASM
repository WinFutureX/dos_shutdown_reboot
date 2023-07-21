	org     0x100
	section .text
main:
	cli
	mov     ah, 0xD			; reset disk
	int     0x21
	mov     al, 0x8F		; cmos shutdown status
	out     0x70, al		; cmos address select
	xor     ax, ax			; soft or unexpected reset
	out     0x71, al		; cmos data r/w
	mov     ds, ax
	mov     bx, 0x472
	mov     word [bx], 0x1234	; soft reboot flag
	jmp     0xFFFF:0000		; reset vector 0xffff0
