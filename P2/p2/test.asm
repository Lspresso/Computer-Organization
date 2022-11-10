.data
matrix1: .space 256
matrix2: .space 256
ans: .space 256
space: .asciiz " "
enter: .asciiz "\n"

.macro getindex(%ans, %i, %j)
	sll %ans, %i, 3
	add %ans, %ans, %j
	sll %ans, %ans, 2
.end_macro

.macro save(%var)
	sw %var, 0($sp)
	subi $sp, $sp, 4
.end_macro

.macro load(%var)
	addi $sp, $sp, 4
	lw %var, 0($sp)
.end_macro

.text
li $v0, 5
syscall
move $s0, $v0
li $t0, 0
li $t1, 1
loop:
beq $t0, $s0, loop_end
move $s1, $t0
addi $s1, $s1, 1
jal func
move $a1, $v0
add $a0, $a0, $a1
addi $t0, $t0, 1
j loop

loop_end:
li $v0, 1
syscall

li $v0, 10
syscall

func:
bne $s1, $t1, work
li $v0, 1
jr $31

work_done:
jr $31

work:
move $s2, $s1

save($ra)
save($s2)

addi $s1, $s1, -1

jal func

load($s2)
load($ra)

mult $s2, $v0
mflo $v0

j work_done

