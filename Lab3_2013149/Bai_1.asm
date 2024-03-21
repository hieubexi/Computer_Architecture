.data
Num_ques:	.asciiz"Question 1\n"
input:		.asciiz"Enter a : "
Str_1:		.asciiz"\nComputer Science and Engineering, HCMUT\n"
Str_2:		.asciiz"Computer Architecture 2020"
#	if( a % 2 == 1) { Print string: "Computer Science and Engineering, HCMUT"}
#	else { Print string: "Computer Architecture 2020"}
.text
main:
	li	$v0,4
	la	$a0,Num_ques	
	syscall
	
	li	$v0,4
	la	$a0,input
	syscall
	
	li	$v0,5		#Enter a
	syscall		
	move 	$s0,$v0		#move a form $v0 to $s0
	add	$t0,$s0,$zero
	jal	div_br		#Devide by remainder
	
	add	$a0,$v0,$zero	#$a0 = $v0 = a%2.
	bne	$a0,1,else	
	li	$v0,4
	la	$a0,Str_1
	syscall
else:
	li	$v0,4
	la	$a0,Str_2
	syscall
	li	$v0,10
	syscall
div_br:	
	blt	$t0,2,exit
	subi	$t0,$t0,2
	j	div_br
	exit:
		add	$v0,$t0,$zero
		jr	$ra
	
