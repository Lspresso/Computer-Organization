.data
array: .space 80
space: .asciiz " "

.text
li $v0, 5
syscall
move $s0, $v0
li $t0, 0

loop_in:
beq $t0, $s0, loop_in_end
li $v0, 12
syscall
sll $t1, $t0, 2
sw $v0, array($t1)
addi $t0, $t0, 1
j loop_in

loop_in_end:
move $t1, $t0
li $t0, 0
addi $t1, $t1, -1
sub $s1, $t1, $t0

loop_out:
blez $s1, loop_out_end1
sll $t2, $t0, 2
lw $a0, array($t2)
sll $t3, $t1, 2
lw $a1, array($t3)
bne $a0, $a1, loop_out_end2
addi $t0, $t0, 1
addi $t1, $t1, -1
sub $s1, $t1, $t0
j loop_out

loop_out_end1:
li $a0, 1
li $v0, 1
syscall
j end

loop_out_end2:
li $a0, 0
li $v0, 1
syscall
j end

end:
li $v0, 10
syscall
