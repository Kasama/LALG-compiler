/* ANSI-C code produced by gperf version 3.1 */
/* Command-line: /usr/bin/gperf  */
/* Computed positions: -k'1-2,$' */
/* The character set is not based on ISO-646.  */
#include "syntatic.h"
typedef struct reserved_word { char *name; int value; } RESERVED_WORD; struct reserved_word;

#define TOTAL_KEYWORDS 67
#define MIN_WORD_LENGTH 1
#define MAX_WORD_LENGTH 9
#define MIN_HASH_VALUE 1
#define MAX_HASH_VALUE 151
/* maximum key range = 151, duplicates = 0 */

#ifdef __GNUC__
__inline
#else
#ifdef __cplusplus
inline
#endif
#endif
static unsigned int hash (register const char *str, register size_t len) { static const unsigned char asso_values[] = { 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 75,  70,  65,  60,  55,  50,  45,  40, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152,  10,  35, 0,  20,  15, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152,  30, 152,  25, 152, 152, 152,  20,  25,  35, 5,   5,  30,   0,  25,   5, 152, 152,  25,  60, 10,   0,   5, 152,   0,  30,  15,  30,  50,  25, 0,   0, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152 }; register unsigned int hval = len; 
  switch (hval)
    {
      default:
        hval += asso_values[(unsigned char)str[1]];
      /*FALLTHROUGH*/
      case 1:
        hval += asso_values[(unsigned char)str[0]];
        break;
    }
  return hval + asso_values[(unsigned char)str[len - 1]];
}

const struct reserved_word * in_word_set (register const char *str, register size_t len) { static const struct reserved_word wordlist[] = { {""}, {"<",SYMBOL_LESS_THAN}, {"or",RESERVED_OR}, {"xor",RESERVED_XOR}, {"goto",RESERVED_GOTO}, {""}, {""}, {"do",RESERVED_DO}, {""}, {""}, {""}, {"downto",RESERVED_DOWNTO}, {"or_else",RESERVED_OR_ELSE}, {""}, {"read",RESERVED_READ}, {""}, {"record",RESERVED_RECORD}, {"to",RESERVED_TO}, {""}, {"procedure",RESERVED_PROCEDURE}, {""}, {":",SYMBOL_COLON}, {"integer",RESERVED_TYPE_INTEGER}, {"end",RESERVED_END}, {"type",RESERVED_TYPE}, {"array",RESERVED_ARRAY}, {"repeat",RESERVED_REPEAT}, {"in",RESERVED_IN}, {"not",RESERVED_NOT}, {"otherwise",RESERVED_OTHERWISE}, {""}, {">",SYMBOL_GREATER_THAN}, {"<>",SYMBOL_DIFFERENT}, {"for",RESERVED_FOR}, {"real",RESERVED_TYPE_REAL}, {"write",RESERVED_WRITE}, {"packed",RESERVED_PACKED}, {""}, {"and",RESERVED_AND}, {"else",RESERVED_ELSE}, {""}, {"=",SYMBOL_EQ}, {"<=",SYMBOL_LESS_THAN_EQ}, {"nil",RESERVED_NIL}, {"file",RESERVED_FILE}, {"begin",RESERVED_BEGIN}, {"object",RESERVED_OBJECT}, {""}, {"and_then",RESERVED_AND_THEN}, {"list",RESERVED_LIST}, {""}, {"]",SYMBOL_SBRACKED_CLOSE}, {":=",SYMBOL_ASSIGN}, {"set",RESERVED_SET}, {"then",RESERVED_THEN}, {"const",RESERVED_CONST}, {""}, {">=",SYMBOL_GREATER_THAN_EQ}, {"shr",RESERVED_SHR}, {"with",RESERVED_WITH}, {"while",RESERVED_WHILE}, {"[",SYMBOL_SBRACKED_OPEN}, {"of",RESERVED_OF}, {"div",RESERVED_DIV}, {"case",RESERVED_CASE}, {""}, {""}, {"if",RESERVED_IF}, {"mod",RESERVED_MOD}, {""}, {"until",RESERVED_UNTIL}, {";",SYMBOL_SEMICOLON}, {"program",RESERVED_PROGRAM}, {"var",RESERVED_VAR}, {""}, {"label",RESERVED_LABEL}, {""}, {""}, {"function",RESERVED_FUNCTION}, {""}, {""}, {"/",SYMBOL_DIV}, {""}, {"shl",RESERVED_SHL}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {".",SYMBOL_PERIOD}, {""}, {""}, {""}, {"class",RESERVED_CLASS}, {""}, {""}, {""}, {""}, {""}, {"-",SYMBOL_MINUS}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {",",SYMBOL_COMMA}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"+",SYMBOL_PLUS}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"*",SYMBOL_TIMES}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {")",SYMBOL_PARENS_CLOSE}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"(",SYMBOL_PARENS_OPEN} };

  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH) { register unsigned int key = hash (str, len); if (key <= MAX_HASH_VALUE) { register const char *s = wordlist[key].name; if (*str == *s && !strcmp (str + 1, s + 1)) return &wordlist[key]; } } return 0; }
