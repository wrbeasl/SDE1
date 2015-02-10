%{
#include <stdio.h>
#include <ctype.h>
int yylex(void);
int yyerror(char *s);
%}
%union{
int numval;
char *ideptr;
}

%token LBRACE
%token RBRACE
%token COMMA
%token <ideptr> COURSE
%token <numval> SECTION
%token <ideptr> DAY
%token <numval> TIME
%token <ideptr> NAME
%%

transunit: LBRACE needs RBRACE { printf("found valid 'needs' list\n"); }
	   | resources { printf("found valid 'resources' list\n"); }
	   | resource_entry { printf("found valid 'resource_entry' list\n"); }
	   | course_capabilities_list { printf("found valid 'course_capabilities' list\n"); }
	   | unavailable_list { printf("found valid 'unavailable_list'\n"); }
;
needs: LBRACE need RBRACE
       | LBRACE need RBRACE COMMA needs
;
need: COURSE COMMA SECTION COMMA DAY COMMA TIME COMMA TIME
;

resources: LBRACE resource_entry RBRACE
;
resource_entry: LBRACE resource RBRACE
	        | LBRACE resource RBRACE COMMA resource_entry
;
resource: NAME COMMA course_capabilities_list COMMA unavailable_list
;

course_capabilities_list: LBRACE course RBRACE
;
course: COURSE
        | COURSE COMMA course
;
unavailable_list: LBRACE unavailable RBRACE
;
unavailable: /* available 24/5 */
	     | LBRACE DAY COMMA TIME COMMA TIME RBRACE
	     | LBRACE DAY COMMA TIME COMMA TIME RBRACE COMMA unavailable
;
%%
