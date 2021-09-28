#include <iostream>
#include "scanner.hpp"
#include "parser.hpp"
#include "interpreter.hpp"

using namespace LexTrabParser;
using namespace std;

int main(int argc, char **argv) {
    Interpreter i;
    int res = i.parse();
    // cout << "Parse complete. Result = " << res << endl;
    
		return res;
}
