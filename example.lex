%option noyywrap

%{
#include <stdio.h>

int count = 0, countErrors = 0;
%}

desconsiderable [\t\n\s]+
uva [uU][vV][aA]
reserved (if|else|then)
variable [a-zA-Z][a-zA-Z0-9]*
integer [0-9]+
lexicalError [.*]

%%
{desconsiderable} {
  ;
}

{reserved} {
  count++;
  
  printf("PAL_RES\n");
  printf("%s\n", yytext);

  return "PAL_RES";
}

{uva} {
  count++;
  printf("UVA\n");
}

{variable} {
  count++;

  printf("VAR\n");
  printf("Variável encontrada: %s\n", yytext);
  printf("Tamanho da variável: %d\n", yyleng);
}

{integer} {
  count++;

  printf("INT\n");
  printf("Número encontrado: %s\n", yytext);
  printf("Tamanho do número: %d\n", yyleng);
}

{lexicalError} {
  countErrors++;
  printf("ERRO LÉXICO\n");
}

%%
int main() {
  yylex();

  return count;
}