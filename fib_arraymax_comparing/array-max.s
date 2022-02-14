# Write the assembly code for array_max

.global array_max

.text

array_max:
  push %r12
  push %r13
  push %r14
  enter $8, $0

  mov %rdi, %r12  
  mov %rsi, %r13   
  mov $0, %r14     

  movq $0, -8(%rbp)

loop:
  cmp %r12, %r14
  jge loop_end

  mov (%r13, %r14, 8), %r15
 
  cmp %r15, -8(%rbp)
  jg next_round

  mov %r15, -8(%rbp)
  
  next_round: 

  inc %r14
  jmp loop

loop_end:
  mov -8(%rbp), %rax

  leave
  pop %r14
  pop %r13
  pop %r12

ret

.data
format:
  .asciz "%ld\n"

  

