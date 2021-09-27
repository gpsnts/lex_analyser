%option noyywrap
%{
	#include <iostream>
	#include <cstdlib>
	#include <math.h>
	#include <stdio.h>
	#include "scanner.hpp"
	#include "parser.hpp"
	#include "location.hh"

	using namespace std;

	#define yyterminate() LexTrabParser::Parser::make_END(LexTrabParser::location());
	#define YY_USER_ACTION m_driver.increaseLocation(yyleng);
%}

%option nodefault
%option noyywrap
%option c++
%option yyclass="Scanner"
%option prefix="LexTrabParser_"

KEYWORD "if"|"else"|"int"|"float"|"void"|"return"
HEADER "#include "["<]([^">]+)*[">]

DIGIT [0-9]
ID [a-zA-Z][a-zA-Z0-9]*
BLANK_SPACE[\\n| ]

%%

{HEADER} { printf("[header_def, %s]\n", yytext); }

{BLANK_SPACE}+ { printf(""); }

{KEYWORD} { printf("[reserved_word, %s]\n", yytext); }

{DIGIT}+ { printf("Numero inteiro encontrado: %s (%d)\n", yytext, atoi(yytext));}

{DIGIT}"."{DIGIT}* {printf("Numero float encontrado: %s (%f)\n", yytext, atof(yytext));}
if|then|begin|procedure|function {
printf("Palavra reservada encontrada: %s\n ", yytext);}

{ID} {printf("Identificador encontrado: %s\n", yytext);}

"+"|"-"|"*"|"/" {printf("Operador encontrado: %s\n", yytext);}

"{"[\^{}}\n]*"}"

[ \t\n]+

. printf("Caractere nao reconhecido: %s\n", yytext);

<<EOF>>     { return yyterminate(); }

%%