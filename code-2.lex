%option noyywrap

%{
  #include <stdio.h>  
%}

queryOperator (SELECT|FROM|WHERE)
id [a-zA-Z][a-zA-Z0-9]*

%%
{queryOperator} {
  printf("QUERY_OP\n");
  printf("Operador encontrado: %s\n", yytext);
  printf("Tamanho da palavra: %d\n", yyleng);
}

{id} {
  printf("ID\n");
  printf("Identificador encontrado: %s\n", yytext);
  printf("Tamanho da palavra: %d\n", yyleng);
}
%%

int main() {
  yylex();
  
  return 0;
}