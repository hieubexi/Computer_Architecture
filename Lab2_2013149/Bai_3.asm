.data
Num_ques: .asciiz"Question 3\n"
inputa : .asciiz"Nhap he so a : "
inputb : .asciiz"Nhap he so b : "
inputc : .asciiz"Nhap he so c : "
inputd : .asciiz"Nhap he so d : "
inputX : .asciiz "Nhap x : "
output : .asciiz"f(x) = "


.text
main: 
	li $v0,4
	la $a0,Num_ques
	syscall
# nhap a
	li $v0,4
	la $a0,inputa
	syscall
	li $v0,5
	syscall
	move $s1,$v0 #luu a vao $s1
#nhap b
	li $v0,4
	la $a0,inputb
	syscall
	li $v0,5
	syscall
	move $s2,$v0 #luu b vao $s2
#nhap c
	li $v0,4
	la $a0,inputc
	syscall
	li $v0,5
	syscall
	move $s3,$v0 #luu c vao $s3
#nhap d
	li $v0,4
	la $a0,inputd
	syscall
	li $v0,5
	syscall
	move $s4,$v0 #luu d vao $s4
#nhap x
	li $v0,4
	la $a0,inputX
	syscall
	li $v0,5
	syscall
	move $t0, $v0 #luu x vao $t0
#Calculate
	mul $t1,$s1,$t0
	sub $t1,$t1,$s2
	mul $t1,$t1,$t0
	add $t1, $t1,$s3
	mul $t1, $t1,$t0
	sub $s0,$t1,$s4

#in
	li $v0,4
	la $a0, output
	syscall
	li $v0,1
	la $a0,0($s0)
	syscall
	
	
	


	
	
