# Write the assembly code for main and fib.
.global main

.text

main:
  push %r12
  push %r13
  push %r14
  enter $16, $0


  mov %rdi, %r12
  mov %rsi, %r13
  mov $2, %r14

  mov $2, %rcx
  cmp %rcx, %r12
  jne false
  
  mov $1, %r14
  mov (%r13, %r14, 8), %r15
  mov %r15, %rdi
  call atol
  mov %rax, %r15

  cmp $0, %r15
  jl false
  
  cmp $0, %r15
  je zero
  cmp $1, %r15
  je one
  cmp $2, %r15
  je one    
  
  movq $1, -8(%rbp)
  movq $1, -16(%rbp)

  mov $2, %r14
  loop:
    cmp %r15, %r14
    jge loop_end
    mov $0, %rcx
    addq -8(%rbp), %rcx
    addq -16(%rbp), %rcx
    mov -16(%rbp), %rdx
    movq %rcx, -16(%rbp)
    movq %rdx, -8(%rbp)
    inc %r14
    jmp loop

  zero:
    mov $format, %rdi
    mov $0, %rsi
    mov $0, %al
    call printf
    jmp end

  one:
    mov $format, %rdi
    mov $1, %rsi
    mov $0, %al
    call printf
    jmp end

  false:
    mov $fail, %rdi
    mov $0, %al
    call printf
    mov $1, %rax
    jmp end  

  loop_end:
    mov $format, %rdi
    mov -16(%rbp), %rsi
    mov $0, %al
    call printf
  mov $0, %rax

  end:

  leave
  pop %r14
  pop %r13
  pop %r12
 
  ret

.data
fail: 
  .asciz "A natural number argument is required.\n"
format:
  .asciz "%ld\n"
