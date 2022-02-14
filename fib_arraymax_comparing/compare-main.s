# Write the assembly code for main
.global main

.text

main: 
  enter $0, $0

  mov %rdi, %r12
  mov %rsi, %r13

  
  cmp $3, %r12
  jne end_fail
  
  mov 8(%rsi), %r14
  mov 16(%rsi), %r15
  
  mov %r14, %rdi
  call atol
  mov %rax, %r14
  mov %r15, %rdi
  call atol
  mov %rax, %r15

  mov %r14, %rdi
  mov %r15, %rsi
  call compare
  mov %rax, %r14

  mov $0, %r15
  cmp %r15, %r14
  je equal
 
  mov $1, %r15
  cmp %r15, %r14
  je greater

  mov $-1, %r15
  cmp %r15, %r14
  je less
  
  equal:
    mov $eql, %rdi
    mov $0, %al
    call printf
    jmp end

  greater:
    mov $larger, %rdi
    mov $0, %al
    call printf
    jmp end
  
  less:
    mov $small, %rdi
    mov $0, %al
    call printf
    jmp end

  end_fail:
    mov $fail, %rdi
    mov $0, %al
    call printf
    mov $1, %rax
    jmp end

  mov $0, %rax

  end:
 
  leave
  ret

.data
fail: 
  .asciz "Two arguments required.\n"
eql:
  .asciz "equal\n"
larger:
  .asciz "greater\n"
small:
  .asciz "less\n"
format:
  .asciz "%ld\n"
