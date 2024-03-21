.data 
Num_ques: .asciiz"Question 1.b\n"
enterString: .asciiz "Kien Truc May Tinh 2020"
.text 
	main:
		li $v0,4
		la $a0,Num_ques
		syscall
		
		li $v0,4
		la $a0,enterString
		syscall
		
		
