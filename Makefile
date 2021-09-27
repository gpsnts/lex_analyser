all:
	flex -o scanner.cpp scanner.l;
	g++ scanner.cpp

clean:
	rm a.out scanner.cpp;