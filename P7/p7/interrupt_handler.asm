.ktext 0x4180
## $30 ��¼�쳣����
## $29 ��¼�жϴ���
## $28 ����EPC
## $27 ȡCause��BD�ж�
## $26 ȡCause��ExcCode
## $25 ȡSR
## �涨�ӳٲ��쳣Ϊ$10���µ��쳣����add $10,$10,$10 �������db_hanlder��$10��0�󷵻أ�$30��1
## �涨���ӳٲ�ָ���쳣����exc_handler��EPC�����EPC+4������ָ�$30��1
## �涨�жϴ��� EPC���ı� ����ԭָ�$29��1
mfc0 $28,$14
mfc0 $27,$13
mfc0 $26,$13
mfc0 $25,$12
sll $26,$26,25
srl $26,$26,27 ## ExcCode��ͨ����λ����IP��BD��Ӱ�죩
srl $27,$27,31 ## BD
beq $26,$0,interrupt_handler ## ExcCode=0 �жϴ���
nop
bgtz $27,db_handler ## BD=1
nop
## �ӳٲ�ָ���쳣ͬʱ���ⲿ�жϣ����ȴ����ⲿ�ж�
exc_handler:
andi $28,$28,0xfffffffc ## �ֶ���
addi $28,$28,4 ## EPC+4
mtc0 $28,$14
addi $30,$30,1 ## ��¼�쳣����
eret



db_handler:
or $10,$0,$0 ## $10���� ȷ���´��ӳٲ۲����쳣
addi $30,$30,1 ## ��¼�쳣����
eret


interrupt_handler:
addi $29,$29,1
eret ##��¼�жϴ���