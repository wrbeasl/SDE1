%{
#include <stdio.h>
#include <ctype.h>
int yylex();
int yyerror(char *s);
int total = 0;
%}

%union{
       int val;
       char *sval;
}

%token <val>  NUM
%token <sval> LEFT
%token <sval> RIGHT
%token <sval> UP
%token <sval> DOWN
%token <sval> NONE
%%

motion: 
	   LEFT { printf("%s\n", yylval.sval); }
	  |RIGHT{  printf("%s\n", yylval.sval);  }
          |UP	{ printf("%s\n", yylval.sval); }
	  |DOWN { printf("%s\n", yylval.sval); }
	  |NUM  { printf("%d\n", yylval.val); 
		  char *v = malloc(sizeof(char)*yylval.val);
		  int i = 0;
		  for(i = 0; i < yylval.val; ++i)
		    v[i]=yylval.sval[0];
		}
      ;


%%
