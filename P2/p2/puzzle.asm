.data
matrix: .space 256
visited: .space 256
ax: .space 40
ay: .space 40

.macro getindex(%ans, %i, %j)
	sll %ans, %i, 3
	add %ans, %ans, %j
	sll %ans, %ans, 2
.end_macro

.text
li $v0, 5
syscall
move $s0, $v0		#n
li $v0, 5
syscall
move $s1, $v0		#m

li $t0, 0
in_i:
beq $t0, $s0, in_i_end
li $t1, 0
in_j:
beq $t1, $s1, in_j_end
li $v0, 5
syscall
getindex($t2, $t0, $t1)
sw $v0, matrix($t2)
addi $t1, $t1, 1
j in_j
in_j_end:
addi $t0, $t0, 1
j in_i

in_i_end:
li $v0, 5
syscall
addi $v0, $v0, -1
move $t4, $v0		#start_x
li $v0, 5
syscall
addi $v0, $v0, -1
move $t5, $v0		#start_y
li $v0, 5
syscall
addi $v0, $v0, -1
move $t6, $v0		#target_x
li $v0, 5
syscall
addi $v0, $v0, -1
move $t7, $v0		#target_y

getindex($t2, $t4, $t5)
li $t3, 1
sw $t3, visited($t2)		#visited[start_x][start_y]=1

li $t2, -1
li $t3, 1
li $t0, 0
sll $t1, $t0, 2
sw $t2, ax($t1)
sw $zero, ay($t1)
addi $t0, $t0, 1
sll $t1, $t0, 2
sw $t3, ax($t1)
sw $zero, ay($t1)
addi $t0, $t0, 1
sll $t1, $t0, 2
sw $zero, ax($t1)
sw $t2, ay($t1)
addi $t0, $t0, 1
sll $t1, $t0, 2
sw $zero, ax($t1)
sw $t3, ay($t1)		#ax[4]={-1,1,0,0}; ay[4]={0,0,-1,1}
li $a0, 0			#ans=0
li $a1, 4
move $s2, $t4		#x=start_x
move $s3, $t5		#y=start_y
jal dfs			#dfs(start_x,start_y)
li $v0, 1		#print(ans)
syscall
li $v0, 10
syscall
						
dfs:				
beq $s2, $t6, if1		#x==target_x?
if1_end:
li $t0, 0
loop:
beq $t0, $a1, loop_end
sll $t2, $t0, 2
lw $t1, ax($t2)
add $s4, $t1, $s2		#nx=ax[i]+x
lw $t1, ay($t2)
add $s5, $t1, $s3		#ny=ay[i]+y
bgez $s4, if_nx		#if(nx>=0)
work_done:
addi $t0, $t0, 1
j loop
loop_end:
jr $31

if_nx:
bgez $s5, if_ny		#if(ny>=0)
j work_done

if_ny:
sub $t1, $s4, $s0
bltz $t1, if_n			#if(nx<n)
j work_done

if_n:
sub $t1, $s5, $s1
bltz $t1, if_m			#if(ny<m)
j work_done

if_m:
getindex($t2, $s4, $s5)
lw $t1, visited($t2)
beq $t1, $zero, if_v		#if(visited[nx][ny]==0)
j work_done

if_v:
getindex($t2, $s4, $s5)
lw $t1, matrix($t2)
beq $t1, $zero, work		#if(matrix[nx][ny]==0)
j work_done



if1:
beq $s3, $t7, if2		#y==target_y?
j if1_end

if2:
addi $a0, $a0, 1
jr $31

work:
getindex($t2, $s4, $s5)
li $t1, 1
sw $t1, visited($t2)

sw $ra, 0($sp)		#stack_push
subi $sp, $sp, 4
sw $t0, 0($sp)
subi $sp, $sp, 4
sw $s2, 0($sp)
subi $sp, $sp, 4
sw $s3, 0($sp)
subi $sp, $sp, 4
sw $s4, 0($sp)
subi $sp, $sp, 4
sw $s5, 0($sp)
subi $sp, $sp, 4

move $s2, $s4
move $s3, $s5
jal dfs

addi $sp, $sp, 4	#stack_pop
lw $s5, 0($sp)
addi $sp, $sp, 4
lw $s4, 0($sp)
addi $sp, $sp, 4
lw $s3, 0($sp)
addi $sp, $sp, 4
lw $s2, 0($sp)
addi $sp, $sp, 4
lw $t0, 0($sp)
addi $sp, $sp, 4
lw $ra, 0($sp)

getindex($t2, $s4, $s5)
li $t1, 0
sw $t1, visited($t2)

j work_done