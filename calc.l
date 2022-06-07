%{

#include <stdio.h>
#include <string.h>
#include "test.tab.h"
void showError();
%}


numbers     ([0-9])+
operation   ([+])+

%%

([0-9])+     {yylval.number = atoi(yytext); return (NUM);}
{operation}    {return (OP);}
;              { return (SEMICOLUMN); } 
.      		     {showError(); return(OTHER);}

%%


void showError(){
  printf("Other input");
}
