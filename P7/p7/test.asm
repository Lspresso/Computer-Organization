.text
addi 	$t0, $t0, 0xfc01
mtc0 	$t1, $12			#��SR����ֵ,IMȫ��1�����жϣ����ڳ�ʼ������

#�쳣�Ĳ�����������begin
ori $1,24981
 ori $2,0x9123
 ori $3,100
 sw $1,0($0) ## DM 0
 sw $1,0x1564($0) ## DM middle
 sw $1,0x2ffc($0) ## DM end
 sw $2,0x7f00($0) ## Timer0 CTRL
 sw $2,0x7f04($0) ## Timer0 PRESET
 sw $3,0x7f08($0)
 sw $2,0x7f10($0)  ## Timer1 CTRL
 sw $2,0x7f14($0) ## Timer1 PRESET
 sw $3,0x7f18($0)

nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop

ori 	$t3, $t3, 1 		#һ�����λ��˵���ص����쳣��һ��ָ�Ҳ���Բ�Ҫ����ô�����쳣һ������һ��
#�쳣�Ĳ�����������end
end: 
beq 	$0, $0, end     	#�������Ҫ�У���ΪCPU���xxxxxxʶ���RI��Ȼ������쳣�����ȥ��
nop
