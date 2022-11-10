.text
ori $t0, $t0, 0xfc01
mtc0 $t0, $12			#SR赋初值，IM全为1

ori $s0, $0, 0x7f04
ori $s1, $0, 100
sw $s1, 0($s0)

ori $s0, $0, 0x7f00
ori $s1, $0, 9				#1001
sw	$s1, 0($s0)			#将Ctrl的IM位置1，说明允许中断，Mode置0，说明是模式0，Enable置1，可以计数

end: 
beq $0, $0, end
nop

.ktext 0x4180
ori $s0, $0, 0x7f00
ori $s1, $0, 9				#1001
sw	$s1, 0($s0)			#将Ctrl的IM位置1，说明允许中断，Mode置0，说明是模式0，Enable置1，可以计数

ERET:
eret