all:
	flex -o scanner.cpp scanner.l
	bison -o parser.cpp parser.y