.text
ori $t0, $t0, 0xfc01
mtc0 $t0, $12			#SR����ֵ��IMȫΪ1

ori $s0, $0, 0x7f04
ori $s1, $0, 100
sw $s1, 0($s0)

ori $s0, $0, 0x7f00
ori $s1, $0, 9				#1001
sw	$s1, 0($s0)			#��Ctrl��IMλ��1��˵�������жϣ�Mode��0��˵����ģʽ0��Enable��1�����Լ���

end: 
beq $0, $0, end
nop

.ktext 0x4180
ori $s0, $0, 0x7f00
ori $s1, $0, 9				#1001
sw	$s1, 0($s0)			#��Ctrl��IMλ��1��˵�������жϣ�Mode��0��˵����ģʽ0��Enable��1�����Լ���

ERET:
eret