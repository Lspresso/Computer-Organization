.text
ori $t0, $zero, 1
jal work
beq $zero, $zero, end

work:
ori $t0, $t0, 2
addu $t1, $t0, $t0
jr $31

end:
addu $a0, $t0, $zero