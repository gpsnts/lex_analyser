#ifndef __COMMAND_HPP__
#define __COMMAND_HPP__

#include <string>
#include <vector>
#include <stdint.h>

namespace LexTrabParser
{
class Command
{
public:
	Command(const std::string &name, const std::vector<uint64_t> arguments);
	Command(const std::string &name);
	Command();
	~Command();

	std::string str() const;
	std::string name() const;

private:
	std::string m_name;
	std::vector<uint64_t> m_args;
};
}

#endif // ! __COMMAND_HPP__