%skeleton "lalr1.cc" /* -*- C++ -*- */
%require "3.0"
%defines
%define parser_class_name { Parser }

%define api.token.constructor
%define api.value.type variant
%define parse.assert
%define api.namespace { LexTrabParser }
%code requires
{
    #include <iostream>
    #include <string>
    #include <vector>
    #include <stdint.h>
    #include "command.hpp"

    using namespace std;

    namespace LexTrabParser {
        class Scanner;
        class Interpreter;
    }
}

%code top
{
    #include <iostream>
    #include "scanner.hpp"
    #include "parser.hpp"
    #include "interpreter.hpp"
    #include "location.hh"
    
    static LexTrabParser::Parser::symbol_type yylex(LexTrabParser::Scanner &scanner, LexTrabParser::Interpreter &driver) {
        return scanner.get_next_token();
    }
    
    using namespace LexTrabParser;
}

%lex-param { LexTrabParser::Scanner &scanner }
%lex-param { LexTrabParser::Interpreter &driver }
%parse-param { LexTrabParser::Scanner &scanner }
%parse-param { LexTrabParser::Interpreter &driver }
%locations
%define parse.trace
%define parse.error verbose

%define api.token.prefix {TOKEN_}

%token END 0 "end of file"
%token <std::string> STRING  "string";
%token <uint64_t> NUMBER "number";
%token LEFTPAR "leftpar";
%token RIGHTPAR "rightpar";
%token SEMICOLON "semicolon";
%token COMMA "comma";

// %type< LexTrabParser::Command > command;
// %type< std::vector<uint64_t> > arguments;

%start program

%%

program : {
	cout << "*** CLI do gerado pelo flex ***" << endl;
	cout << endl << "input> ";
  driver.clear();
};
    
%%

void LexTrabParser::Parser::error(const location &loc , const std::string &message) {
	cout << "Error: " << message << endl << "Error location: " << driver.location() << endl;
}
