section .data
 prompt db "Enter password: "
 prompt_len equ $ - prompt

 weak_msg db "Weak password", 10
 weak_len equ $ - weak_msg

 strong_msg db "Strong password", 10
 strong_msg_len equ $ - strong_msg

section .bss
      buffer resb 32 ; buffer for password max 32 characters

section .text
  global _start

_start:
    mov rax, 1 ;write
    mov rdi, 1;stdout
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    ;code to read input
    mov rax, 0;read
    mov rdi, 0;stdin
    mov rsi, buffer
    mov rdx, 32
    syscall

 mov r10, rax
 dec r10

 cmp r10, 8
 jl weak_password


strong_password:
mov rax, 1
mov rdi, 1
mov rsi, strong_msg
mov rdx, strong_msg_len
syscall
jmp exit_code

weak_password:
mov rax, 1
mov rdi, 1
mov rsi, weak_msg
mov rdx, weak_len
syscall


 ;exit code
 exit_code:
 mov rax, 60
 xor rdi, 0
 syscall
