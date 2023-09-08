; Declare "_start" as a global symbol
global _start

section .data
    ; Define a string named "addr" with the initial value "yellow"
    addr db "yellow"

section .text
_start:
    ; Modify the first character of the "addr" string to 'H'
    mov [addr], byte 'H'

    ; Modify the sixth character of the "addr" string to '!'
    mov [addr+5], byte '!'

    ; Prepare for a system call to write to stdout:
    ; Set eax to 4, which is the system call number for sys_write
    mov eax, 4

    ; Set ebx to 1, representing stdout (file descriptor for standard output)
    mov ebx, 1

    ; Set ecx to the address of the "addr" string, specifying what to write
    mov ecx, addr

    ; Set edx to 6, indicating the length of the string to write
    mov edx, 6

    ; Call the kernel with interrupt 0x80 to perform the sys_write system call
    int 0x80

    ; Prepare for a system call to exit the program:
    ; Set eax to 1, which is the system call number for sys_exit
    mov eax, 1

    ; Set ebx to 0, representing the exit code (0 typically indicates success)
    mov ebx, 0

    ; Call the kernel with interrupt 0x80 to perform the sys_exit system call
    int 0x80

; Result: Hello!
; This changes yellow to Hello!