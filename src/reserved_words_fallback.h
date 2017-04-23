/* ANSI-C code produced by gperf version 3.1 */
/* Command-line: /usr/bin/gperf -t  */
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
#define TOTAL_KEYWORDS 62
#define MIN_WORD_LENGTH 1
#define MAX_WORD_LENGTH 9
#define MIN_HASH_VALUE 1
#define MAX_HASH_VALUE 121
#ifdef __GNUC__
__inline
#else
#ifdef __cplusplus
inline
#endif
#endif
static unsigned int hash (register const char *str, register size_t len) { static const unsigned char asso_values[] = { 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 46,  41,  36,  60,  55,  50,  45,  40, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122,   5,  35, 25,  30,   0, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122,  30, 122,  20, 122, 122, 122,  55,   0,  25, 0,   0,  20,  45,  40,  45, 122, 122,  20,  10, 5,   0,  30, 122,  15,  30,  10,   0,   5,   0, 45,   5, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122, 122 }; return len + asso_values[(unsigned char)str[len - 1]] + asso_values[(unsigned char)str[0]]; }
const struct reserved_word * in_word_set (register const char *str, register size_t len) { static const struct reserved_word wordlist[] = { {""}, {">", "symbol_greater_than"}, {"do", "reserved_do"}, {"end", "reserved_end"}, {"else", "reserved_else"}, {"while", "reserved_while"}, {"downto", "reserved_downto"}, {"or_else", "reserved_or_else"}, {"div", "reserved_div"}, {"otherwise", "reserved_otherwise"}, {"begin", "reserved_begin"}, {":", "symbol_colon"}, {"to", "reserved_to"}, {"mod", "reserved_mod"}, {"type", "reserved_type"}, {""}, {"object", "reserved_object"}, {"or", "reserved_or"}, {"not", "reserved_not"}, {"then", "reserved_then"}, {""}, {"record", "reserved_record"}, {"of", "reserved_of"}, {"var", "reserved_var"}, {"file", "reserved_file"}, {"until", "reserved_until"}, {""}, {"<>", "symbol_different"}, {"nil", "reserved_nil"}, {"case", "reserved_case"}, {""}, {"repeat", "reserved_repeat"}, {">=", "symbol_greater_than_eq"}, {"function", "reserved_function"}, {"list", "reserved_list"}, {""}, {"packed", "reserved_packed"}, {":=", "symbol_assign"}, {"for", "reserved_for"}, {"procedure", "reserved_procedure"}, {"const", "reserved_const"}, {"]", "symbol_sbracked_close"}, {""}, {"set", "reserved_set"}, {"with", "reserved_with"}, {"label", "reserved_label"}, {""}, {"program", "reserved_program"}, {"shr", "reserved_shr"}, {"goto", "reserved_goto"}, {""}, {"<", "symbol_less_than"}, {"in", "reserved_in"}, {"shl", "reserved_shl"}, {""}, {""}, {""}, {"<=", "symbol_less_than_eq"}, {"and", "reserved_and"}, {""}, {"class", "reserved_class"}, {"[", "symbol_sbracked_open"}, {""}, {"xor", "reserved_xor"}, {""}, {"array", "reserved_array"}, {""}, {"if", "reserved_if"}, {"and_then", "reserved_and_then"}, {""}, {""}, {";", "symbol_semicolon"}, {""}, {"*", "symbol_times"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"/", "symbol_div"}, {""}, {")", "symbol_parens_close"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {".", "symbol_period"}, {""}, {"(", "symbol_parens_open"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"-", "symbol_minus"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {",", "symbol_comma"}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {"+", "symbol_plus"} }; if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH) { register unsigned int key = hash (str, len); if (key <= MAX_HASH_VALUE) { register const char *s = wordlist[key].name; if (*str == *s && !strcmp (str + 1, s + 1)) return &wordlist[key]; } } return 0; }
