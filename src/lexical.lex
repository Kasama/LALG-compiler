%{
	#include <string.h>
	#include <stdlib.h>
	#include "reserved_words.h"
	#define MAX_IDENTIFIER_LENGTH 127
	void printToken(char* input, char* token);
	void printError(char* token);
	int analyzeWord(char *word);
	int analyzeSymbol(char *symbol);
	int line_number = 1;
	int column_number = 1;
%}
%%
\{.*\}                           { column_number += strlen(yytext); } /* Comments */
[ \t\r]                          { column_number++; } /* Whitespace */
\n                               { line_number++; column_number = 0; } /* Line break */
[+\-*\/\(\)\[\]\.,;:=><]{1,2}    { column_number += strlen(yytext); return analyzeSymbol(yytext); } /* symbols */
[a-zA-Z][a-zA-Z0-9_]*            { column_number += strlen(yytext); return analyzeWord(yytext); } /* words */
[0-9]+\.[0-9]+                   { column_number += strlen(yytext); yylval.real = atof(yytext); return REAL; } /* real nums */
[0-9]+                           { column_number += strlen(yytext); yylval.integer = atoi(yytext); return INTEGER; } /* integers */
.                                { printError(yytext); } /* any thing else (error) */
%%

int yywrap(){ return -1; };

void printError(char* token){
	// print information about line and column where the unexpected token 'text' occured
	printf("Unrecognized token '%s' at line %d, column %d\n", token, line_number, column_number);
	return;
}

int analyzeWord(char *word){
	const RESERVED_WORD *rWord;
	int wordLen = strlen(word);
	rWord = in_word_set(word, wordLen);
	// if the word is recognized as a reserved word, print its name
	// otherwise, it's an identifier
	if (rWord) {
		// printToken(rWord->name, rWord->value);
		return rWord->value;
	} else {
		// check to see if the Identifier is longer than the maximum lenght
		if (wordLen > MAX_IDENTIFIER_LENGTH) {
			printf(
					"Error: Identifier '%s' at line %d, column %d is too long, max is %d characters\n",
					word, line_number, column_number, MAX_IDENTIFIER_LENGTH
				  );
		} else {
			// printToken(word, token_names[IDENTIFIER]);
			return IDENTIFIER;
		}
	}
}

int analyzeSymbol(char *symbol){
	const RESERVED_WORD *rWord;
	int sym_len = strlen(symbol);
	rWord = in_word_set(symbol, sym_len);
	// if the symbol is recognized as a reserved symbol, print its name
	if (rWord) {
		// printToken(rWord->name, rWord->value);
		return rWord->value;
	} else {
		// otherwise, if the symbol is composed of 2 characters,
		// test for the first and put the other one back to be read again.
		if (sym_len == 2) {
			char sym[2] = "\0\0";

			sym[0] = symbol[0];
			analyzeSymbol(sym);

			yyless(1);
		} else {
			// if the symbol was not recognized as a reserved symbol, it was unexpected
			printError(symbol);
		}
	}
}


/* void printToken(char* input, char* token){
	// Print token and its name in the format
	// < token_matched - token_name >
	printf("< %s - %s >\n", input, token);
	return;
} */

/* int main(int argc, char *argv[]){
	if (argc >= 2) {
		// If there are arguments consider each one a filename and parse every file
		for (int i = 1; i < argc; i++){
			char *filename = argv[i];
			// reopen STDIN so that yylex doesn't need to be modified
			FILE *file = freopen(filename, "r", stdin);
			if (file == NULL){
				fprintf(stderr, "Failed to open file '%s' for reading: Does file exist?\n", filename);
				continue;
			}
			fprintf(stderr, "Reading file: '%s'\n", filename);
			yylex();
			fflush(stdin);
			fprintf(stderr, "=========== Done with '%s' ===========\n", filename);
		}
	} else {
		// If there are no arguments, read from STDIN
		fprintf(stderr, "Reading from stdin:\n");
		yylex();
		fflush(stdin);
		fprintf(stderr, "=========== Done ===========\n");
	}
	return EXIT_SUCCESS;
} */

