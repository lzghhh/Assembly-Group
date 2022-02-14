
.global main

.text
start_of_text:


# BEGIN pasted code
dummy1:
  mov (%rsp), %r12
  mov $format, %rdi
  mov %r12, %rsi
  mov $0, %al
  call printf

  mov %rsp, %r12
  mov $format, %rdi
  mov %r12, %rsi
  mov $0, %al
  call printf


  # GUESS: What is on top of the stack? Here, compare with the value printed by `p $after_dummy` [x $rsp]

  # GUESS: What is the address of the top of the stack, relaive to the first showq in `main`? [p $rsp]
  nop
  ret

main:
  enter $0, $0

  # Print the current stack pointer before calling `dummy1` [p $rsp]
  mov %rsp, %r12
  mov $format, %rdi
  mov %r12, %rsi
  mov $0, %al
  call printf

  call dummy1

after_dummy1:
  # GUESS: What is the current stack pointer? [p $rsp]
  mov %rsp, %r12
  mov $format, %rdi
  mov %r12, %rsi
  mov $0, %al
  call printf

  # the address of the first instruction after returning from `dummy1`[p $after_dummy1 or x $rip]
  # compare with what's on the stack after entering `dummy1`
  mov (%rip), %r13
  mov $format, %rdi
  mov %r13, %rsi
  mov $0, %al
  call printf

  nop

  leave
  ret
# END pasted code

end_of_text:

.data
start_of_data:

stuff:
  .quad 1, 2, 3, 4, 5, 6, 7, 8

end_of_data:

size_of_stuff = end_of_data - stuff 
size_of_text = end_of_text - start_of_text
size_of_data = end_of_data - start_of_data

format: 
  .asciz "%ld\n"
