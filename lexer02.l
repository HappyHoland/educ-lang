%{
  #include <stdio.h>  
%}

digit [0-9]
sign -?
alphabetic [a-zA-Z]
alphanumeric ({alphabetic} | {digit})

%%

[ \t\n]               ;
{sign}{digit}+              {printf("INT_LIT(%s)\n",yytext);}
{sign}{digit}+.{digit}+     {printf("FLOAT_LIT(%s)\n", yytext);}
{sign}.{digit}+             {printf("FLOAT_LIT(%s)\n", yytext);}
\".+\"                      {printf("STRING_LIT(%s)\n", yytext);}
"false"                     {printf("BOOL_FALSE\n", yytext);}
"true"                      {printf("BOOL_TRUE\n", yytext);}
"not"                       {printf("NOT\n");}
"and"|"&&"                  {printf("AND\n");}                            
"or"|"||"                   {printf("OR\n");}
"func"                      {printf("FUNC\n");}
"Int"                       {printf("INT_TYPE\n");}
"Bool"                      {printf("BOOL_TYPE\n");}
"Float"                     {printf("FLOAT_TYPE\n");}
"String"                    {printf("STRING_TYPE");}
"while"                     {printf("WHILE\n");}
"begin"                     {printf("BEGIN\n");}
"var"                       {printf("VAR"\n);}
"end"                       {printf("END\n");}
"dowhile"                   {printf("DO\n");}
"if"                        {printf("IF\n");}
"then"                      {printf("THEN\n");}
"else"                      {printf("ELSE\n");}
"for"                       {printf("FOR\n");}
";"                         {printf("SEMICOLON\n");}
"="                        {printf("ASSIGNMENT\n");}
[a-zA-Z][a-zA-Z0-9]*	    {printf("ID(%s)\n",yytext);}
.                           {printf("Invalid character.\n");}

%%

#ifndef yywrap
   int yywrap (void) {return 1;}
#endif

int main(void)
{
  yylex();  
  return 0;
}
