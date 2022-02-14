
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
  
  movq $0, -8(%rbp)

loop:
  cmp %r12, %r14
  jge loop_end

  mov (%r13, %r14, 8), %rdi
  call atol

  add %rax, -8(%rbp)

  # print each argument
#  mov $format, %rdi
#  mov %r14, %rsi
#  mov (%r13, %r14, 8), %rdx
#  mov $0, %al
#  call printf

  inc %r14
  jmp loop
  
loop_end:

  mov $sum, %rdi
  mov $0, %al
  call printf
  mov $format2, %rdi
  mov -8(%rbp), %rsi
  mov $0, %al
  call printf

  leave
  pop %r14
  pop %r13
  pop %r12
  ret

.data

format: 
  .asciz "%d: \"%s\"\n"
sum:
  .asciz "Sum: "
format2:
  .asciz "%ld\n"
