.data
cArray:		.asciiz"Computer Architecture 2020\n"

.text

	la	$a0,cArray
	li	$a1,26		#size = 26
	jal	reverse
	
	li	$v0, 4			# Print
	la	$a0, cArray		# the string!
	syscall
	
	li	$v0, 10			# exit()
	syscall
	
reverse:
	li	$t0,0	#i = 0
	subi	$t5,$a1,1
	div	$t1,$a1,2
	reverse_loop:
		add	$t2,$a0,$zero	
		add	$t3,$t2,$t0
		
		bge	$t0,$t1,exit
		
		lb	$t4,0($t3) #first char
		lb	$t6,cArray($t5) #last char
		
		sb	$t6,cArray($t0) 	
		sb	$t4,cArray($t5)			
		
		addi	$t0,$t0,1
		subi	$t5,$t5,1
		j reverse_loop
				
	exit:	
		add	$v0,$a0,$zero
		jr	$ra
	
	
	
	