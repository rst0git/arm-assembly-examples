.global main
main:
ldr r1, =num  @ load the address of the string to r1
mov r0,  #0   @ r0  = 0
mov r10, #10  @ r10 = 10

@ check if( num < 0 )
ldrb r2, [r1] @ store the first char
cmp r2, #45   @ if( r2 == '-' )

moveq r11, #1 @ r11 = 1
addeq r1, #1  @ move to next char
movne r11, #0 @ else r11 = 0

loop:
ldrb r2, [r1], #1 @ load current char
cmp r2, #0        @ if( r2 == '\0 )
beq finish        @ goto finish
mul r0, r10       @ r0 *= 10
sub r2, #48       @ r2 -= '0'
add r0, r2        @ r0 += r2
b loop

finish:
cmp r11, #1       @ if '-' was found
rsbeq r0, #0      @ r0 = -r0

mov r7, #1
svc #0

.data
num: .asciz "107"
