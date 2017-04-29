/* ANSI-C code produced by gperf version 3.1 */
/* Command-line: /usr/bin/gperf  */
/* Computed positions: -k'1,$' */
/* ============================================================
 * ===                      !WARNING!                       ===
 * ============================================================
 * ===                                                      ===
 * === This file is a PRE-COMPILED version that should not  ===
 * === be used!                                             ===
 * === The only reason it exists is for cases such that the ===
 * === system compiling the source does not have the gperf  ===
 * === program. It's highly recommended that you install    ===
 * === gperf instead and rebuild!                           ===
 * ===                                                      ===
 * ==========================================================*/
typedef struct reserved_word { char *name; char *value; } RESERVED_WORD; struct reserved_word; 
#define TOTAL_KEYWORDS 64
#define MIN_WORD_LENGTH 1
#define MAX_WORD_LENGTH 9
#define MIN_HASH_VALUE 1
#define MAX_HASH_VALUE 161
#ifdef __GNUC__
__inline
#else
#ifdef __cplusplus
inline
#endif
#endif
static unsigned int hash (register const char *str, register size_t len) { static const unsigned char asso_values[] = { 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 80,  75,  70,  65,  60,  55,  50,  45, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162,   5,  35, 40,  45,   0, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162,  30, 162,  25, 162, 162, 162,  60,   0,  35, 0,   0,  30,  50,  45,   5, 162, 162,   5,  30, 15,   0,  35, 162,  15,   0,  10,   0,  40,   0, 20,   0, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162, 162 }; return len + asso_values[(unsigned char)str[len - 1]] + asso_values[(unsigned char)str[0]]; }
const struct reserved_word * in_word_set (register const char *str, register size_t len) { static const struct reserved_word wordlist[] = { {""}, {">", "symbol_greater_than"}, {"do", "reserved_do"}, {"end", "reserved_end"}, {"else", "reserved_else"}, {"while", "reserved_while"}, {"downto", "reserved_downto"}, {"or_else", "reserved_or_else"}, {"shl", "reserved_shl"}, {"otherwise", "reserved_otherwise"}, {"until", "reserved_until"}, {":", "symbol_colon"}, {"to", "reserved_to"}, {"set", "reserved_set"}, {"type", "reserved_type"}, {"label", "reserved_label"}, {"object", "reserved_object"}, {"or", "reserved_or"}, {"shr", "reserved_shr"}, {"list", "reserved_list"}, {"begin", "reserved_begin"}, {"record", "reserved_record"}, {"in", "reserved_in"}, {"nil", "reserved_nil"}, {"real", "reserved_type_real"}, {""}, {""}, {"integer", "reserved_type_integer"}, {"not", "reserved_not"}, {"then", "reserved_then"}, {""}, {"repeat", "reserved_repeat"}, {"of", "reserved_of"}, {"mod", "reserved_mod"}, {"file", "reserved_file"}, {""}, {""}, {"if", "reserved_if"}, {"xor", "reserved_xor"}, {"case", "reserved_case"}, {"class", "reserved_class"}, {"packed", "reserved_packed"}, {"<>", "symbol_different"}, {"div", "reserved_div"}, {"procedure", "reserved_procedure"}, {""}, {""}, {">=", "symbol_greater_than_eq"}, {"for", "reserved_for"}, {"with", "reserved_with"}, {"const", "reserved_const"}, {"]", "symbol_sbracked_close"}, {":=", "symbol_assign"}, {"function", "reserved_function"}, {"goto", "reserved_goto"}, {""}, {""}, {""}, {"var", "reserved_var"}, {""}, {""}, {"[", "symbol_sbracked_open"}, {""}, {"and", "reserved_and"}, {""}, {"array", "reserved_array"}, {""}, {""}, {""}, {""}, {""}, {";", "symbol_semicolon"}, {"program", "reserved_program"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"<", "symbol_less_than"}, {""}, {"and_then", "reserved_and_then"}, {""}, {""}, {""}, {"<=", "symbol_less_than_eq"}, {""}, {""}, {""}, {"/", "symbol_div"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {".", "symbol_period"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"-", "symbol_minus"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {",", "symbol_comma"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"+", "symbol_plus"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"*", "symbol_times"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {")", "symbol_parens_close"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"(", "symbol_parens_open"} }; if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH) { register unsigned int key = hash (str, len); if (key <= MAX_HASH_VALUE) { register const char *s = wordlist[key].name; if (*str == *s && !strcmp (str + 1, s + 1)) return &wordlist[key]; } } return 0; }
