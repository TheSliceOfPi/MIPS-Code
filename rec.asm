#int fact (int n)
#{
 # if(n < 1)
  #  return 1;
  #else
   # return n*fact(n-1);
#}
#int main()
#{
 # int n = 6;
  #int result = fact(n);
  #printf("%d \n", result);
  #}
 #-----------------------------------------------
 	.data
 	.text
 
 main:
 	# int n = 6;
 	li $a0,6
 	jal fact
 	move $t2,$v0 #set the fact to $t2
 	li $v0, 1 #Print out Integer
  	add $a0, $t2, $zero #Set the integer to be printed to be $t2 (result)
  	syscall #Call the action to print
  	li $v0,10 #End the program so it doesnt try to move to fact again
  	syscall
  	
 	

fact:
	addi $sp,$sp, -8 #Free up two stack spaces
	sw $ra,4($sp)	# what was returned
	sw $a0, 0($sp) # What n is currently
	slti $t0,$a0,1 #Set t0 to be less than 1 to be compared
	beq $t0,$zero,Recur #n=>1
	addi $v0,$zero,1 #If n<1
	addi $sp,$sp ,8 # deal with the free two spaces
	jr $ra #return 1
Recur:
	addi $a0,$a0,-1 #Make n =n-1
	jal fact  #recurse fact(n-1)
	lw $a0,0($sp) # what is n
	lw $ra,4($sp) # what was returned
	addi $sp,$sp,8 #adjust pointer 
	mul $v0,$a0,$v0 #multiply n*fact(n-1)
	jr $ra #return n*fact(n-1)
	
 
 	
