%option noyywrap
%{
    #include<stdio.h>
%}

DIGIT         [0-9]  
LETTER        [a-zA-Z]
CHAR          [^"]
KEYWORD       int|float|string|double|char|bool
PUNCHUATION   ;|, 
OPERATOR     "+"|"-"|"*"|"/"
CONDITION    if|else
BOOL         True|False

%%

{KEYWORD}                           {printf(" < Keyword %s >",yytext);} 
{CONDITION}                         {printf(" < Condition %s >",yytext);} 
{BOOL}                              {printf(" < Bool %s >",yytext);}
{DIGIT}+[.]{DIGIT}+                 {printf(" < Float %s >",yytext);}
{DIGIT}+                            {printf(" < intiger %s >",yytext);} 
["]{CHAR}*["]                       {printf(" < String %s >",yytext);} 
{LETTER}({LETTER}|{DIGIT}|[_])*     {printf(" < Identifier %s >",yytext);} 
{OPERATOR}                          {printf(" < Operator %s >",yytext);} 
{PUNCHUATION}                       {printf("%s\n ",yytext);}
\n                                  {printf("\n");} 
.                                   {  ;} 

%%



int main(){
    yyin=fopen("files/first.txt","r");
    yylex();
    return 0;
}


