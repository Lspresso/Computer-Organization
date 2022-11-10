.text
ori $t0, $t0, 123
bgez $t0, if
beq $zero, $zero, end
if:
addu $t1, $t1, $t0
end: