%code {
    #include <stdlib.h>
    #include <stdio.h>
    int yylex();
    void yyerror(char *s);
    extern char* yytext;
    extern int line_number;
    extern int column_number;
    int errorcount = 0;
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
%token END_OF_FILE
/* } */

%precedence NO_ELSE
%precedence RESERVED_ELSE

%%

program: RESERVED_PROGRAM IDENTIFIER SYMBOL_SEMICOLON body SYMBOL_PERIOD //{ printf("got program\n"); }
        | RESERVED_PROGRAM IDENTIFIER SYMBOL_SEMICOLON body error {printf("Missing . in program\n"); yyerrok;}
        | error {printf("Missing identifier or ; in program\n");} body SYMBOL_PERIOD {yyerrok;}
        ;

body: dc RESERVED_BEGIN commands RESERVED_END //{ printf("got body\n"); }
    //| error SYMBOL_SEMICOLON {printf("problem with body\n"); yyerrok; }
    ;

dc: dc_c dc_v dc_p //{ printf("got dc\n"); }
  | error dc_v dc_p SYMBOL_SEMICOLON {printf("Constant declaration error.\n"); yyerrok; }
  | dc_c error dc_p SYMBOL_SEMICOLON {printf("Variable declaration error.\n"); yyerrok; }
  | dc_c dc_v error SYMBOL_SEMICOLON {printf("Procedure declaration error.\n"); yyerrok; }
  ;

dc_c: %empty
    | RESERVED_CONST IDENTIFIER SYMBOL_ASSIGN number SYMBOL_SEMICOLON dc_c //{ printf("got dc_c\n"); }
    | RESERVED_CONST IDENTIFIER error number SYMBOL_SEMICOLON {printf("Missing := in Constant declaration\n");} dc_c {yyerrok; }
    | RESERVED_CONST IDENTIFIER SYMBOL_ASSIGN number error {printf("Missing ; in Variable declaration\n");} dc_c {yyerrok; }
    | error IDENTIFIER SYMBOL_ASSIGN number SYMBOL_SEMICOLON {printf("Missing 'const' Variable declaration error\n");} dc_c {yyerrok; }
    | error SYMBOL_SEMICOLON dc_c {printf("Unknown Constant declaration error.\n"); yyerrok; } dc_c
    ;

dc_v: %empty
    | RESERVED_VAR variables SYMBOL_COLON var_types SYMBOL_SEMICOLON dc_v //{ printf("got dc_v\n"); }
    | RESERVED_VAR variables error var_types SYMBOL_SEMICOLON {printf("Missing , in Variable declaration\n");} dc_v {yyerrok; }
    | RESERVED_VAR variables SYMBOL_COLON var_types error {printf("Missing ; in Variable declaration\n");} dc_v {yyerrok; }
    | error variables SYMBOL_COLON var_types SYMBOL_SEMICOLON {printf("Missing 'var' Variable declaration error\n");} dc_v {yyerrok; }
    | error SYMBOL_SEMICOLON {printf("Unknown Variable declaration error.\n");} dc_v {yyerrok; }
    ;

dc_p: %empty
    | RESERVED_PROCEDURE IDENTIFIER parameters SYMBOL_SEMICOLON body_p dc_p //{ printf("got dc_p\n"); }
    | RESERVED_PROCEDURE IDENTIFIER parameters error {printf("Missing ; in Procedure declaration\n");} body_p dc_p {yyerrok; }
    | RESERVED_PROCEDURE IDENTIFIER error SYMBOL_SEMICOLON {printf("Missing parameters in Procedure declaration\n");} body_p dc_p {yyerrok; }
    | RESERVED_PROCEDURE error parameters SYMBOL_SEMICOLON {printf("Missing identifier in Procedure declaration\n");} body_p dc_p {yyerrok; }
    | error IDENTIFIER parameters SYMBOL_SEMICOLON {printf("Missing 'procedure' in Procedure declaration\n");} body_p dc_p {yyerrok; }
    | error SYMBOL_SEMICOLON {printf("Unknown Procedure declaration error.\n");} body_p dc_p {yyerrok; }
    ;

var_types: RESERVED_TYPE_REAL //{ printf("got reserved real\n"); }
         | RESERVED_TYPE_INTEGER //{ printf("got reserved integer\n"); }
         //| error SYMBOL_SEMICOLON {printf("problem with var_types\n"); yyerrok; }
         ;

variables: IDENTIFIER more_vars //{ printf("got variables\n"); }
          //| error SYMBOL_SEMICOLON {printf("problem with variables\n"); yyerrok; }
         ;

more_vars: %empty
         | SYMBOL_COMMA variables //{ printf("got more vars\n"); }
         //| error SYMBOL_SEMICOLON {printf("problem with more vars\n"); yyerrok; }
         ;

parameters: %empty
          | SYMBOL_PARENS_OPEN par_list SYMBOL_PARENS_CLOSE //{ printf("got parameters\n"); }
          //| error SYMBOL_SEMICOLON {printf("problem with parameters\n"); yyerrok; }
          ;

par_list: variables SYMBOL_COLON var_types more_pars //{ printf("got par_list\n");}
        //| error SYMBOL_SEMICOLON {printf("problem with par_list\n"); yyerrok; }
        ;

more_pars: %empty
         | SYMBOL_SEMICOLON par_list //{printf("got more_pars\n");}
         //| error SYMBOL_SEMICOLON {printf("problem with more_pars\n"); yyerrok; }
         ;

body_p: dc_loc RESERVED_BEGIN commands RESERVED_END SYMBOL_SEMICOLON //{printf("got body_p\n");}
      //| error SYMBOL_SEMICOLON {printf("problem with body_p\n"); yyerrok; }
      ;

dc_loc: dc_v //{printf("got dc_loc\n");}
      //| error SYMBOL_SEMICOLON {printf("problem with dc_loc\n"); yyerrok; }
      ;

arg_list: %empty
        | SYMBOL_PARENS_OPEN arguments SYMBOL_PARENS_CLOSE //{printf("got arg_list\n");}
        //| error SYMBOL_SEMICOLON {printf("problem with arg_list\n"); yyerrok; }
        ;

arguments: IDENTIFIER more_ident //{printf("got arguments\n");}
          //| error SYMBOL_SEMICOLON {printf("problem with arguments / got fallacy\n"); yyerrok; }
         ;

more_ident: %empty
          | SYMBOL_SEMICOLON arguments //{printf("got more_ident\n");}
          //| error SYMBOL_SEMICOLON {printf("problem with more_ident\n"); yyerrok; }
          ;

p_false: %empty %prec NO_ELSE
       | RESERVED_ELSE command //{printf("got p_false\n");}
       //| error SYMBOL_SEMICOLON {printf("problem with p_false\n"); yyerrok; }
       ;

commands: %empty
        | command SYMBOL_SEMICOLON commands //{printf("got commands\n");}
        | error SYMBOL_SEMICOLON {printf("Malformed Command\n");} commands {yyerrok; } //Se falhar um commando, PANIC!
        ;

command: RESERVED_READ SYMBOL_PARENS_OPEN variables SYMBOL_PARENS_CLOSE //{printf("got read\n"); }
       | RESERVED_WRITE SYMBOL_PARENS_OPEN variables SYMBOL_PARENS_CLOSE //{printf("got write\n");}
       | RESERVED_WHILE SYMBOL_PARENS_OPEN condition SYMBOL_PARENS_CLOSE RESERVED_DO command //{printf("got while\n");}
       | RESERVED_FOR IDENTIFIER SYMBOL_ASSIGN expression RESERVED_TO expression RESERVED_DO command //{printf("got for\n");}
       | RESERVED_IF condition RESERVED_THEN command p_false //{printf("got if\n");}
       | IDENTIFIER SYMBOL_ASSIGN expression //{printf("got identifier symbol_assign\n");}
       | IDENTIFIER arg_list //{printf("got identifier arg_list\n");}
       | RESERVED_BEGIN commands RESERVED_END //{printf("got begin cmd end\n");}
       //| error SYMBOL_SEMICOLON {printf("problem with command\n"); yyerrok; }
       ;

condition: expression relation expression //{printf("got condition\n");}
          | expression error expression {printf("Condition relation error\n"); yyerrok; }
          | error relation expression {printf("Condition left-operand error\n"); yyerrok; }
          | expression relation error {printf("Condition right-operand error\n"); yyerrok; }
         ;

relation: SYMBOL_EQ //{printf("got symbol_eq\n");}
        | SYMBOL_DIFFERENT //{printf("got symbol_different\n");}
        | SYMBOL_GREATER_THAN_EQ //{printf("got symbol_greater_than_eq\n");}
        | SYMBOL_LESS_THAN_EQ //{printf("got symbol_less_than_eq\n");}
        | SYMBOL_GREATER_THAN //{printf("got symbol_greater_than\n");}
        | SYMBOL_LESS_THAN //{printf("got symbol_less_than\n");}
        //| error SYMBOL_SEMICOLON {printf("problem with relation\n"); yyerrok; }
        ;

expression: term other_terms
          //| error SYMBOL_SEMICOLON {printf("problem with expression\n"); yyerrok; }
          ;

op_un: %empty
     | SYMBOL_PLUS //{printf("got positive\n");}
     | SYMBOL_MINUS //{printf("got negative\n");}
     //| error SYMBOL_SEMICOLON {printf("problem with op_un\n"); yyerrok; }
     ;

other_terms: %empty
           | op_ad term other_terms
           //| error SYMBOL_SEMICOLON {printf("problem with other_terms\n"); yyerrok; }
           ;

op_ad: SYMBOL_PLUS //{printf("got symbol_plus\n");}
     | SYMBOL_MINUS //{printf("got symbol_minus\n");}
     //| error SYMBOL_SEMICOLON {printf("problem with op_ad\n"); yyerrok; }
     ;

term: op_un factor more_fators
    //| error SYMBOL_SEMICOLON {printf("problem with term\n"); yyerrok; }
    ;

more_fators: %empty
           | op_mul factor more_fators
           //| error SYMBOL_SEMICOLON {printf("problem with more_factors\n"); yyerrok; }
           ;

op_mul: SYMBOL_TIMES //{printf("got got symbol_times\n");}
      | SYMBOL_DIV //{printf("got symbol_div\n");}
      ;

factor: IDENTIFIER //{printf("got factor identifier\n");}
      | number //{printf("got factor number\n");}
      | SYMBOL_PARENS_OPEN expression SYMBOL_PARENS_CLOSE //{printf("got factor SYMBOL_PARENS_OPEN expression SYMBOL_PARENS_CLOSE\n");}
      //| error {printf("Missing factor.\n"); yyerrok; }
      ;

number: INTEGER //{printf("got number integer\n");}
      | REAL //{printf("got number float\n");}
      ;

%%

void yyerror(char *s){
    fprintf(stderr, "%s near '%s' in line %d, column %d: ", s, yytext, line_number, column_number);
    errorcount++;
    return;
}

int main(int argc, char *argv[]){
    yyparse();
    if( errorcount == 0 ) printf("Successfully compiled!\n");
    else printf("Failed! Got %d errors!\n", errorcount);
    return 0;
}
