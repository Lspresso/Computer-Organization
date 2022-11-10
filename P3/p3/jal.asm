.text
ori $t0, $zero, 123
jal work
subu $t2, $t1, $t0

work:
ori $t0, $t0, 245
addu $t1, $t0, $t0