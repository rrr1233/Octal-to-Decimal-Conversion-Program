.data
message1: .asciiz "Welcome to our program\nThis program is designed for conversion octal to decimel\n"
message2: .asciiz "Dear user please enter your number in octal : "
message3: .asciiz "You number in decimal is : "
message4: .asciiz "Sorry ! Dear user you enter wrong number "
base: .word 1
.text
#message
la $a0,message1
li $v0,4
syscall
#message
la $a0,message2
li $v0,4
syscall
#read number
li $v0, 5
syscall
move $t0, $v0

addi $t1,$zero,10
addi $t2,$zero,0
addi $t3,$zero,8
lw $s0,base

sle $t7,$t0,999
bge $t0,1000,endif
while:
sgt $t5,$t0,$zero
blez  $t0,endwhile
div $t0,$t1
mfhi $s1 #Rem
mflo $s2 #Qo
add $t0,$s2,$zero
mult $s1,$s0
mflo $s3
add $t2,$t2,$s3 #t2 will collect total
mult $s0,$t3
mflo $s0
j while
endwhile:
la $a0,message3
li $v0,4
syscall
add $a0,$zero,$t2
li $v0, 1
syscall
exit:
 li $v0, 10
 syscall
endif:
la $a0,message4
li $v0,4
syscall
