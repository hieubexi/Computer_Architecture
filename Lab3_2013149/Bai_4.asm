.data
Num_ques:	.asciiz"Question 4\n"
EnterN:		.asciiz"Enter N : "
#	if (n == 0) {return 0;}
# 	else if(n == 1) {return 1;}
# 	else{
#	f0= 0; f1 = 1;
#	for ( i = 2; i <= n; i++){
# 	fn = fn-1 + fn-2;
# 	}
# 	}
# 	return fn;
.text
	li 	$v0,4
	la	$a0,EnterN
	syscall
	
	li	$v0,5
	syscall
	move	$s0,$v0 #enter N
	
	bgt 	$s0,0,return1
	j	return0
return0:
	add	$a0,$zero,0
	li	$v0,1
	syscall
	j	exit
return1:
	bgt	$s0,1,fibolacci
	add	$a0,$zero,1
	li	$v0,1
	syscall
	j	exit
	
fibolacci:	
	add	$t1,$zero,0		#old
	add	$t2,$zero,1		#current
	add	$t0,$zero,2
	j	return_fn
return_fn:
	bgt	$t0,$s0,print
	addu	$t3,$t1,$t2	#next
	addu	$t1,$t2,$zero
	addu	$t2,$t3,$zero
	addi	$t0,$t0,1
	j	return_fn
print:
	add	$a0,$t3,$zero
	li	$v0,1
	syscall
	j exit
exit:
	li	$v0,10
	syscall
			
	
