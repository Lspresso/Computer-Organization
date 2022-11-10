.text
ori $t0, $t0, 123
sw $t0, 0($zero)
lw $t0, 0($zero)
nop
nop
nop
addu $t1, $t0, $t0