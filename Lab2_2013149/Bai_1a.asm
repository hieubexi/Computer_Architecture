.data	
Num_ques: .asciiz"Question 1.a\n"
inputA: .asciiz "Nhap a:"
inputB: .asciiz "Nhap b:"
inputC: .asciiz "Nhap c:"
output: .asciiz "f(a,b,c) = "
.text

main:
	li $v0,4
	la $a0,Num_ques
	syscall
#nhap a
	li $v0,4
	la $a0,inputA
	syscall
	move $t0,$v0
	li $v0,5
	syscall
	move $t1,$v0
#nhap b
	li $v0,4
	la $a0, inputB
	syscall
	move $t2,$v0
	li $v0,5
	syscall
	move $t3,$v0
#nhap c
	li $v0,4
	la $a0, inputC
	syscall
	move $t4,$v0
	li $v0,5
	syscall
	move $t5,$v0
#output
	li $v0,4
	la $a0, output
	syscall
	li $v0,1
	sub $s0,$t1,$t3
	add $a0, $s0, $t5
	syscall
	
	

