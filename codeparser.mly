/* Definition of header */
%{

(* Get more information for lexing, such as the locations of matched keywords.
The data structure provided by default to track the location of recognised tokens. 
   type Lexing.position = {
     pos_fname : string;
     pos_lnum : int;     
     pos_bol : int;
     pos_cnum : int;
   }
*)

open Lexing

(* Called by the parser function on error *)
let parse_error s = 
    print_endline s;
    flush stdout
%}


/* Declare some constant strings */ 
%token HEADER   
%token TRAILER
%token EOF                      /* End of File */

/* Declare some string construction functions for the *.lst Lexer  */
%token <string> LINE_NUM        /* Line number of the C statement */
%token <string> ADDRESS         /* Memory address of the Assembly code */
%token <string> INDEX           /* Absolute index of the Assembly code */

/* A line of code, including C and Assembly. Or some random line.  */
%token <string> CODE_LINE      

%token <string> C_COMMENT      

/* Declare the tokens for the 'decodecode' output file. */
%token CODE_SECTION_HEADER
%token ALL_CODE_HEADER
%token POST_TRAP_HEADER

%token <string> TRAP_INDEX_MARKER
%token <string> CODE_INDEX      /* Absolute index of the Assembly code */
%token <string> TRAP_CODE       /* Trapping code in the 'Code' section */
%token <string> BYTE_CODE       /* A byte of machine code */


/* Declare the tokens for the Assembly code. */
%token BAD
%token COMMA
%token COLON
%token SHARP
%token ASTERISK
%token TRAP_MARK                /* <-- trapping instruction */
%token LEFT_BRACKET
%token RIGHT_BRACKET
%token DISASSEMBLER_ERROR
%token <string> REP_PREFIX
%token <string> LOCK_PREFIX
%token <string> DATA_PREFIX     /*  data32 data32 data32 */ 
%token <string> REX_PREFIX
%token <string> OPCODE
%token <string> DIRECTIVE
%token <string> HEX
%token <string> NUM
%token <string> FUNC_NAME
%token <string> FUNC_OFFSET
%token <string> REGISTER
%token <string> CONSTANT


%token <string> REG_TYPE 


/* The entry points */ 
/* Entry point for the *.lst files */ 
%start lst_file

/*   c_asm_map_list:   <c_stmt_list, asm_istr_list> list
     c_stmt_list:      <line_num, c_code_line> list
     asm_istr_list:    <address, index, asm_code_line> list
 */
%type <( (string * string) list * (string * string * string) list ) list> lst_file


/* Entry point for the 'decodecode' output file */ 
%start decodecode_output

/*   asm_code:   <"asm_code", [code_before_trap, trap, code_after_trap]> 
     code_before_trap:  <"code_before_trap", [index, byte_code_str, code_line]>
     code_after_trap:   <"code_after_trap",  [index, byte_code_str, code_line]>
     Note: the trap code is included in code_after_trap
 */
%type <(string * (string * string * string) list) list> decodecode_output


/* Entry point for a single Assembly statement with optional prefix and postfix. 
   asm_statement  : asm_prefix asm_instruction asm_postfix EOF
   asm_instruction: opcode operand_list   */  
%start asm_statement
%type <string * (string * (string) list) list> asm_statement


/* A string parser for the registers */
%start register 
%type <string> register 


%%
lst_file:
  /* Always add the EOF rule for the entry points */
  | EOF                                  { [] }

  /* Absorb some irrelevant gdb printing information both at head and tail. */
  | CODE_LINE lst_file                   { $2 }

  /* The main body of the *.lst file. */
  | HEADER c_asm_map_list TRAILER        { $2 } 
;


c_asm_map_list:
  /* Empty, the bottom rule  */
  |                        { [] } 

  /* c_asm_map_list:   <c_stmt_list, asm_istr_list>  */
  | c_stmt_list asm_istr_list c_asm_map_list      { ($1, $2)::$3 }
;


c_stmt_list:
  /* Empty, the bottom rule  */
  |                        { [] } 
  
  /* skip the comment in the program */
  | LINE_NUM C_COMMENT c_stmt_list    { $3 }

  /* there are some empty C code lines  */
  | LINE_NUM c_stmt_list    { ($1, "")::$2 }
  
  /* c_stmt_list:   <line_num, code_list>  */
  | LINE_NUM CODE_LINE c_stmt_list    { ($1, $2)::$3 }
;


asm_istr_list:
  /* Empty, the bottom rule  */
  |                        { [] } 

  /* asm_istr_list:    <address, index, asm_code_line> list */
  | ADDRESS INDEX CODE_LINE asm_istr_list    { ($1, $2, $3)::$4 }
  
  /* skip the line with <index>. e.g. nopl */
  | ADDRESS CODE_LINE asm_istr_list          { $3 }
;


/* The following grammar rules are used to parse the 'decodecode' output. */
decodecode_output: 
  /* Always add the EOF rule for the entry points */
  | EOF                              { [] }
 
  /* Absorb some irrelevant information both at head and tail. */
  | CODE_LINE decodecode_output      { $2 }

  /* The pure machine code section of the output */
  | code_section decodecode_output   { ("asm_code", [$1])::$2 } 

  /* The disassembled code section */
  | ALL_CODE_HEADER CODE_LINE asm_code_list decodecode_output
                                     { ("code_before_trap", $3)::$4 }
  
  | TRAP_INDEX_MARKER byte_code_string CODE_LINE 
          asm_code_list decodecode_output
                        { ("code_after_trap", ($1, $2, $3)::$4)::$5 } 

  /* Skip the following lines */
  | POST_TRAP_HEADER CODE_LINE asm_code_list   
                                     { [] } 
;


/* The parsing result <code_before_trap, trap_code, code_after_trap> */
code_section:
  | CODE_SECTION_HEADER byte_code_string TRAP_CODE byte_code_string 
                                         { ($2, $3, $4) }
;


/* e.g. 3b:  5b   pop %ebx */
asm_code_list: 
  /* Empty, the bottom rule  */
  |                                      { [] } 
  /* e.g.  e: 00 00 */
  | CODE_INDEX byte_code_string asm_code_list 
                                         { ($1, $2, "")::$3 } 
  /* e.g. 10: 49 8b 50 08  mov 0x8(%r8),%rdx */
  | CODE_INDEX byte_code_string CODE_LINE asm_code_list 
                                         { ($1, $2, $3)::$4 } 
;


byte_code_string:
  /* Empty, the bottom rule  */
  |                                      { "" } 

  | BYTE_CODE byte_code_string           { $1 ^ $2 }
;


register: 
  | REG_TYPE                             { $1 }
;


/* A statement wrapping an asm instruction with prefix and postfix. */
asm_statement:
  /* data16 */
  | DATA_PREFIX EOF                      { ("DATA_PREFIX", []) }
  
  /* rex.B */ 
  | REX_PREFIX EOF                       { ("REX_PREFIX", []) }
  
  /* a snippet has a 'lock' opcode 'f0' appearing at the end */
  /* TODO: group these 3 cases together. */
  | LOCK_PREFIX EOF                      { ("LOCK_PREFIX", []) }

  | asm_instruction EOF                  { $1 }
  
  | asm_prefix asm_instruction EOF       { $2 }
  
  | asm_prefix asm_instruction asm_postfix EOF       
                                         { $2 }
  | asm_instruction asm_postfix EOF      { $1 }
;


/* %type <string> asm_prefix */
asm_prefix: 
  /* data32 data32 data32 xchg %ax,%ax  OR  addr32 icebp */
  | DATA_PREFIX                          { $1 }
  
  /* lock andb $0xfb,0x2(%rbx) */ 
  | LOCK_PREFIX                          { $1 }
  
  /* rex.R fdivrs -0x3ebaedb8(%rax) */ 
  | REX_PREFIX                           { $1 }

  /* rep stos %al,%es:(%rdi) */ 
  | REP_PREFIX                           { $1 }
;


/* %type <string> asm_postfix */
asm_postfix: 
  /* ljmpq  *<internal disassembler error> */ 
  | DISASSEMBLER_ERROR                   { ("DISASSEMBLER_ERROR", []) }

  /* # 0xffffffff */
  | SHARP HEX                            { ("POST_HEX", [$2]) }
  
  /* <filesystems_proc_show+10> */
  | FUNC_NAME FUNC_OFFSET                { ("POST_FUNC_OFFSET", $1::[$2]) }
  
  /* testb $0x2,0x0(%rip) #  0x22d <evo_wait+194> */
  | SHARP HEX FUNC_NAME FUNC_OFFSET      { ("POST_HEX_FUNC_OFFSET", $2::$3::[$4]) }

  /* <pad_len_spaces> */
  | FUNC_NAME                            { ("POST_FUNC", [$1]) }
  
  /* mov 0x10(%rdx),%r11d  <-- trapping instruction */
  | TRAP_MARK                            { ("TRAP", []) }
  
;


/* %type <string * (string * (string) list) list> asm_instruction 
   asm_instruction: opcode operand_list
   Note: still need to put EOF, even though we use Lexing.from_string
*/
asm_instruction: 
  /* a broken disassembled instruction. */
  | BAD                                  { ("BAD", []) }
  /* e.g.  (bad)  -0x77(%rdx,%rdx,1) */
  | BAD asm_operand                      { ("BAD", []) }
  
  | OPCODE asm_operand_list              { ($1, $2) }
  
  /*  .byte 0xf7  */
  | DIRECTIVE HEX                        { ($1, []) } 
;


/* %type <(string * (string) list) list> asm_operand_list */
asm_operand_list: 
  |                                      { [] }
  | asm_operand                          { [$1] }
  
  /* e.g. call *%edx,  callq *0x8(%rdi) */
  | ASTERISK asm_operand                 { [$2] }
  
  | asm_operand COMMA asm_operand_list   { $1::$3 }
;


/* %type <string * (string) list> asm_operand. 
   (addr_mode, [para_list])
 */
asm_operand: 
  /* e.g. 0x30 */
  | HEX                                  { ("HEX", [$1]) }
  
  /* e.g. %eax, %rax */
  | REGISTER                             { ("REGISTER", [$1]) }
   
  /* e.g. mov %gs:0x0,%r13 */ 
  | REGISTER COLON HEX                   { ("BASE_HEX"), $3::[$1] }
   
  /* e.g. outsl  %ds:(%rsi),(%dx) */ 
  | REGISTER COLON LEFT_BRACKET REGISTER RIGHT_BRACKET
                                         { ("BASE_REGISTER"), $1::[$4] }
  /* e.g. incl %gs:0x14(%rax) */ 
  | REGISTER COLON HEX LEFT_BRACKET REGISTER RIGHT_BRACKET
                                         { ("BASE_REGISTER_OFFSET"), $3::$1::[$5] }

  /* e.g. $0x20 */
  | CONSTANT                             { ("CONSTANT", [$1]) }
   
  /* fucomip %st(0),%st */ 
  | REGISTER LEFT_BRACKET NUM RIGHT_BRACKET  
                                         { ("FLAG_REGISTER", $3::[$1]) } 
  
  /* e.g. (%eax) == 0x0(%eax) */
  | LEFT_BRACKET REGISTER RIGHT_BRACKET  { ("IN_REGISTER", "0x0"::[$2]) }
  
  /* e.g. 0x4(%ebx) */
  | HEX LEFT_BRACKET REGISTER RIGHT_BRACKET  
                                         { ("IN_REGISTER", $1::[$3]) }
  
  /* e.g. mov 0xa0(%ebx,%eax,4),%ecx */
  | HEX LEFT_BRACKET REGISTER COMMA REGISTER COMMA NUM RIGHT_BRACKET  
                                         { ("BASE_INDEX", $1::$3::$5::[$7]) }
  
  /* e.g. movl $0x20000000,(%rdx,%rax,4) */
  | LEFT_BRACKET REGISTER COMMA REGISTER COMMA NUM RIGHT_BRACKET  
                                         { ("BASE_INDEX", "0x0"::$2::$4::[$6]) }
   
  /* jmpq   *0x0(,%rax,8) */
  | HEX LEFT_BRACKET COMMA REGISTER COMMA NUM RIGHT_BRACKET  
                                         { ("BASE_INDEX", $1::"0x0"::$4::[$6]) }
  
  /* lea %ds:0x0(%rsi,%riz,1),%esi */
  | REGISTER COLON HEX LEFT_BRACKET REGISTER COMMA REGISTER COMMA NUM RIGHT_BRACKET  
                                         { ("REGISTER_BASE_INDEX", $3::$9::$1::$5::[$7]) }
;


/* The trailer of the parser. */
%% 













