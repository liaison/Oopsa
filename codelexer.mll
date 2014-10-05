(* Lexer file, the lexing grammar to recognize the tokens in the *.lst files and Assemly code files. *)

{
open Codeparser    (* The type token is defined in codesparser.mli *)
}

(* The regular expression for any valid char to compose a string *)
let ANY_CHAR=[ 'A'-'Z' 'a'-'z' '0'-'9' '_' '-' '+' '=' '.' ';' ':' ',' '?' '!' '(' ')' '<' '>' '#' '$' '/' '[' ']' '{' '}' '\n' ' ' '\t' ]

rule lst_token = parse 
  (* Define some constant string patterns at first *)
  | "(gdb) Dump of assembler code for function " ([^ ' ' '\t' '\n'])+  
                                                { HEADER     } 
  | "End of assembler dump."                    { TRAILER    }
  | ['0'-'9']+ as k                             { LINE_NUM k }
  | ("0x" ['a'-'f' '0'-'9']+ as k) ':'?         { ADDRESS k  }
  | "<+" (['0'-'9']+ as k) ">:"                 { INDEX k    }  


  (* shift the character, and move on to the beginning of other rules *)
  | [ ' ' '\n' '\t' ]+  { lst_token lexbuf }

  | eof                 { EOF }
  
  (* The comment in C program *)
  | "/*"                { C_COMMENT (c_comment lexbuf) }

  (* The rest following the above tokens would be treated as code line.
     First of all, the 'code_line' token can match the real C or Assembly code.
     Second, it is also the bottom rule to absorb the irrevelant information. *)
  | (_ as x)            { CODE_LINE ((String.make 1 x) ^ (code_line lexbuf)) }

and c_comment = parse 
  (*  Reach the end of the comment *)
  | "*/"                { "" }
  
  (* Treat the following characters simly as a big line of string. *)
  | (_ as x)            { (String.make 1 x) ^ c_comment lexbuf }
  
and code_line = parse 
  (* The end of line. End of this rule as well.
      After this rule, it would and should return to the referring rule *)
  | ['\n']+             { "" }

  (* Treat the following characters simly as a big line of string. *)
  | (_ as x)            { (String.make 1 x) ^ code_line lexbuf }


(* The tokens for the Assembly code *)
and asm_token = parse 
  | ','                                         { COMMA } 
  | ':'                                         { COLON } 
  
  (* ljmpq  *<internal disassembler error> *) 
  | "*<internal disassembler error>"            { DISASSEMBLER_ERROR }
  
  | '*'                                         { ASTERISK } 
  
  | "(bad)"                                     { BAD }

  | '('                                         { LEFT_BRACKET }
  | ')'                                         { RIGHT_BRACKET }
  | ".byte" as k                                { DIRECTIVE k }
  | ('-'? "0x" ['a'-'f' '0'-'9']+) as k         { HEX k  }
  | '%' ['a'-'z' '0'-'9']+ as k                 { REGISTER k  }
  | "$0x" ['a'-'f' '0'-'9']+ as k               { CONSTANT k  }

  | '0' | ['1'-'9'] ['0'-'9']? as i             { NUM i }
  
  (*  testb  $0x2,0x0(%rip)  # 0x22d <evo_wait+194> *) 
  | '#'                                         { SHARP } 

  (* data32 data32 data32 xchg %ax,%ax *)
  | "data32 "+ | "data16" | "addr32"  as k      { DATA_PREFIX k } 
  
  (* lock andb $0xfb,0x2(%rbx) *) 
  | "lock" as k                                 { LOCK_PREFIX k }
  
  (* rex rex.B rex.RXB *) 
  | "rex" "."? ['R' 'X' 'B' 'W']* as k          { REX_PREFIX k }
  
  (* rep, repe, repne *) 
  | "rep" | "repe" | "repne" as k               { REP_PREFIX k }
  
  (* Conflict between the LOCK_PREFIX and OPCODE, 
     thus put the LOCK_PREFIX before the OPCODE. *) 
  | (['a'-'z'] ['a'-'z' '0'-'9']+ as i)         { OPCODE i }

  (* Skip the spaces *)
  | [ ' ' '\n' '\t' ]+                          { asm_token lexbuf }

  (* Mark the end of the instruction *)
  | eof                                         { EOF }
 
  (* e.g. <filesystems_proc_show+59>, <pad_len_spaces> *)
  | '<' (['a'-'z' 'A'-'Z' '0'-'9' '_']+ as f) '>'?     
                                                { FUNC_NAME f }
  | '+' (['0'-'9']+ as n) '>'                   { FUNC_OFFSET n }

  (* An indicator of the trapping instruction *)
  | "<-- trapping instruction"                  { TRAP_MARK }


and decodecode_token = parse

  | "Code:"                                     { CODE_SECTION_HEADER } 
  | "All code"                                  { ALL_CODE_HEADER } 
  | "Code starting with the faulting instruction" 
                                                { POST_TRAP_HEADER } 
  | (['a'-'f' '0'-'9']? ['a'-'f' '0'-'9'] as k) ':' 
                                                { CODE_INDEX k }

  (* Header to identify the trapping instruction. 
     e.g.  2b: f6 43 04 01   testb $0x1,0x4(%ebx) *)
  | (['a'-'f' '0'-'9']? ['a'-'f' '0'-'9'] as k) ":*" 
                                                { TRAP_INDEX_MARKER k }  

  | '<' (['a'-'f' '0'-'9'] ['a'-'f' '0'-'9'] as k) '>' 
                                                { TRAP_CODE k }

  (* A byte of machine code. 
     Note:  insist on the pending spaces, to distinguish with other tokens. *)
  | (['a'-'f' '0'-'9'] ['a'-'f' '0'-'9'] as k) [ ' ' '\n' '\t' ]    
                                                { BYTE_CODE k } 

  (* shift the character, and move on to the beginning of other rules *)
  | [ ' ' '\n' '\t' ]+  { decodecode_token lexbuf }

  | eof                 { EOF }
  
  (* The rest following the above tokens would be treated as code line.
     First of all, the 'code_line' token can match or Assembly code.
     Second, it is also the bottom rule to absorb the irrevelant information. *)
  | (_ as x)            { CODE_LINE ((String.make 1 x) ^ (code_line lexbuf)) }


and reg_token = parse 
  | '%'? (['r' 'e']? "ax" | 'a' ['l' 'h'])      { REG_TYPE "a"  }
  | '%'? (['r' 'e']? "bx" | 'b' ['l' 'h'])      { REG_TYPE "b"  }
  | '%'? (['r' 'e']? "cx" | 'c' ['l' 'h'])      { REG_TYPE "c"  }
  | '%'? (['r' 'e']? "dx" | 'd' ['l' 'h'])      { REG_TYPE "d"  }
  | '%'? (['r' 'e']? "si" | "sil")              { REG_TYPE "si" }
  | '%'? (['r' 'e']? "di" | "dil")              { REG_TYPE "di" }
  | '%'? (['r' 'e']? "bp" | "bpl")              { REG_TYPE "bp" }
  | '%'? (['r' 'e']? "sp" | "spl")              { REG_TYPE "sp" }
  | '%'? ('r' ['8' '9'] as t)  ['d' 'w' 'b']?   { REG_TYPE t    }
  | '%'? ("r1" ['0'-'5'] as t) ['d' 'w' 'b']?   { REG_TYPE t    }

  (*  a bottom case not to throw exception 
  | _                                           { REG_TYPE "unknown" }
   *)



