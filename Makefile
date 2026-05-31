CC       = gcc
CROSS_CC = arm-linux-gnueabi-gcc
CFLAGS   = -Wall -static

.PHONY: all run arm run-arm clean

all: hello

hello: hello.c hello.h
	$(CC) $(CFLAGS) -o hello hello.c

run: hello
	./hello

arm: hello-arm

hello-arm: hello.c hello.h
	$(CROSS_CC) $(CFLAGS) -o hello-arm hello.c

run-arm: hello-arm
	qemu-arm ./hello-arm

clean:
	rm -f hello hello-arm
