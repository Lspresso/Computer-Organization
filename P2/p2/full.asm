.data
array: .space 40
used: .space 40
space: .asciiz " "
enter: .asciiz "\n"

.text
li $v0, 5		#n
syscall
move $s0, $v0
li $s1, 0		#index
jal FullArray

li $v0, 10
syscall

FullArray:
sub $t0, $s1, $s0
bltz $t0, if_else
li $t0, 0
loop1:
beq $t0, $s0, loop1_end
sll $t1, $t0, 2			#print array[i]
lw $a0, array($t1)
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall
addi $t0, $t0, 1
j loop1

loop1_end:
la $a0, enter
li $v0, 4
syscall
jr $ra

if_else:
li $t0, 0		#i
loop2:
beq $t0, $s0, loop2_end
sll $t1, $t0, 2
lw $a0, used($t1)
beq $a0, $zero, work
addi $t0, $t0, 1
j loop2
work_done:
sll $t1, $t0, 2
sw $zero, used($t1)
addi $t0, $t0, 1
j loop2
loop2_end:
jr $ra

work:
sll $t2, $s1, 2
addi $t3, $t0, 1
sw $t3, array($t2)
sll $t2, $t0, 2
li $t3, 1
sw $t3, used($t2)

sw $ra, 0($sp)		#stack_push
subi $sp, $sp, 4
sw $t0, 0($sp)
subi $sp, $sp, 4
sw $s1, 0($sp)
subi $sp, $sp, 4

addi $s1, $s1, 1
jal FullArray

addi $sp, $sp, 4	#stack_pop
lw $s1, 0($sp)
addi $sp, $sp, 4
lw $t0, 0($sp)
addi $sp, $sp, 4
lw $ra, 0($sp)

j work_done