@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Read a string from the terminal
@ (only the first 99 characters)
@
@ args: r1: address of the string
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
read_str:
push {r0-r7, lr}
mov r0, #0       @ 0 = stdin
mov r2, #100     @ str len = 100 (read only the first 100 chars)
mov r7, #3       @ 3 = read syscall
svc #0
pop {r0-r7, lr}
bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Print integer folled by '\n'
@
@ args: r1: int to print
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global printf
print_num:
push {r0-r3, lr}
ldr r0, =fmt
bl  printf
pop {r0-r3, lr}
bx lr

.global main
main:
ldr r1, =input
bl read_str    @ read input
ldrb r1, [r1]  @ load 1st character into r1

bl print_num   @ print the ascii code of the first character

mov r7, #1
svc #0

.data
fmt: .asciz "%d\n"
input: .space 100
