.text
ori $t0, $zero, 123
addu $t1, $t1, $t0
beq $zero, $zero, if
addu $t1, $t1, $t0
if:
subu $t1, $t1, $t0