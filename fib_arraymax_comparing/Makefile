
all: compare fib array-max

compare: compare.c compare-main.s
	gcc -g -no-pie compare.c compare-main.s -o compare

fib: fib.s
	gcc -g -no-pie fib.s -o fib

array-max: array-max.s array-max-main.c
	gcc -g -no-pie array-max.s array-max-main.c -o array-max

clean:
	rm -f compare fib array-max
	rm -f *.o

a3.zip: compare.s compare-main.s fib.s array-max.s array-max-main.c compare-main.c fib.c
	zip $@ $?

