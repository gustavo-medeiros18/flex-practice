%option noyywrap

%{
  #include <stdio.h>
  
  int tokensCount = 0, errorsCount = 0;
%}

reserved (if|else|then)
lexicalError .*
aWord [aA].*

%%
{reserved} {
  tokensCount++;

  printf("PAL_RES\n");
  printf("Palavra reservada encontrada: %s\n", yytext);
  printf("Tamanho da palavra: %d\n", yyleng);
}

{aWord} {
  tokensCount++;
  
  printf("A_WORD\n");
  printf("Palavra que começa com 'a': %s\n", yytext);
}

{lexicalError} {
  errorsCount++;
  
  printf("ERR_LEX\n");
}
%%

int main() {
  yylex();
  
  printf("Quantidade total de tokens: %d\n", tokensCount);
  printf("Quantidade total de erros: %d\n", errorsCount);
  
  return 0;
}
