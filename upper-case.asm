.global main
main:
ldr r1, =msg  @ load address of 'msg' string to r1

loop:
ldrb r2, [r1] @ load the current character to r2
cmp r2, #0    @  if( r2 == '\0' )
beq finish    @  goto finish;

@test if the char is lower-case letter
@ if it is skip the instructions below
cmp r2, #97
blt store_char
cmp r2, #122
bgt store_char

sub r2, #32   @ Convert upper to lower case

store_char:
strb r2, [r1], #1 @ store char to string
b loop            @ repeat

finish:
@ Print string
mov r0, #1    @ 1 = stdout
ldr r1, =msg  @ address of string to print
mov r2, #15   @ strlen
mov r7, #4    @ 4 = write syscall
svc #0

mov r7, #1    @ 1 = exit syscall
svc #0        @ make syscall

.data
msg: .asciz "Hello world!\n" @ string
