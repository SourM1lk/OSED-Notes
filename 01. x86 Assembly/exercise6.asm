; Declare "_start" as a global symbol
global _start

_start:
    ; Allocate space on the stack by subtracting 4 from the stack pointer (esp)
    sub esp, 4

    ; Place the character 'H' at the top of the stack
    mov [esp], byte 'H'

    ; Place the character 'e' at the next location in the stack
    mov [esp+1], byte 'e'

    ; Place the character 'y' at the following location in the stack
    mov [esp+2], byte 'y'

    ; Place the character '!' at the last location in the allocated space on the stack
    mov [esp+3], byte '!'

    ; Prepare for a system call to write to stdout:
    ; Set eax to 4, which is the system call number for sys_write
    mov eax, 4

    ; Set ebx to 1, representing stdout (file descriptor for standard output)
    mov ebx, 1

    ; Set ecx to the address of the allocated space on the stack, which holds the string
    mov ecx, esp

    ; Set edx to 4, indicating the length of the string to write
    mov edx, 4

    ; Call the kernel with interrupt 0x80 to perform the sys_write system call
    int 0x80
