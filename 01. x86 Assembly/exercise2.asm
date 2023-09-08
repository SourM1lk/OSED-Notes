global _start ; Declare "_start" as a global symbol

section .data
    msg db "Hello, world!", 0xa ; Define a null-terminated string "Hello, world!" followed by a newline character
    len equ $ - msg             ; Calculate the length of the string

section .text
_start:
    ; Write the "Hello, world!" message to stdout
    mov eax, 4      ; sys_write system call number
    mov ebx, 1      ; File descriptor for stdout (1)
    mov ecx, msg    ; Pointer to the message to be printed
    mov edx, len    ; Number of bytes to write (length of the message)
    int 0x80        ; Perform the system call

    ; Exit the program
    mov eax, 1      ; sys_exit system call number
    mov ebx, 0      ; Exit status (0 indicates success)
    int 0x80        ; Perform the system call
