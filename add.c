#include <stdio.h>

int main()
{
  int array1[]={9,8,7,6,5,4,3,2,1};
  
  int array2[]={1,1,1,1,1,1,1,1,1};
  int i;
  for(i=0;i<9;i++)
    {
      array2[i]=array1[i]+array2[i];
      printf("%d\n",array2[i]);
    }
  return 0;
}
