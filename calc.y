%{
#include <stdio.h>

int yylex();
int yyerror(char *s);
int result = 0;
%}

%token NUM OP SEMICOLUMN OTHER

%type <number> NUM
%type	<number> stmt

%union{
    int number;
}

%%

prog:
    stmts
;

stmts: 
     | stmt OP stmts  
     | stmt stmts

stmt: 
    NUM { result = result + $1; } 
    | SEMICOLUMN { 
      printf("%d\n", result); 
      result = 0;
    }
    | OTHER
;

%%

int yyerror(char *s)
{
	printf("Syntax Error on line %s\n", s);
	return 0;
}

int main()
{
    yyparse();
    return 0;
}

