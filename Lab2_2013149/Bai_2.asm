.data 
Num_ques: .asciiz"Question 2\n"
inputA: .asciiz"Nhap a"
inputB: .asciiz"Nhap b"
inputC: .asciiz"Nhap c"
.text

main:
	li $v0,4
	la $a0,Num_ques
	syscall
	
	addi $s0,$zero, 100000
	addi $s0, $s0,500
	subi $s0, $s0,400
	
	li $v0,1
	la $a0, 0($s0)
	syscall
