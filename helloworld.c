#include <stdio.h>

// Copyright 2021 James Cuzella

int main() {
  char str[100];
  int num_i, num_j;
  int items_read = 0;
  double dbl_x;

  printf("Enter a value: ");
  items_read = scanf("%99s %d %d %lf", str, &num_i, &num_j, &dbl_x);
  printf("\nYou entered: %s:%d:%d:%lf\n", str, num_i, num_j, dbl_x);
  printf("Items read: %d\n", items_read);
  return 0;
}
