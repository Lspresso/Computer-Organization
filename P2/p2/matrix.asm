.data
matrix1: .space 256
matrix2: .space 256
ans: .space 256
enter: .asciiz "\n"
space: .asciiz " "
str: .asciiz "The numbers are : \n"

.macro getindex(%ans, %i, %j)
	sll %ans, %i, 3
	add %ans, %ans, %j
	sll %ans, %ans, 2
.end_macro

.text
li $v0, 5	#scanf n 
syscall
move $s0, $v0
li $t0, 0

in1_i:
beq $t0, $s0, in1_i_end
li $t1, 0
in1_j:
beq $t1, $s0, in1_j_end
li $v0, 5
syscall
getindex($t2, $t0, $t1)
sw $v0, matrix1($t2)
addi $t1, $t1, 1
j in1_j
in1_j_end:
addi $t0, $t0, 1
j in1_i

in1_i_end:
li $t0, 0

in2_i:
beq $t0, $s0, in2_i_end
li $t1, 0
in2_j:
beq $t1, $s0, in2_j_end
li $v0, 5
syscall
getindex($t2, $t0, $t1)
sw $v0, matrix2($t2)
addi $t1, $t1, 1
j in2_j
in2_j_end:
addi $t0, $t0, 1
j in2_i

in2_i_end:
li $t0, 0
										#calculate
loop_i:
beq $t0, $s0, loop_i_end
li $t1, 0
loop_j:
beq $t1, $s0, loop_j_end
li $t2, 0
li $s4, 0
loop_k:
beq $t2, $s0, loop_k_end
getindex($t3, $t0, $t2)
lw $s1, matrix1($t3)
getindex($t4, $t2, $t1)
lw $s2, matrix2($t4)
multu $s1, $s2
mflo $s3
add $s4, $s4, $s3
addi $t2, $t2, 1
j loop_k
loop_k_end:
getindex($t5, $t0, $t1)
sw $s4, ans($t5)
addi $t1, $t1, 1
j loop_j
loop_j_end:
la $a0, enter
li $v0, 4
syscall
addi $t0, $t0, 1
j loop_i

loop_i_end:
li $t0, 0

out_i:
beq $t0, $s0, out_i_end
li $t1, 0
out_j:
beq $t1, $s0, out_j_end
getindex($t2, $t0, $t1)
lw $a0, ans($t2)
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall
addi $t1, $t1, 1
j out_j
out_j_end:
la $a0, enter
li $v0, 4
syscall
addi $t0, $t0, 1
j out_i

out_i_end:
li $v0, 10
syscall