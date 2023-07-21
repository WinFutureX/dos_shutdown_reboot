# DOS shutdown and reboot source
## License
Public domain. Do what you want.
## Assembling
To assemble using MASM (requires `ml.exe` from the Microsoft Macro Assembler collection):
```
ml reboot.asm /Fe reboot.com
ml shutdown.asm /Fe shutdown.com
```
Likewise, for NASM (requires NASM to be installed):
```
nasm reboot.asm -f bin reboot.com
nasm shutdown.asm -f bin shutdown.com
```
## Running
These programs don't take any arguments. Simply run them on their own.

