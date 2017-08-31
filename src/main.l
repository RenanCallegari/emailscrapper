/* emailscrapper
 * Renan H. M. Callegari RA:140904
 */


%{
#include <stdio.h>
int i=0;
%}
inicioEMAIL [^ \@\t\n\.\-][A-z0-9\.\-\_]*[^ \.\-]
fimEMAIL [^ \.\-][A-z0-9\.]*

%%

{inicioEMAIL}@{fimEMAIL}[\.\?\!]  {
for (i=0; i<yyleng-1; i++){
	printf("%c", yytext[i]);
}
printf ("\n");
}

{inicioEMAIL}@{fimEMAIL}[\-\_\+]  ;


{inicioEMAIL}@{fimEMAIL} {	
	printf("%s\n", yytext);
}

[ \t\n] {};
. ;

%%

int main() {
  yylex();
  return 0;
}
