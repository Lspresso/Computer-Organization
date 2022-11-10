.text
ori $t0, $t0, 123
jal if
ori $t1, $t1, 123
addu $s0, $t1, $t0
beq $s0, $t0, end
ori $v0, $v0, 123
subu $s1, $s0, $t0
j end
if:
ori $t2, $t2, 246
jr $31
end:
ori $t3, $t3, 246
ori $t4, $t4, 123
