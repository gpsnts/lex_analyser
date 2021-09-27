#ifndef __SCANNER_HPP__
#define __SCANNER_HPP__

#if ! defined(yyFlexLexerOnce)

#undef yyFlexLexer
#define yyFlexLexer LexTrabParser_FlexLexer
#include <FlexLexer.h>

#endif

#undef YY_DECL
#define YY_DECL LexTrabParser::Parser::symbol_type LexTrabParser::Scanner::get_next_token()

#include "parser.hpp"

namespace LexTrabParser {
	class Interpreter; 
	
	class Scanner : public yyFlexLexer
	{
	public:
	  Scanner(Interpreter &driver) : m_driver(driver) {}
		virtual ~Scanner() {}
		virtual LexTrabParser::Parser::symbol_type get_next_token();
	
	private:
	    Interpreter &m_driver;
	};
}

#endif // !__SCANNER_HPP__