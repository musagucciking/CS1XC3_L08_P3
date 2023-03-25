#include <stdio.h>
#include <stdlib.h>
#include "library.h"

int main(int argc, char *argv[])
{
 

  // Check if the correct number of arguments was provided
  if (argc < 2) 
  {
    printf("Error: Incorrect number of arguments provided.\n");
    return 0;
  }

  // Convert arguments to array of integers
  argc -= 1;
  int arg_arr[argc];

  for (int i = 0; i < argc; i++)
  {
    if ((arg_arr[i] = atoi(argv[i+1])) == EOF) {
      printf("Error: Invalid list of numbers given\n");
      return 0;
    }
  }

  // Calculate and print the maximum value in the array
  printf("%d\n", max(arg_arr, argc));

  return 0;
}

