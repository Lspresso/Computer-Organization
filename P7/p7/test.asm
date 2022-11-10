.text
addi 	$t0, $t0, 0xfc01
mtc0 	$t1, $12			#给SR赋初值,IM全置1允许中断，属于初始化部分

#异常的产生构造主体begin
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

ori 	$t3, $t3, 1 		#一个检测位，说明回到了异常下一条指令，也可以不要，那么就是异常一条接着一条
#异常的产生构造主体end
end: 
beq 	$0, $0, end     	#这个必须要有，因为CPU会把xxxxxx识别成RI，然后就在异常里出不去了
nop
