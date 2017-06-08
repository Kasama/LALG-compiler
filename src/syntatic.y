%code {
    #include <stdlib.h>
    #include <stdio.h>
    int yylex();
    void yyerror(char *s);
    extern char* yytext;
    extern int line_number;
    extern int column_number;
}

%union {
    int integer;
    double real;
}

%token IDENTIFIER
%token INTEGER
%token REAL

/* Reserved Keywords { */
%token RESERVED_AND
%token RESERVED_AND_THEN
%token RESERVED_ARRAY
%token RESERVED_BEGIN
%token RESERVED_CASE
%token RESERVED_CLASS
%token RESERVED_CONST
%token RESERVED_DIV
%token RESERVED_DO
%token RESERVED_DOWNTO
%token RESERVED_ELSE
%token RESERVED_END
%token RESERVED_FILE
%token RESERVED_FOR
%token RESERVED_FUNCTION
%token RESERVED_GOTO
%token RESERVED_IF
%token RESERVED_IN
%token RESERVED_LABEL
%token RESERVED_LIST
%token RESERVED_MOD
%token RESERVED_NIL
%token RESERVED_NOT
%token RESERVED_OBJECT
%token RESERVED_OF
%token RESERVED_OR
%token RESERVED_OR_ELSE
%token RESERVED_OTHERWISE
%token RESERVED_PACKED
%token RESERVED_PROCEDURE
%token RESERVED_PROGRAM
%token RESERVED_RECORD
%token RESERVED_REPEAT
%token RESERVED_SET
%token RESERVED_SHL
%token RESERVED_SHR
%token RESERVED_THEN
%token RESERVED_TO
%token RESERVED_TYPE
%token RESERVED_UNTIL
%token RESERVED_VAR
%token RESERVED_WHILE
%token RESERVED_WITH
%token RESERVED_XOR
%token RESERVED_TYPE_INTEGER
%token RESERVED_TYPE_REAL
%token RESERVED_READ
%token RESERVED_WRITE
%token SYMBOL_EQ
%token SYMBOL_LESS_THAN_EQ
%token SYMBOL_GREATER_THAN_EQ
%token SYMBOL_DIFFERENT
%token SYMBOL_ASSIGN
%token SYMBOL_PLUS
%token SYMBOL_MINUS
%token SYMBOL_TIMES
%token SYMBOL_DIV
%token SYMBOL_COLON
%token SYMBOL_SEMICOLON
%token SYMBOL_PERIOD
%token SYMBOL_COMMA
%token SYMBOL_SBRACKED_OPEN
%token SYMBOL_SBRACKED_CLOSE
%token SYMBOL_PARENS_OPEN
%token SYMBOL_PARENS_CLOSE
%token SYMBOL_GREATER_THAN
%token SYMBOL_LESS_THAN
/* } */

%precedence NO_ELSE
%precedence RESERVED_ELSE

%%

program: RESERVED_PROGRAM IDENTIFIER SYMBOL_SEMICOLON body SYMBOL_PERIOD { printf("got program\n"); }
       | error
       ;

body: dc RESERVED_BEGIN commands RESERVED_END { printf("got body\n"); }
    ;

dc: dc_c dc_v dc_p { printf("got dc\n"); }
  ;

dc_c: %empty { printf("dc_c -> lambda\n"); }
    | RESERVED_CONST IDENTIFIER SYMBOL_ASSIGN number SYMBOL_SEMICOLON dc_c { printf("got dc_c\n"); }
    ;

dc_v: %empty
    | RESERVED_VAR variables SYMBOL_COLON var_types SYMBOL_SEMICOLON dc_v { printf("got dc_v\n"); }
    ;

dc_p: %empty
    | RESERVED_PROCEDURE IDENTIFIER parameters SYMBOL_SEMICOLON body_p dc_p { printf("got dc_p\n"); }
    ;

var_types: RESERVED_TYPE_REAL { printf("got reserved real\n"); }
         | RESERVED_TYPE_INTEGER { printf("got reserved integer\n"); }
         ;

variables: IDENTIFIER more_vars { printf("got variables\n"); }
         ;

more_vars: %empty
         | SYMBOL_COMMA variables { printf("got more vars\n"); }
         ;

parameters: %empty
          | SYMBOL_PARENS_OPEN par_list SYMBOL_PARENS_CLOSE { printf("got parameters\n"); }
          ;

par_list: variables SYMBOL_COLON var_types more_pars
        ;

more_pars: %empty
         | SYMBOL_SEMICOLON par_list
         ;

body_p: dc_loc RESERVED_BEGIN commands RESERVED_END SYMBOL_SEMICOLON
      ;

dc_loc: dc_v
      ;

arg_list: %empty
        | SYMBOL_PARENS_OPEN arguments SYMBOL_PARENS_CLOSE
        ;

arguments: IDENTIFIER more_ident
         ;

more_ident: %empty
          | SYMBOL_SEMICOLON arguments
          ;

p_false: %empty %prec NO_ELSE
       | RESERVED_ELSE command
       ;

commands: %empty
        | command SYMBOL_SEMICOLON commands
        ;

command: RESERVED_READ SYMBOL_PARENS_OPEN variables SYMBOL_PARENS_CLOSE { printf("got read\n"); }
       | RESERVED_WRITE SYMBOL_PARENS_OPEN variables SYMBOL_PARENS_CLOSE
       | RESERVED_WHILE SYMBOL_PARENS_OPEN condition SYMBOL_PARENS_CLOSE RESERVED_DO command
       | RESERVED_FOR IDENTIFIER SYMBOL_ASSIGN expression RESERVED_TO expression RESERVED_DO command
       | RESERVED_IF condition RESERVED_THEN command p_false
       | IDENTIFIER SYMBOL_ASSIGN expression
       | IDENTIFIER arg_list
       | RESERVED_BEGIN commands RESERVED_END
       ;

condition: expression relation expression
         ;

relation: SYMBOL_EQ
        | SYMBOL_DIFFERENT
        | SYMBOL_GREATER_THAN_EQ
        | SYMBOL_LESS_THAN_EQ
        | SYMBOL_GREATER_THAN
        | SYMBOL_LESS_THAN
        ;

expression: term other_terms
          ;

op_un: %empty
     | SYMBOL_PLUS
     | SYMBOL_MINUS
     ;

other_terms: %empty
           | op_ad term other_terms
           ;

op_ad: SYMBOL_PLUS
     | SYMBOL_MINUS
     ;

term: op_un factor more_fators
    ;

more_fators: %empty
           | op_mul factor more_fators
           ;

op_mul: SYMBOL_TIMES
      | SYMBOL_DIV
      ;

factor: IDENTIFIER
      | number
      | SYMBOL_PARENS_OPEN expression SYMBOL_PARENS_CLOSE
      ;

number: INTEGER
      | REAL
      ;

%%

void yyerror(char *s){
    fprintf(stderr, "%s near '%s' in line %d, column %d\n", s, yytext, line_number, column_number);
    return;
}

int main(int argc, char *argv[]){
    yyparse();
    return 0;
}
