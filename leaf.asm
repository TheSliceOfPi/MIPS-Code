#int long_add(int a, int b, int c, int d, int e, int f, int g)
#{
 # int z = (a-b) + (c-d) + (e-f) + g;
 # return z;
#}
#int main()
#{
 # int a1 = 100;
 # int a2 = 10;
  #int a3 = 90;
  #int a4 = 9;
  #int a5 = 80; 
  #int a6 = 8;
  #int a7 = 110;
  #int a8 = long_add(a1,a2,a3,a4,a5,a6,a7);
  #a1 = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8;
  #printf("%d\n", a1);
  #return 0
  #)
 #--------------------------------------------------------------------------
 	.data
	.text
	
main:
	#int a1 = 100;
	li $t1,100
 	#int a2 = 10;
 	li $t2,10
  	#int a3 = 90;
  	li $t3,90
  	#int a4 = 9;
  	li $t4,9
  	#int a5 = 80; 
  	li $t5, 80
  	#int a6 = 8;
  	li $t6,8
  	#int a7 = 110;
  	li $t7,110
  	jal long_add
  	move $t8,$v0 #set the long addition to be $t8, aka a8
  	
  	#a1 = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8;
  	add $t1,$t1,$t2 #keep adding up a1 aka $t1
  	add $t1,$t1,$t3
  	add $t1,$t1,$t4
  	add $t1,$t1,$t5
  	add $t1,$t1,$t6
  	add $t1,$t1,$t7
  	add $t1,$t1,$t8
  	li $v0, 1 #Print out Integer
  	add $a0, $t1, $zero #Set the integer to be printed to be $t1 (a1)
  	syscall #Call the action to print
  	li $v0,10 #End the program so it doesnt try to move to long_add again
  	syscall
  	
long_add:
	addi $sp, $sp, -12 #adjust stack to have room for 3 items
	sw $t8, 8($sp) #save register for use later
	sw $t9,4($sp)	#save register for use later
	sw $s0,0($sp)	#save register for use later
	
	sub $t8, $t1,$t2	#register contains (a-b)
	sub $t9,$t3,$t4		#register contains (c-d)
	add $s0,$t8,$t9		#register contains (a-b)+(c-d)
	
	sub $t8,$t5,$t6 	#register contains (e-f)
	add $s0,$s0,$t8		#register contains (a-b)+(c-d)+(e-f)
	add $s0,$s0,$t7		#register contains (a-b)+(c-d)+(e-f)+g
	add $v0,$s0,$zero	#return lond addition
	lw $s0, 0($sp)		#Restore register
	lw $t8, 4($sp)		#Restore register
	lw $t9, 8($sp)		#Restore register
	addi $sp, $sp,12	#adjust stack to delete 3 items
	jr $ra			#Jump back to main
	
	
 	 
	
	
  	
  	
