; Declare "_start" as a global symbol
global _start

section .text
_start:
    ; Set ebx to 1 - This represents the file descriptor for stdout
    mov ebx, 1

    ; Set ecx to 4 - This is the number of iterations for the loop
    mov ecx, 4

; Label for the loop
label:
    ; Double the value in ebx (ebx += ebx)
    add ebx, ebx

    ; Decrement ecx by 1 (ecx -= 1)
    dec ecx

    ; Compare ecx to 0
    cmp ecx, 0

    ; If ecx > 0, jump back to the "label" (loop)
    jg label

    ; If ecx <= 0 (loop finished), set eax to 1 (system call number for sys_exit)
    mov eax, 1

    ; Call the kernel to exit the program
    int 0x80


; Result = 16 because 2^4 = 16
