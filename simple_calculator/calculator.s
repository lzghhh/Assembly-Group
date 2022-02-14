#
# Usage: ./calculator <op> <arg1> <arg2>
#

# Make `main` accessible outside of this module
.global main

# Start of the code section
.text

# int main(int argc, char argv[][])
main:
  # Function prologue
  enter $0, $0

  # Variable mappings:
  # op -> %r12
  # arg1 -> %r13
  # arg2 -> %r14
  movq 8(%rsi), %r12  # op = argv[1]
  movq 16(%rsi), %r13 # arg1 = argv[2]
  movq 24(%rsi), %r14 # arg2 = argv[3]

  # Hint: Convert 1st operand to long int
  mov %r13, %rdi
  call atol 
  mov %rax, %r13
  
  # Hint: Convert 2nd operand to long int
  mov %r14, %rdi
  call atol
  mov %rax, %r14 

  # Hint: Copy the first char of op into an 8-bit register
  # i.e., op_char = op[0] 
  mov 0(%r12), %cl
  
  # if (op_char == '+') {
  #   ...
  # }
  # else if (op_char == '-') {
  #  ...
  # }
  # ...
  # else {
  #   // print error
  #   // return 1 from main
  # }

  # if the given symbol is +, jump to add 
  mov $plus, %rax
  mov 0(%rax), %dl
  cmp %dl, %cl
  je add

  # if the given symbol is -, jump to minus
  mov $sub, %rax
  mov 0(%rax), %dl
  cmp %dl, %cl
  je minus

  # if the given symbol is *, jump to multi
  mov $multiple, %rax
  mov 0(%rax), %dl
  cmp %dl, %cl
  je multi

  # if the given symbol is /, jump to divide
  mov $div, %rax
  mov 0(%rax), %dl
  cmp %dl, %cl
  je divide

  # invalid operation 
  jmp else

  add:
    add %r14, %r13
    mov $format, %rdi
    mov %r13, %rsi 
    jmp operation_end

  minus:
    sub %r14, %r13
    mov $format, %rdi
    mov %r13, %rsi
    jmp operation_end

  multi:
    imul %r14, %r13
    mov $format, %rdi
    mov %r13, %rsi  
    jmp operation_end

  divide:
    mov %r13, %rax
    cqo
    idiv %r14
    mov $format, %rdi
    mov %rax, %rsi 
    jmp operation_end

  else:
    mov $message, %rdi
    call printf
    jmp end
  

  operation_end:
    call printf

  end:

  # Function epilogue
  leave
  ret

# Start of the data section
.data

format: 
  .asciz "%ld\n"
plus:
  .asciz "+"
sub: 
  .asciz "-"
multiple:
  .asciz "*"
div:
  .asciz "/"
message:
  .asciz "Unknown operation\n"
