#include <stdio.h>
#include <editline/readline.h>

#include "trial-lang2.h"

int main() {
  char *line;

  while (1) {
    line = readline("> ");
    if (line == NULL) break;
    tl2_parse(line);
    printf("%s\n", line);
  };

  printf("\nexited.\n");

  return 0;
}
