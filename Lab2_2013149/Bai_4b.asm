.data
Num_ques : .asciiz"Question 4.b \n"
input: .asciiz "2013149 - Nguyen Huu Hieu"
output:	.space	256

.text
main:
	li $v0,4
    	la $a0, Num_ques
     	syscall
     	
	la	$a0,input
	jal	find_len

	add	$t1,$zero,$v0		#$t1 = find_len
	add	$t2,$zero,$a0		#$t2 = input
	add	$a0,$zero,$v0		#$a0 = find_len
	 
	lb	$t3,input($a0)		#load $t3 to last char of Input		
	sb	$t3,output($zero)	#store output[0] to $t3
	lb	$s0,0($t2)		#load $s0 to first char 
	
	li	$t4,1			# i = 1 
	load_loop:
		bgt	$t4, $a0,exit_load	#if i > find_len then end loop
		lb 	$t5, input($t4)		#load $t5 to input[i]
		sb	$t5, output($t4)	#store output[i] to $t5
		addi	$t4,$t4,1
		j 	load_loop
	exit_load:
	sb	$s0, output($a0) # store 
	#print Output String
	li 	$v0, 4
	la 	$a0, output
	syscall
	
	li	$v0, 10			# end main
	syscall
	 
find_len:
	li 	$t0, 0
	li 	$t1, 0
	for:
		add	$t1,$a0,$t0
		lb 	$t2,0($t1)
		beqz	$t2, exit_for
		addiu	$t0,$t0,1
		j	for
	exit_for:
		subi	$t0,$t0,1
		add	$v0,$t0,$zero
		addi	$t0,$t0,0
		jr	$ra
		
		
			
