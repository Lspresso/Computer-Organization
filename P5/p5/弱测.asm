ori $28, $0, 0x0
ori $29, $0, 0x0
ori $1, $7, 0x1010
lw $10, 0x0($0)
sw $1, 0x0($0)
lui $2, 0x8723
ori $3, $0, 0x7856
lui $4, 0x85ff
ori $5, $0, 0x1
lui $6, 0xffff
ori $7, $7, 0xffff
addu $1, $1, $2
addu $9, $1, $3
subu $8, $1, $2
subu $0, $7, $0
nop
nop
nop
nop
nop
beq $28, $17, label1
nop
j label2 
nop
label1: beq $1, $2, label2
nop
ori $2, $0, 0xc
nop
nop
nop
jal label3 
sw $1, 0x0($2)
j label2 
addu $1, $1, $2
label3:addu $1, $1, $2
addu $1, $1, $2
addu $1, $1, $2
sw $31, 0x0($2)
lw $1, 0x0($2)
nop
nop
nop
jr $1
sw $31, 0x0($2)
label2:
nop