.data
input_messeger:		.asciiz"Enter Radius : "
output_perimeter:	.asciiz"Perimeter : "	
output_acreage:		.asciiz"\nAcreage : "
error:			.asciiz"\Invalid request"
double_pi:		.float 6.28
pi:			.float 3.14
zero:			.float 0
.text
	li	$v0,4
	la	$a0,input_messeger
	syscall
	
	lwc1 	$f4,double_pi
	lwc1	$f3,pi
	lwc1	$f2,zero
	li	$t1,0
	li	$t2,1
	
	li	$v0,6
	syscall
#condition
	mov.s	$f1,$f0
	c.le.s	$f1,$f2
	movf 	$t2,$t1,1
	beqz	$t2,error_out	
#print perimeter
	li	$v0,4
	la	$a0,output_perimeter
	syscall
#calculation perimeter
	mul.s	$f1,$f0,$f4
	li	$v0,2
	add.s	$f12,$f1,$f2
	syscall
#print acreage
	li	$v0,4
	la	$a0,output_acreage
	syscall
#calculation arceage
	mul.s	$f1,$f0,$f0
	mul.s	$f1,$f1,$f3
	li	$v0,2
	add.s	$f12,$f1,$f2
	syscall
#end program
	li	$v0,10
	syscall

error_out:
	li	$v0,4
	la	$a0,error
	syscall
	
	li	$v0,10
	syscall
	
	

