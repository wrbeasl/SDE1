%{
#include <stdio.h>
#include <ctype.h>
int yylex();
int yyerror(char *p)
%}
%union{
int numval;
char *ideptr;
}

%token LBRACE
%token RBRACE
%token COMMA
%token <ideptr> MOTION

%% /* Grammar Rules */

%%
