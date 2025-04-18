section .data
    prompt      db "Enter a digit (0-9), or 'q' to quit: ", 0
    msg_below   db "Input is below 5", 10, 0
    msg_equal   db "Input is equal to 5", 10, 0
    msg_above   db "Input is above 5", 10, 0
    msg_exit    db "Exiting...", 10, 0

section .bss
    input       resb 2        

section .text
    global _start

_start:

main_loop:
    mov rax, 4          
    mov rdi, 1         
    lea rsi, [prompt]
    mov rdx, 42        
    syscall

    mov rax, 3        
    mov rdi, 0          
    lea rsi, [input]
    mov rdx, 2          
    syscall

    movzx rax, byte [input]
    cmp al, 'q'
    je exit_program
    cmp al, 'Q'
    je exit_program

    ; compare with '5'
    cmp al, '5'
    jl below
    je equal
    jg above

below:
    mov rax, 4
    mov rdi, 1
    lea rsi, [msg_below]
    mov rdx, 18
    syscall
    jmp main_loop

equal:
    mov rax, 4
    mov rdi, 1
    lea rsi, [msg_equal]
    mov rdx, 21
    syscall
    jmp main_loop

above:
    mov rax, 4
    mov rdi, 1
    lea rsi, [msg_above]
    mov rdx, 19
    syscall
    jmp main_loop

exit_program:
    mov rax, 4
    mov rdi, 1
    lea rsi, [msg_exit]
    mov rdx, 12
    syscall

    mov rax, 1
    xor rdi, rdi
    syscall
