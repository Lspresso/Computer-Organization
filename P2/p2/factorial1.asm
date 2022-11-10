.data
array: .space 4000

.text
li $v0, 5
syscall
move $s0, $v0		#n
addi $s0, $s0, 1		
li $a0, 1
sw $a0, array($zero)
li $a1, 1		#len
li $t0, 2

loop1:
beq $t0, $s0, loop1_end
li $t1, 0		#j

loop2:
beq $t1, $a1, loop2_end		#a[j]*=i
sll $t2, $t1, 2
lw $t3, array($t2)
mult $t3, $t0
mflo $t4
sw $t4, array($t2)
addi $t1, $t1, 1
j loop2

loop2_end:
li $t1, 0		#j

loop3:
beq $t1, $a1, loop3_end
sll $t2, $t1, 2
lw $t3, array($t2)		#a[j]
li $t5, 10
div $t3, $t5
mflo $s1		#tmp=a[j]/10
mfhi $s2
sw $s2, array($t2)		#a[j]%=10
addi $t5, $t1, 1
sll $t2, $t5, 2
lw $t3, array($t2)
add $s3, $t3, $s1 
sw $s3, array($t2)		#a[j+1]+=tmp
beq $t5, $a1, if1
if1_end:
addi $t1, $t1, 1
j loop3
if1:
bne $s1, $zero, if2
j if1_end
if2:
addi $a1, $a1, 1
j if1_end

loop3_end:
addi $t0, $t0, 1
j loop1

loop1_end:
addi $a1, $a1, -1
out:
bltz $a1, out_end
sll $t2, $a1, 2
lw $a0, array($t2)
li $v0, 1
syscall
addi $a1, $a1, -1
j out

out_end:
li $v0, 10
syscall
