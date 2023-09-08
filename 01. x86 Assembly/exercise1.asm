; Declare "_start" as a global symbol and set it as the program's entry point
global _start
; Entry point of the program
_start:
    ; Prepare for a system call:
    ; Set eax to 1, indicating the system call number for "exit"
    mov eax, 1

    ; Set ebx to 42, which will be the exit status code
    mov ebx, 42

    ; Subtract 29 from ebx, which will result in 13 as the exit status code
    sub ebx, 29

    ; Invoke the system call using interrupt 0x80
    int 0x80