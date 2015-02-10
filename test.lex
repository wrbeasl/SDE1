digit	[0-9]
alpha	[a - fA - F]
hextail	({digit}|{alpha}){1,8}
hex	0[xX](hextail)

%%
{hex}	printf("Found a HEX number %s !", yytext);
.	printf("");
%%

main()
{
  printf("Give me your input\n");
  yylex();
}
