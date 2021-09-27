int main(int argc, char *argv[]){
	printf("\n--------------------------------Analisador (lex)------------------------------\n\n");

	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	return 0;
}