.data
input_messeger:	.asciiz"Enter your 10 elements array\n"
output_messeger:	.asciiz"\nRange : "
iArray:		.space 40
space:		.asciiz" "
.text
	li	$v0,4
	la	$a0,input_messeger
	syscall
#enter array
Enter_array:
	beq 	$t0,40,exit_enter
	li	$v0,5
	syscall
	sb	$v0,iArray($t0)
	addi	$t0,$t0,4
	j	Enter_array
exit_enter:
	li	$t0,0
Export_array:
	beq	$t0,40,exit
	lb	$s0,iArray($t0)
	
	li	$v0,1
	add	$a0,$s0,$zero
	syscall
	addi	$t0,$t0,4
	li	$v0,4
	la	$a0,space
	syscall
	j	Export_array
exit:
	la	$a0,iArray
	li	$a1,10		#size of array
	
	jal 	range
	
	li	$v0,4
	la	$a0,output_messeger
	syscall
	
	sub	$t3,$t1,$t2
	li	$v0,1
	add	$a0,$t3,$zero
	syscall
	
	li	$v0,10
	syscall
range:	
	addi 	$sp,$sp,-4
	sw	$ra,0($sp)
	jal 	max
	jal	min
	
	lw	$ra,0($sp)
	addi	$sp,$sp,4
	jr	$ra	

	 
max:
	li	$t0, 4
	lb	$t1, iArray($zero) 		#$t1 = max	
	loop_max:
		beq	$t0, 40, exit_max
		lb	$s0, iArray($t0)
		addi	$t0, $t0, 4		
		ble	$s0, $t1, loop_max 	
		add	$t1, $s0, $zero    	
		
		j	loop_max
	exit_max:
	jr	$ra	
	
min:
	li	$t0,4
	lb	$t2, iArray($zero)	#t2 = min
	loop_min:
		beq	$t0,40,exit_min
		lb	$s0,iArray($t0)
		addi	$t0,$t0,4
		bge	$s0,$t2,loop_min
		add	$t2,$s0,$zero
		
		j 	loop_min
	exit_min:
	jr	$ra
	
	
