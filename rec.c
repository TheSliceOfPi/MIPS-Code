#include <stdio.h>


int fact (int n)
{

  if(n < 1)
    return 1;
  else
    return n*fact(n-1);

}

int main()
{
  int n = 6;
  int result = fact(n);
  printf("%d \n", result);

}
