.data
array: .space 40000

.text
li $t0, 1
sw $t0, array($zero)
li $v0, 5
syscall
move $s0, $v0		#scanf(n)
addi $s0, $s0, 1
li $s1, 1000
li $s3, 1
li $t0, 2		#i
loop1:
beq $t0, $s0, loop1_end
li $t1, 0		#j
li $t2, 0		#jinwei
addi $s3, $s3, 1
loop2:
beq $t1, $s1, loop2_end
beq $t1, $s3, loop2_end
move $t3, $t2		#tmp
sll $t4, $t1, 2
lw $t5, array($t4)
mult $t5, $t0		#a[j]*i
mflo $t6
add $s2, $t6, $t3
li $t7, 10000
div $s2, $t7
mflo $t2
mfhi $a1
sw $a1, array($t4)
addi $t1, $t1, 1
j loop2

loop2_end:
addi $t0, $t0, 1
j loop1

loop1_end:
li $t1, 999		#k
loop3:
sll $t2, $t1, 2
lw $t3, array($t2)
bne $t3, $zero, loop3_end
addi $t1, $t1, -1
j loop3

loop3_end:

loop4:
bltz $t1, end
sll $t2, $t1, 2
lw $a0, array($t2)
li $v0, 1
syscall
addi $t1, $t1, -1
j loop4

end:
li $v0, 10
syscall
 
