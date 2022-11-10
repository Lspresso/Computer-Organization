.data

.text
ori $t1, $zero, 123
beq $t1, $t1, if
addu $t1, $t1, $t1
if:
addu $t2, $t1, $t1