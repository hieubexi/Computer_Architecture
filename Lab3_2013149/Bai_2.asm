.data
Num_ques:	.asciiz"Question 2\n"
EnterA:		.asciiz"Enter a : "
EnterB:		.asciiz"Enter b : "
EnterC:		.asciiz"Enter c : "
Str_out:	.asciiz"a = "
#	if( a < -5 or a >= 3 ) { a = b * c;}
#	else { a = b + c;}
.text
	li	$v0,4
	la	$a0,Num_ques
	syscall
#Enter a
	li	$v0,4
	la	$a0,EnterA
	syscall
	li	$v0,5
	syscall
	move 	$s0,$v0 #move a from $v0 to $s0
#Enter b
	li	$v0,4
	la	$a0,EnterB
	syscall
	li	$v0,5
	syscall
	move 	$s1,$v0 #move b from $v0 to $s1
#Enter c
	li	$v0,4
	la	$a0,EnterC
	syscall
	li	$v0,5
	syscall
	move 	$s2,$v0 #move c from $v0 to $s3
	
	bgeu 	$s0,-5,else
	blt 	$s0,3,else
	mul	$s0,$s1,$s2
	j exit
else:	
	add	$s0,$s1,$s2
exit:
	add	$a0,$s0,$zero
	li	$v0,1
	syscall
	#Print result
	li	$v0,4
	la	$a0,Str_out
	syscall
	li	$v0,10	#end
	syscall

	