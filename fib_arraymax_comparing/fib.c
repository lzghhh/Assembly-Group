/* Complete the C version of the driver program for fib. This C code does not 
 * need to compile. */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  if (argc != 2) {
	  printf("A natural number argument is required.\n");
	  return 1;
  }

  long a = atol(argv[1]);
  if (a < 0) {
          printf("A natural number argument is required.\n");
	  return 1;
  }
  long b = 0;
  if (a == 1 || a == 2) {
	  b = 1;
	  printf("%ld\n", b);
	  return 0;
  }
  
  long first = 1;
  long second = 1;
  for (int x = 2; x < a; ++x) {
	  b = first + second;
	  first = second;
	  second = b;
  } 
  printf("%ld\n", b);


  return 0;
}

