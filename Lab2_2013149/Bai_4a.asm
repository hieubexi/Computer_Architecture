.data
Num_ques: .asciiz "Question 4.a \n"
StrInput: .asciiz "Nhap chuoi so nguyen 10 phan tu: "
StrOutput: .asciiz "Hieu phan tu 2 va 5 la: "
.align 4 
arr: .space 40
.text
main:
     li $v0,4
     la $a0, Num_ques
     syscall
     li $v0,4
     la $a0, StrInput 
     syscall
     
     li $v0,5
     syscall
     move $t0, $v0
     
     li $t1,40
     
load_data:

	bleu $t1,0,exit #dieu kien dung
	div $t2,$t0,10
	mul $t3,$t2,10
	sub $t4, $t0,$t3
	div $t0,$t0,10	
	
	sw $t4,arr($t1)
	subi $t1,$t1,4 #dieu kien vong lap
	j load_data
exit:
	li $s1,8
	li $s2,20
	lw $t1, arr($s1)
	lw $t2, arr($s2)
	
	sub $s3,$t1,$t2
	
#Print arr[2] - arr[5]
	li $v0,4
     	la $a0, StrOutput
    	syscall
    	
    	li $v0,1
     	move $a0,$s3
     	syscall

	
	
	
