.text
ori $t0, $t0, 123
ori $s0, $s0, 123 
beq $t0, $s0, if
ori $t1, $t1, 2468
else:
ori $t2, $t2, 2468
beq $t2, $t1, end
nop
if:
ori $t3, $t3, 123
beq $t0, $t3, else
nop
end: