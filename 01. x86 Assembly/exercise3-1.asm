; Declare "_start" as a global symbol
global _start

section .text
_start:
    ; Set ecx to 99 - This is a counter or some other value
    mov ecx, 99

    ; Set ebx to 42 - This will be used as the exit code
    mov ebx, 42     ; exit code (42)

    ; Set eax to 1 - This corresponds to the "exit" syscall
    mov eax, 1      ; exit syscall

    ; Compare ecx to 100
    cmp ecx, 100    ; compare ecx to 100

    ; If ecx < 100, jump to the "skip" label, skipping the exit syscall
    jl skip

    ; If ecx >= 100, set ebx to 13 (not reached if ecx < 100)
    mov ebx, 13     ; exit code (13)

skip:
    ; Perform the syscall, exiting the program with the exit code in ebx
    int 0x80        ; syscall
