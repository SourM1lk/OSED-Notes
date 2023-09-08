## Notes
### Example nasm compile command
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