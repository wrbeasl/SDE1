%{
#include <stdio.h>
#include <ctype.h>
int yylex();
int yyerror(char *s);
int total = 0;
void checkvalue();
%}

%union{
       int val;
       char *sval;
}
%token	      END 0 "end of file"
%token <val>  NUM
%token <sval> LEFT
%token <sval> RIGHT
%token <sval> UP
%token <sval> DOWN
%token <sval> NONE
%%

list_option: END | motion END;

motion:
      movement | motion movement;

movement: 
      direction | direction value;



%%

void checkval(){
  if(total==0)
     printf("***** valid motion path AND CLOSED PATH *****\n");
  else
     printf("***** scan/parse for valid motion path successful *****\n");

}
