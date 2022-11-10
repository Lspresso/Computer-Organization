.text
ori $t0, $t0, 123
addu $t1, $t1, $t0
subu $t2, $t1, $t0
jal if
beq $t2, $zero, end
addu $t3, $t1, $t1
if:
addu $t3, $t1, $t2
jr $31
end: