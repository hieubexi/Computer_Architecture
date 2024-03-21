.data
Num_ques:	.asciiz"Question 3\n"
Enter_input:	.asciiz"Enter input : "
Str_out:	.asciiz"a = "
#	switch (input)
# 	{
# 	case 1: a = b + c; break;
#	case 2: a = b - c; break;
#	case 3: a = b x c; break;
# 	case 4: a = b / c; break;
# 	default: NOP; // No-Operation; a = 0
# 	break;
# 	}

.text
	li	$v0,4
	la	$a0,Num_ques
	syscall
	
	li	$v0,4
	la	$a0,Enter_input
	syscall
	
	li	$v0,5
	syscall
	move	$s0,$v0 	#enter input
	
	li	$s1,200		#b = 200
	li	$s2,4		#c = 4
	li	$t0,0
	bne	$s0,1,case2
	add	$t0,$s1,$s2
	j	end_switch
case2:
	bne	$s0,2,case3
	sub	$t0,$s1,$s2
	j	end_switch
case3:
	bne	$s0,3,case4
	mul	$t0,$s1,$s2
	j	end_switch
case4:
	bne	$s0,4,end_switch
	div	$t0,$s1,$s2
	j	end_switch
end_switch:
	li	$v0,4
	la	$a0,Str_out
	syscall
	add	$a0,$t0,$zero
	li	$v0,1
	syscall
	
	li	$v0,10
	syscall