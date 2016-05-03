%{
#include "y.tab.h"

int yywrap(void) {
  return 1;
}
%}

%%

"(" return tLPAREN;
")" return tRPAREN;
"." return tDOT;
[ \t\n]+\.[ \t\n]+ return tDOTWITHSPACES;
":" return tCOLON;
[1-9]*[0-9]*\.?[0-9]* return tNUMBER;
[a-zA-Z+\-\*/]+ return tSYMBOL;
