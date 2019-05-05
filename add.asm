  #int array1[]={1,2,3,4,5,6,7,8,9};
  #int array2[]={3,5,6,7,8,9,2,3,1};
  #int i;
  #for(i=0;i<9;i++)
   # {
    #  array2[i]=array1[i]+array2[i];
     # printf("%d\n",array2[i]);
    #}
#------------------------------------------
    	.data
n:      .word 9
array1: .word 9,8,7,6,5,4,3,2,1
array2:	.word 1,1,1,1,1,1,1,1,1
	.text
main:
 	#int n =9
  	lw $t0,n
	#int array1[]={9,8,7,6,5,4,3,2,1};
 	la $t1, array1
  	#int array2[]={1,1,1,1,1,1,1,1,1};
  	la $t2, array2
 	#int i;
  	li $t3,0
  	
	
 loop:
 	beq $t3, $t0, endloop
 	#increment the loop
 	addi $t3,$t3,1 
 	#add arrays
 	lw $t4, ($t1) #Look at what value is being pointed to in first array
 	lw $t5, ($t2) #Look at what value is being pointed to in second array
 	add $t6, $t4,$t5 #Add the two values 
 	sw $t6, ($t2)  #store value back into second array
 	lw $a0, ($t2)  # print the addition of the two array at that index
	li $v0, 1
	syscall
 	#Go to next index
 	addi $t2,$t2,4 #Since it is an address adding by 4 will go to next bit (next idx)
 	addi $t1,$t1,4 
	
 	j loop
 	
 endloop:
 	#Done with loop and terminate
 	li $v0, 10
	syscall
  	
 	
 
