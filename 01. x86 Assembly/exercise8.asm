; Declare "_start" as a global symbol
global _start

_start:
    ; Call the "func" subroutine (function)
    call func

    ; Prepare for a system call to exit the program:
    ; Set eax to 1, which is the system call number for sys_exit
    mov eax, 1

    ; Set ebx to 0 - This is the exit code (0 typically indicates success)
    mov ebx, 0

    ; Call the kernel with interrupt 0x80 to perform the sys_exit system call
    int 0x80

; Define the "func" subroutine
func:
    ; Push the value in ebp onto the stack

    ; Storing the current value of the ebp register onto the stack serves several important purposes:

    ; 1. Stack Frame Preservation:
    ;    By pushing ebp onto the stack, you save the current value of the ebp register, which
    ;    represents the base pointer of the current stack frame. This is essential for preserving
    ;    the caller's context, including its stack frame, when your function is called. Without
    ;    this preservation, your function could inadvertently modify the caller's stack frame
    ;    and disrupt the execution flow.

    ; 2. Nesting Support:
    ;    In cases where your function calls other functions (creating nested function calls),
    ;    each function may use its own stack frame, typically with its own local variables
    ;    and parameters. By pushing and restoring ebp, you ensure that each function maintains
    ;    its own isolated stack frame without affecting the others. This is critical for the
    ;    proper execution of both your function and any functions it calls.

    ; 3. Easy Restoration:
    ;    By pushing ebp and later popping it, you can conveniently and efficiently restore the
    ;    ebp register to its original value when your function is done executing. This is part
    ;    of the function's "cleanup" process, ensuring that the stack pointer (esp) and the base
    ;    pointer (ebp) are correctly restored before returning control to the caller.
    push ebp

    ; Save the current stack frame by copying the stack pointer (esp) to ebp
    mov ebp, esp

    ; Allocate 2 bytes of space on the stack by subtracting from esp
    sub esp, 2

    ; Place the character 'H' at the top of the stack
    mov [esp], byte 'H'

    ; Place the character 'i' at the next location in the stack
    mov [esp+1], byte 'i'

    ; Prepare for a system call to write to stdout:
    ; Set eax to 4, which is the system call number for sys_write
    mov eax, 4

    ; Set ebx to 1, representing stdout (file descriptor for standard output)
    mov ebx, 1

    ; Set ecx to the address of the allocated space on the stack, which holds the string
    mov ecx, esp

    ; Set edx to 2, indicating the length of the string to write
    mov edx, 2

    ; Call the kernel with interrupt 0x80 to perform the sys_write system call
    int 0x80

    ; Restore the previous stack pointer (esp) to its original value using ebp
    mov esp, ebp

    ; Pop the value from the stack into ebp, restoring its previous value
    pop ebp

    ; Return from the subroutine - this transfers control back to where "call func" was executed
    ret
