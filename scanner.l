%option noyywrap
%{
	#include <math.h>
	#include <stdio.h>

	#include <iostream>
	#include <cstdlib>
	#include "scanner.hpp"
	#include "interpreter.hpp"
	#include "parser.hpp"
	#include "location.hh"

	#define yyterminate() LexTrabParser::Parser::make_END(LexTrabParser::location());
	#define YY_USER_ACTION m_driver.increaseLocation(yyleng);

	using namespace std;
%}

%option nodefault
%option noyywrap
%option c++
%option yyclass="Scanner"
%option prefix="LexTrabParser_"

KEYWORD "if"|"else"|"int"|"float"|"void"|"return"|"printf"
HEADER "#include "["<]([^">]+)*[">]

ARITH_OP [\+\-*\/]
LOGICAL_OP (&&|\|\|)
RELATIONAL_OP (<[=]?|>[=]?|[!=]=)

ARRAY [a-z]([a-zA-Z0-9]*)\[\]
DIGIT [0-9]
ID [a-zA-Z][a-zA-Z0-9]*
IGNORED (\n|[ ]+)
LITERAL_STRING \".*\"

%%

"=" { printf("[equal, %s]\n", yytext); }

";" { printf("[semicolon, %s]\n", yytext); }

"," { printf("[comma, %s]\n", yytext); }

"(" { printf("[l_paren, %s]\n", yytext); }

")" { printf("[r_paren, %s]\n", yytext); }

"{" { printf("[l_key, %s]\n", yytext); }

"}" { printf("[r_key, %s]\n", yytext); }

{ARITH_OP} { printf("[Arith_Op, %s]\n", yytext); }

{LOGICAL_OP} { printf("[logic_op, %s]\n", yytext); }

{RELATIONAL_OP} { printf("[Relational_Op, %s]\n", yytext); }

{ARRAY} { printf("[array_id, %s]\n", yytext); }

{HEADER} { printf("[header_def, %s]\n", yytext); }

{KEYWORD} { printf("[reserved_word, %s]\n", yytext); }

{DIGIT}"."{DIGIT}* {printf("[num, %.1f]\n", atof(yytext));}

{DIGIT}+ { printf("[num, %d]\n", atoi(yytext)); }

{ID} {printf("[id, %s]\n", yytext);}

{LITERAL_STRING} { printf("[literal_string, %s]\n", yytext); }

"//".* { printf(""); }

"/*".*"*/" { printf(""); }

{IGNORED} { printf(""); }

. { printf("", yytext); }

%%