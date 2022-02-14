.global main

.text
start_of_text:


# BEGIN pasted code
main:
  mov $format, %rdi
  mov 0(%rsp), %rsi
  mov $0, %al
  call printf
  # stack manipulation
  # what is the initial value of the stack, i.e., %rsp [print $rsp]
  push $1
  push $2
  push $3

  # GUESS: how many bytes were added to the stack, 
  # i.e. compare the current value of %rsp to its value before the pushes [print $rsp]
  mov $format, %rdi
  mov 0(%rsp), %rsi
  mov $0, %al
  call printf

  pop %rax
  # GUESS: What is in %rax? [print $rax]
  mov $format, %rdi
  mov %rax, %rsi
  mov $0, %al
  call printf
  # GUESS: What is on the top of the stack now, i.e., (%rsp)? [x $rsp]
  mov $format, %rdi
  mov 0(%rsp), %rsi
  mov $0, %al
  call printf
  # GUESS: What is the item right below the top of the stack, i.e., 8(%rsp) [x $rsp+8]
  mov $format, %rdi
  mov 8(%rsp), %rsi
  mov $0, %al
  call printf

  # drop the top of the stack
  add $8, %rsp

  pop %rbx
  # GUESS: What is in %rbx? [print $rbx]
  mov $format, %rdi
  mov %rbx, %rsi
  mov $0, %al
  call printf

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
