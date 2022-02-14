
.global main

.text

main:
  # we are using callee-save registers to preserve information when calling printf
  push %r12
  push %r13
  push %r14
  enter $8, $0

  mov %rdi, %r12   # number of arguments
  mov %rsi, %r13   # argument addresses
  mov $1, %r14     # counter
  mov $1, %r15     # counter 2

loop_load:
  cmp %r12, %r14
  jge loop_print

  push (%r13, %r14, 8)

  inc %r14
  jmp loop_load

loop_print:
  cmp %r12, %r15
  jge loop_end
  
  pop %rax

  # print each argument
  mov %rax, %rdi
  mov $0, %al
  call printf

  mov $space, %rdi
  mov $0, %al
  call printf

  inc %r15
  jmp loop_print

  
loop_end:

  leave
  pop %r14
  pop %r13
  pop %r12
  ret

.data

format: 
  .asciz "%d: \"%s\"\n"
space: 
  .asciz " "
