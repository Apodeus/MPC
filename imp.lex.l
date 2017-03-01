%{
	#include <stdio.h>

	#define YY_DECL int yylex()

	#include "imp.yacc.h"



%}

LETTRE [a-zA-Z]
CHIFFRE [0-9]
CHIFFRENN [1-9]
NOMBRE {CHIFFRE}+
MOT {LETTRE}+


%option noyywrap

%%
[ \t]		{;}
[ \n]   {;}
:=	return Af;
skip return Sk;
; return Se;
if return If;
then return Th;
else 	return El;
while	return Wh;
do	return Do;
\+	return Pl;
\-  return Mo;
\* 	return Mu;

{CHIFFRE}+ return I;

{LETTRE}({CHIFFRE}|{LETTRE})* return V;

. {;}

%%
