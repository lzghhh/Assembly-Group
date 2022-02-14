/* Complete the C version of the driver program for compare. This C code does
 * not need to compile. */

#include <stdio.h>
#include <stdlib.h>

extern long compare(long, long);

int main(int argc, char *argv[]) {
  int a = 0;
 if (argc != 3) {
          printf("Two arguments required\n");
          a = 1;
          return a;
  }
  long b = atol(argv[1]);
  long c = atol(argv[2]);

  long d =  compare(b, c);

  if (d == -1) {
          printf("less\n");
  }
  else if (d == 0) {
          printf("equal\n");
  }
  else {
          printf("greater\n");
  }
  return a;
}

~                                                                                                                     
~                                                                                                                     
~      

