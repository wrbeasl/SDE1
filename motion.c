#include "motion.tab.c"
#include "lex.yy.c"
#include "yyerror.c"

int main() {
   printf("Motion Trajectory Checking (Scanner/Parser)");
   printf("\nCPSC/ECE 3520 Spring 2015\n");
   yyparse();
   return 0;
}
