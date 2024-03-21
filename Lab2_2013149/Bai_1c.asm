.data
Num_ques: .asciiz"Question 1.c\n"
inputStr: .asciiz"Nhap chuoi 10 ky tu :"
outputStr: .asciiz"\nChuoi da nhap la : "
String : .asciiz

.text

 main :
 	li $v0,4
 	la $a0,Num_ques
 	syscall
 #nhap chuoi
	li $v0,4
	la $a0, inputStr
	syscall
	move $t0, $v0
	
	li $v0,8
	la $a0,String
	la $a1,11
	syscall
	move $t1,$v0
#in chuoi
	li $v0,4
	la $a0,outputStr
	syscall
	
	li $v0,4
	la $a0,String
	syscall
	
