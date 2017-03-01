%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror();
//extern FILE *fp;
%}

%token Pl Mo Mu
%token Wh Do
%token If Th El
%token Se Sk
%token Af
%token I V

%%

start: C
|
;


E: E Pl T
| E Mo T
| T

T: T Mu F
| F

F: '(' E ')'
| I
| V

C : V Af E
| Sk
| '(' C ')'
| If E Th C El C
| Wh E Do C
|  C Se C

%%

int yyerror(char* s){
  fprintf(stderr, "*** ERROR: %s\n", s);
  return 0;
}

int main(int argn, char **argv){
  yyparse();
  return 0;
}
