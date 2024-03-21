.data
Num_ques:	.asciiz"Question 5\n"
Str_in:		.asciiz"Computer Architecture CSE-HCMUT\n"
Str_out:	.asciiz"Position of first 'e' character is "
#	i = 0;
#	while( charArray[i] != ’e’ && charArray[i] != ’\0’){
#	i++;
#	}

.text
	li	$v0,4
	la	$a0,Num_ques
	syscall
	li	$v0,4
	la	$a0,Str_in
	syscall
	add	$s0,$a0,$zero
	move 	$s0,$a0
	li	$t1,0	# i = 0
	li	$t2,0	# bool find 'e' (true)? 1:0;
	add	$t0,$s0,$zero
while:	
		add	$t3, $t1, $t0		
		lb	$t4, 0($t3)				
		beqz	$t4, Print_negative_1		# if ($t4 == '\0') end while		
		beq	$t4, 101, Print_result		# if ( $t4 == 'e') go to found_you_bae
		addi	$t1, $t1, 1			# i = i + 1		
		j	while
Print_negative_1:
		li	$t1, -1
Print_result:
		li	$v0, 1
		move	$a0, $t1
		syscall
			
end_program:
	li	$v0, 10
	syscall

	
	

