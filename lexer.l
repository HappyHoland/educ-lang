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
"false"                     {printf("BOOL_FALSE\n");}
"true"                      {printf("BOOL_TRUE\n");}
"not"                       {printf("NOT\n");}
"and"|"&&"                  {printf("AND\n");}                            
"or"|"||"                   {printf("OR\n");}
"func"                      {printf("FUNC\n");}
"Int"                       {printf("INT_TYPE\n");}
"Bool"                      {printf("BOOL_TYPE\n");}
"Float"                     {printf("FLOAT_TYPE\n");}
"String"                    {printf("STRING_TYPE\n");}
"Array"                     {printf("ARRAY_TYPE\n");}
"Queue"                     {printf("QUEUE_TYPE\n");}
"Deque"                     {printf("DEQUE_TYPE\n");}
"Stack"                     {printf("STACK_TYPE\n");}
"Map"                       {printf("MAP_TYPE\n");}
"Set"                       {printf("SET_TYPE\n");}
"switch"                    {printf("SWITCH\n");}
"case"                      {printf("CASE\n");}
"default"                   {printf("DEFAULT\n");} 
"while"                     {printf("WHILE\n");}
"begin"                     {printf("BEGIN\n");}
"var"                       {printf("VAR\n");}
"end"                       {printf("END\n");}
"dowhile"                   {printf("DO\n");}
"if"                        {printf("IF\n");}
"elif"                      {printf("ELIF\n");}
"else"                      {printf("ELSE\n");}
"for"                       {printf("FOR\n");}
"break"                     {printf("BREAK\n");}
"continue"                  {printf("CONTINUE\n");}
";"                         {printf("SEMICOLON\n");}
"+="                        {printf("PLUS_ASSIGNMENT\n");}
"-="                        {printf("MINUS_ASSIGNMENT\n");}
"*="                        {printf("TIMES_ASSIGNMENT\n");}
"/="                        {printf("DIVIDE_ASSIGNMENT\n");}
"="                         {printf("ASSIGNMENT\n");}
"^"                         {printf("EXP_OPERATION\n");}
"+"                         {printf("ADD_OPERATION\n");}
"-"                         {printf("MINUS_OPERATION\n");}
"/"                         {printf("DIV_OPERATION\n");}
"%"                         {printf("DIVISION_REMAINDER\n");}
"//"                        {printf("DIVISION_QUOTIENT\n");}
"<"                         {printf("LESS_THAN\n");}
">"                         {printf("MORE_THAN\n");}
"=="                        {printf("EQUALS\n");}
"<="                        {printf("LESS_OR_EQUAL\n");}
">="                        {printf("MORE_OR_EQUAL\n");}
"!="                        {printf("NOT_EQUAL\n");}
"("                         {printf("PARENTHESIS_LEFT\n");}
")"                         {printf("PARENTHESIS_RIGHT\n");}
"["                         {printf("SQUARE_BRACKETS_LEFT\n");}  
"]"                         {printf("SQUARE_BRACKETS_RIGHT\n");}  
"{"                         {printf("CURLY_BRACKETS_LEFT\n");}  
"}"                         {printf("CURLY_BRACKETS_RIGHT\n");}
","                         {printf("COMMA\n");}                      
[a-zA-Z][a-zA-Z0-9]*	      {printf("ID(%s)\n",yytext);}
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
