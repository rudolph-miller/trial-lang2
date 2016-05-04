%{
#include <stdlib.h>
#include <stdio.h>

#include "trial-lang2.h"

#define YYDEBUG 1

int yylex();
int yyerror(const char *);
char *yy_scan_string(const char *);
%}

%token tLPAREN tRPAREN tDOT tDOTWITHSPACES tCOLON
%token tNUMBER tSYMBOL

%%

program
  :
  | datum
;

datum
  : number
  | symbol
  | dotted
  | list
;

number
  : tNUMBER
  {
    puts("number");
  }
;

symbol
  : tSYMBOL
  {
    puts("symbol");
  }
  | tSYMBOL tCOLON tSYMBOL
  {
    puts("symbol with colon");
  }
;

dotted
  : datum tDOT symbol
  {
    puts("dotted");
  }
;

list
  : tLPAREN list_tail
  {
    puts("list");
  }
;
  
list_tail
  : tRPAREN
  | datum list_tail
  | datum tDOTWITHSPACES datum tRPAREN
  {
    puts("dotted list");
  }
;


%%

int yyerror(const char *msg) {
  puts(msg);
  abort();
}

int tl2_parse(const char *str) {
  yy_scan_string(str);
  yyparse();

  return 0;
}
