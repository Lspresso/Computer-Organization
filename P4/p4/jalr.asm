.text
ori $t0, $t0, 123
jal if
ori $t1, $t1, 123
jr $s0
if:
addu $t2, $t1, $t0
jalr $s0, $31
ori $t3, $t3, 123