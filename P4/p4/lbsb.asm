.text
ori $t0, $t0, 12345
sw $t0, 0($zero)
ori $t1, $t1, 24567
ori $t2, $t2, 24567
lb $t1, 0($zero)
sb $t2, 0($zero)