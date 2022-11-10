.text
ori $1, $1, 123
jal jump_1
nop
jump_1_back:
jalr $2, $12
nop
jump_1:
jr $31
addu $12, $12, $ra