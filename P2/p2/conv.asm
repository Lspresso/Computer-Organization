.data
matrix1: .space 800
matrix2: .space 800
ans: .space 800
enter: .asciiz "\n"
space: .asciiz " "

.macro getindex(%ans, %i, %j)
	sll %ans, %i, 4
	add %ans, %ans, %j
	sll %ans, %ans, 2
.end_macro

.text
li $v0, 5	#scanf m1
syscall
move $s0, $v0
li $v0, 5	#scanf n1
syscall
move $s1, $v0
li $v0, 5	#scanf m2
syscall
move $s2, $v0
li $v0, 5	#scanf n2
syscall
move $s3, $v0
li $t0, 0

in1_i:		#scanf f[]
beq $t0, $s0, in1_i_end
li $t1, 0
in1_j:
beq $t1, $s1, in1_j_end
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

in2_i:		#scanf h[]
beq $t0, $s2, in2_i_end
li $t1, 0
in2_j:
beq $t1, $s3, in2_j_end
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
sub $a0, $s0, $s2
addi $a0, $a0, 1
sub $a1, $s1, $s3
addi $a1, $a1, 1
move $s0, $a0
move $s1, $a1
										#calculate
loop_i:
beq $t0, $s0, loop_i_end
li $t1, 0
loop_j:
beq $t1, $s1, loop_j_end
li $t2, 0
li $s4, 0
loop_k:
beq $t2, $s2, loop_k_end
li $t3, 0
loop_l:
beq $t3, $s3, loop_l_end
add $t4, $t0, $t2				#i+k
add $t5, $t1, $t3				#j+l
getindex($t6, $t4, $t5)
lw $a0, matrix1($t6)			#f(i+k,j+l)
getindex($t7, $t2, $t3)
lw $a1, matrix2($t7)			#h(k,l)
mult $a0, $a1					#f(i+k,j+l)*h(k,l)
mflo $a2
add $s4, $s4, $a2
addi $t3, $t3, 1
j loop_l
loop_l_end:
addi $t2, $t2, 1
j loop_k
loop_k_end:
getindex($a3, $t0, $t1)
sw $s4, ans($a3)
addi $t1, $t1, 1
j loop_j
loop_j_end:
addi $t0, $t0, 1
j loop_i

loop_i_end:
li $t0, 0

out_i:
beq $t0, $s0, out_i_end
li $t1, 0
out_j:
beq $t1, $s1, out_j_end
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