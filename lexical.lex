%{
	//#include "lexical.tab.h"
	#include <string.h>
	#include <stdlib.h>
	#include "reserved_words.h"
	void printToken(char* input, char* token);
	void printError(int line_number, int column_number, char* text);
	void analyzeWord(char *word);
	void analyzeSymbol(char *symbol);
	enum Tokens {
		IDENTIFIER = 0,
		INTEGER,
		REAL
	};
	char * token_names[] = {
		"identifier",
		"integer_number",
		"real_number"
	};
	int line_number = 1;
	int column_number = 1;
%}
%%
[ \t\r]*\{.*\}[ \t\r]*			{ column_number += strlen(yytext); }
[ \t\r]							{ column_number++; }
\n								{ line_number++; column_number = 0; }
[+\-*\/\(\)\[\]\.,;:=><]{1,2}	{ column_number += strlen(yytext); analyzeSymbol(yytext); }
[a-zA-Z][a-zA-Z0-9_]*			{ column_number += strlen(yytext); analyzeWord(yytext); }
[0-9]+\.[0-9]+					{ column_number += strlen(yytext); printToken(yytext, token_names[REAL]); }
[0-9]+							{ column_number += strlen(yytext); printToken(yytext, token_names[INTEGER]); }
.								{ printError(line_number, column_number, yytext); }
%%

int yywrap(){ return -1; };
void printToken(char* input, char* token){
	printf("<%s - %s>\n", input, token);
	return;
}

void printError(int line_number, int column_number, char* text){
	printf("Unrecognized token '%s' at line %d, column %d\n", text, line_number, column_number);
	return;
}

void analyzeWord(char *word){
	const RESERVED_WORD *rWord;
	rWord = in_word_set(word, strlen(word));
	// if the word is recognized as a reserved word, print its name
	// otherwise, it's an identifier
	if (rWord) {
		printToken(rWord->name, rWord->value);
	} else {
		printToken(word, token_names[IDENTIFIER]);
	}
}

void analyzeSymbol(char *symbol){
	const RESERVED_WORD *rWord;
	int sym_len = strlen(symbol);
	rWord = in_word_set(symbol, sym_len);
	// if the symbol is recognized as a reserved symbol, print its name
	if (rWord) {
		printToken(rWord->name, rWord->value);
	} else {
		// otherwise, if the symbol is composed of 2 characters, test for each one.
		if (sym_len == 2) {
			char sym[2] = "\0\0";

			sym[0] = symbol[0];
			analyzeSymbol(sym);

			yyless(1);
		} else {
			// if the symbol was not recognized as a reserved symbol, it was unexpected
			printError(line_number, column_number, symbol);
		}
	}
}

int main(int argc, char *argv[]){
	yylex();
	return EXIT_SUCCESS;
}
