; Declare "_start" as a global symbol
global _start

section .text
_start:
    ; Set ebx to 42 - This will be used as the exit code
    mov ebx, 42     ; exit code (42)

    ; Set eax to 1 - This corresponds to the "exit" syscall
    mov eax, 1      ; exit syscall

    ; Jump over the following instruction to the "skip" label
    jmp skip        ; skip

    ; This section is skipped by the jump
    ; Set ebx to 13 - This will be used as an alternate exit code (not reached in this code)
    mov ebx, 13     ; exit code (13)

skip:
    ; Perform the syscall, exiting the program with the exit code in ebx
    int 0x80        ; syscall
