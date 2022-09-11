%option noyywrap

%{
  #include <stdio.h>

  int count = 0, countErrors = 0;
%}

reserved (if|else|then|while|for|do|float|double)
relationalOperator (==|!=|<|<=|>|>=|===|!==)
oyIdentifier [_]?[^aeiouAEIOU0-9\W][a-zA-Z0-9]+
uyIdentifier [_]?[aeiouAEIOU][a-zA-Z0-9]+
string ["].*["]
lexicalError .*
%%

{reserved} {
  count++;

  printf("PAL_RES\n");
  printf("Palavra reservada encontrada: %s\n", yytext);
  printf("Tamanho da palavra: %d\n", yyleng);
}

{relationalOperator} {
  count++;

  printf("OP_REL\n");
  printf("Operador relacional encontrado: %s\n", yytext);
  printf("Tamanho da palavra: %d\n", yyleng);
}

{oyIdentifier} {
  count++;

  printf("ID_OY\n");
  printf("Identificador encontrado: %s\n", yytext);
  printf("Tamanho da palavra: %d\n", yyleng);
}

{uyIdentifier} {
  count++;

  printf("ID_UY\n");
  printf("Identificador encontrado: %s\n", yytext);
  printf("Tamanho da palavra: %d\n", yyleng);
}

{string} {
  count++;

  printf("STR\n");
  printf("String encontrada: %s\n", yytext);
  printf("Tamanho da palavra: %d\n", yyleng);
}

{lexicalError} {
  countErrors++;

  printf("ERRO_LEX\n");
}
%%

int main() {
  yylex();

  printf("Total de palavras: %d\n", count);
  printf("Total de erros: %d\n", countErrors);

  return 0;
}