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



## References

### Intro to x86 Assembly Language
https://youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe&si=M91WX6v83C52VaTG