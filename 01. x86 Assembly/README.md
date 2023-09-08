## Notes

Syntax
```asm
operation [operands, ...]

; Set ebx to 123
mov ebx, 123    ; ebx = 123 

; Copy the value from ebx into eax
mov eax, ebx    ; eax = ebx

; Add the value in ecx to the value in ebx and store the result in ebx
add ebx, ecx    ; ebx += ecx

; Subtract the value in edx from the value in ebx and store the result in ebx
sub ebx, edx    ; ebx -= edx

; Multiply the value in eax by the value in ebx and store the result in eax
mul ebx         ; eax *= ebx

; Divide the value in eax by the value in edx and store the result in eax
div edx         ; eax /= edx
```

Example nasm compile command
```bash
# Compile
nasm -f elf32 exercise1.asm -o ex1.o
# Link
ld -m elf_i386 ex1.o -o ex1
# Run
./ex1
# Check exit code
echo $?
```

Common condtional jumps
```asm
je A, B      ; Jump to A if equal
jne A, B     ; Jump to A if not equal
jg A, B      ; Jump to A if greater than
jge A, B     ; Jump to A if greater than or equal
jl A, B      ; Jump to A if less than
jle A, B     ; Jump to A if less than or equal
```

Data Type Examples
```asm
section .data
; Declare variables with different data types

; db is 1 byte
name1 db "string"   ; Defines a string, each character takes 1 byte
name2 db 0xff       ; Defines a single byte with a hexadecimal value (0xff)
name3 db 100        ; Defines a single byte with a decimal value (100)

; dw is 2 bytes
name4 dw 1000       ; Defines a 2-byte variable with a decimal value (1000)

; dd is 4 bytes
name5 dd 1000000    ; Defines a 4-byte variable with a decimal value (1000000)
```
The Stack (push + pop) example
```asm
section .text
global _start

_start:
    ; The stack is empty at this point
    ; ESP = 28
    ; [00] 0
    ; [04] 0
    ; [08] 0
    ; [12] 0
    ; [16] 0
    ; [20] 0
    ; [24] 0
    ; [28] 0


    ; Push the value 1234 onto the stack
    push 1234

    ; Resulting stack:
    ; ESP = 24
    ; [00] 0
    ; [04] 0
    ; [08] 0
    ; [12] 0
    ; [16] 0
    ; [20] 0
    ; [24] 1234
    ; [28] 0


    ; Push the value 8765 onto the stack
    push 8765

    ; Resulting stack:
    ; ESP = 20
    ; [00] 0
    ; [04] 0
    ; [08] 0
    ; [12] 0
    ; [16] 0
    ; [20] 8765
    ; [24] 1234
    ; [28] 0

    ; Push the value 246 onto the stack
    push 246

    ; Resulting stack:
    ; ESP = 16
    ; [00] 0
    ; [04] 0
    ; [08] 0
    ; [12] 0
    ; [16] 246
    ; [20] 8765
    ; [24] 1234
    ; [28] 0

    ; Push the value 357 onto the stack
    push 357

    ; Resulting stack:
    ; ESP = 12
    ; [00] 0
    ; [04] 0
    ; [08] 0
    ; [12] 357
    ; [16] 246
    ; [20] 8765
    ; [24] 1234
    ; [28] 0

    ; Pop the top value from the stack and store it in the eax register
    pop eax

    ; Resulting stack:
    ; ESP = 16
    ; [00] 0
    ; [04] 0
    ; [08] 0
    ; [12] 357
    ; [16] 246
    ; [20] 8765
    ; [24] 1234
    ; [28] 0

```
## References

### Intro to x86 Assembly Language
https://youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe&si=M91WX6v83C52VaTG