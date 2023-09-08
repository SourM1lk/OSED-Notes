; Declare "_start" as a global symbol
global _start

_start:
    ; Call the "func" subroutine (function)
    call func

    ; Prepare for a system call to exit the program:
    ; Set eax to 1, which is the system call number for sys_exit
    mov eax, 1

    ; Call the kernel with interrupt 0x80 to perform the sys_exit system call
    int 0x80

; Define the "func" subroutine
func:
    ; Set ebx to 42 - This will be used as the exit code when the subroutine returns
    mov ebx, 42

    ; Return from the subroutine - this transfers control back to where "call func" was executed
    ret
