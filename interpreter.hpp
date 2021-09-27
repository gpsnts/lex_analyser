#ifndef __INTERPRETER_HPP__
#define __INTERPRETER_HPP__

#include <vector>

#include "scanner.hpp"
#include "parser.hpp"

namespace LexTrabParser
{
	class Command;

	class Interpreter
	{
	public:
		Interpreter();
		int parse();
		void clear();
		std::string str() const;

		void switchInputStream(std::istream *is);

		friend class Parser;
		friend class Scanner;

	private:
		void addCommand(const Command &cmd);
		void increaseLocation(unsigned int loc);
		unsigned int location() const;

	private:
		Scanner m_scanner;
		Parser m_parser;
		std::vector<Command> m_commands;
		unsigned int m_location;
	};
}

#endif // ! __INTERPRETER_HPP__
