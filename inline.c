#include <stdio.h>


int main ()
{
	int one=9;
	int two=13;
	int three;
	//__asm__ ( "assembly code" : output operands : input operand , input operand );
	__asm__ ( "addl %%ebx, %%eax" : "=a" (three) : "a" (one) , "b" (two) );
	printf("\n%d", three);
	
	
}
