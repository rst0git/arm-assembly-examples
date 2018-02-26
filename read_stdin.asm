.global main
main:

@ Read one line from the terminal
mov r0, #0     @ 0 = stdin
ldr r1, =input @ where to store the input
mov r2, #99    @ max num of bytes to read
mov r7, #3     @ 3 = "read" syscall
svc #0

ldrb r3, [r1]    @ Copy 1st character to r3
cmp r3, #90      @ if(r3 > 'Z')
ldrgt r1, =lower @ it must be lower-case
ldrle r1, =upper @ else: upper-case

@ write to stdout
mov r0, #1   @ 1 = stdout
mov r2, #12  @ The strlen of the output
mov r7, #4   @ 4 = "write" syscall
svc #0

mov r7, #1   @ 1 = exit syscall
svc #0       @ make a syscall

.data
upper: .asciz "upper case\n"
lower: .asciz "lower case\n"
input: .space 100 @ reserve 100 bytes of space
				  @ initialised to 0
