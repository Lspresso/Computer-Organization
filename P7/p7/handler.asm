.ktext 0x4180
mfc0	$k0, $12 			#ȡ��SR��ֵ��k0�������Բ���
mfc0	$k0, $13 			#ȡ��Cause��ֵ��k0�������Բ���
mfc0	$k0, $14 			#ȡ��EPC��ֵ��k0�������Բ���

mfc0 	$k0, $13
ori 	$k1, $0, 0x007c
and		$k0, $k1, $k0 		#����ȡ����ExcCode
beq 	$0, $k0, ERET 		#������жϣ���ô���˳�handler�ˣ������жϵķ�ʽ���ǽ���ִ������ָ��
addi 	$k0, $k0, 0xffff 	#�Դ��ֲ�һ��beq���ӳٲ�
mfc0	$k0, $14 			#ȡ��EPC��ֵ��k0
lui 	$1, 0xffff
ori 	$1, $1, 0xfffc
and 	$k1, $k1, $1		#��EPC������
addu	$k0, $k0, 4 		#��EPC+4
mtc0	$k0, $14 			#���¸���EPC
j		ERET				#�쳣������ɣ������쳣�ķ�ʽ������������ָ��
nop

ERET:
eret
