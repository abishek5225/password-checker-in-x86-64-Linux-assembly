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



