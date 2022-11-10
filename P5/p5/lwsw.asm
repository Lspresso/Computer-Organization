.text
ori $t0, $t0, 123
sw $t0, 0($zero)
ori $t1, $t0, 246
ori $t2, $t2, 4
sw $t1, 0($t2)
lw $t3, 0($zero)
addu $t4, $t2, $t3
subu $t5, $t4, $t3
ori $t6, $t5, 135 