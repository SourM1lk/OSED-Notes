; Declare the entry point of the program as 'main'
global main

; Declare the 'printf' function as an external symbol, indicating that it's defined in another module (C standard library)
extern printf

section .data
    ; Define a null-terminated string message
    msg db "Testing %i...", 0x0a, 0x00

main:
    ; Function Prologue:
    ; Save the current stack frame by pushing ebp onto the stack
    push ebp

    ; Set up the new stack frame by moving the current stack pointer (esp) into ebp
    mov ebp, esp

    ; Push the integer 123 onto the stack (arguments are pushed from right to left)
    push 123

    ; Push the address of the 'msg' string onto the stack
    push msg

    ; Call the 'printf' function, which will use the arguments from the stack
    call printf

    ; Clean up the stack and prepare for function exit:
    ; Set eax to 0 (return value)
    mov eax, 0

    ; Restore the stack pointer to its original value using ebp
    mov esp, ebp

    ; Restore the previous stack frame by popping ebp
    pop ebp

    ; Return from the 'main' function
    ret
