(* 
   The parser for the *.lst, *.decodeoops files and the Assembly code 
   @author:  Lisong Guo <lisong.guo@inria.fr> 
   @date  :  28 Oct, 2013
 *)
open Xml


(* The unit size for the BLAST string sequence. *)
let encode_BLAST_UNIT_SIZE = 3;;
(* The switch for the debugging information *)
let is_DEBUG = true ;;

(* Encode the Assembly code into some DNA string sequence, 
   according to the format required by the BLAST tool.
   e.g. BLAST does not accept the letters O and J  *)
let encode_asm_schema_blast c =
    if c = "" then ""
    else 
    (* First split the code line into substring seperated by spaces *)
    let split_list = Str.split (Str.regexp "[ \t]+") c in 
    let istr_name  = List.nth split_list 0 in 
    match istr_name with 
    | "add" | "addl" -> "ADD"
    | "sub" | "sbb"  -> "SBB"
    | "inc" -> "INC"
    | "dec" | "decl" -> "DEC"
    | "call" | "callq" -> "CAL" 
    | "mov"  | "movl"  -> "MVV" 
    | "movabs" -> "MVB" 
    | "cmove" -> "CMV" 
    | "push" | "pushl" -> "PSH" 
    | "pop"  -> "PPP" 
    | "ret"  | "retq"  -> "RET" 
    | "jmp" | "jmpq" -> "MPP"
    | "ja" | "jae" -> "AAA"
    | "je" | "jne" -> "EEE"
    | "js" | "jns" -> "SSS"
    | "test" | "testb" | "testl" -> "TES" 
    | "lea" -> "LEA"
    | "cmp"  | "cmpb"  | "cmpl" | "cmpq" -> "CMP"

    | "xor" -> "RRR"
    | "and" -> "AND"
    
    | "shl" | "shld" -> "SHL" 
    | "shr" -> "SHR" 
    
    | "fdivrs" -> "FDI"
    | ".byte"  -> "BYT" 

    (* Unknown instructions *)
    | _ -> "XXX" 


(* Encode the instruction by its name *)
let encode_asm_schema_name c = 
    if c = "" then ""
    else 
    (* First split the code line into substring seperated by spaces *)
    let split_list = Str.split (Str.regexp "[ \t]+") c in 
    let istr_name  = List.nth split_list 0 in 
      istr_name


(* Encode the instruction simply based on its type *)
let encode_asm_schema_type c = 
    if c = "" then ""
    else 
    (* First split the code line into substring seperated by spaces *)
    let split_list = Str.split (Str.regexp "[ \t]+") c in 
    let istr_name  = List.nth split_list 0 in 
    match istr_name with 
    | "add" | "addb" | "addl" -> "ADD"
    | "adc" | "adcb" -> "ADC" 
    | "sub" | "sbb"  -> "SUB"
    | "inc" | "incl" -> "INC"
    | "dec" | "decl" -> "DEC"
    | "imul" -> "MUL" 

    | "call" | "callq" -> "CAL"

    | "mov"  | "movw" | "movl" | "movq" -> "MOV" 
    | "movabs" -> "MVB" 
    | "cmove"  -> "CMV" 

    (* TODO: need to refine *)
    | "movzbl" | "movsbl" -> "MOV" 
    | "movzwl" | "movswl" -> "MOV" 
    | "movzql" | "movsql" -> "MOV" 
   
    | "movslq" -> "MOV" 
    
    | "int3" -> "INT" 
    | "ud2" -> "UD2" 
    
    | "push" | "pushl" -> "PSH" 
    | "pop"  -> "POP" 
    | "ret"  | "retq"  -> "RET" 

    | "jmp" | "jmpq" -> "JMP"
    | "ja" | "jae" -> "JAE"
    | "jb" | "jbe" -> "JBE"
    | "je" | "jne" -> "JNE"
    | "jg" | "jge" -> "JGE"
    | "jl" | "jle" -> "JLE"
    | "js" | "jns" -> "JNS"

    | "test" | "testb" | "testl" -> "TES" 
    | "lea" -> "LEA"
    | "cmp"  | "cmpb" | "cmpl" | "cmpq" -> "CMP"

    | "xor" | "xorb" | "xorl" -> "XOR"
    | "and" | "andb" | "andl" -> "AND"
    | "not" -> "NOT"
    | "or"  | "orb"  | "orl"  -> "ORR" 
    | "neg" | "negb" | "negl" -> "NEG" 

    | "shl" | "shld" -> "SHL" 
    | "shr" -> "SHR" 
   
    | "sar" -> "SAR" 
    | "sal" -> "SAL" 
     
    | "fdivrs" -> "FDI"
    | ".byte"  -> "BYT" 
    
    | "nop" | "nopl" | "nopw" -> "NOP" 

    (* Unknown instructions *)
    | _ -> "XXX" 


let parse_asm_code s = 
    let lexbuf = Lexing.from_string s in 
    let asm_code = Codeparser.asm_statement Codelexer.asm_token lexbuf in
      asm_code


(* Filter some useless instructions. Input Normalization *)
let is_asm_code_valid code_line = 
    if code_line = "" then false
    (* Disable the input normalization. 
    else 
        true *)
    else
        let (opcode, operand_list) = parse_asm_code code_line in 
        match opcode with 
        | "BAD" -> false 
        | "DATA_PREFIX" | "REX_PREFIX" -> false 
        | ".byte" -> false 
        | "nop" | "nopl" | "nopw" -> false 
        | _ -> true

(*   
     decodecode_output
     %type <(string * (string * string * string) list) list> 

     decodecode_output = [asm_code, code_before_trap, code_after_trap] 
     asm_code:   <"asm_code", [code_before_trap, trap, code_after_trap]> 
     code_before_trap:  <"code_before_trap", [index, byte_code_str, code_line]>
     code_after_trap:   <"code_after_trap",  [index, byte_code_str, code_line]>
     Note: the trap code is included in code_after_trap
 *)

(* Extract the code line either from the *.lst or *.decodeoops 
    (addr, index, code_line) in *.lst 
    (index, byte_code_str, code_line) in *.decodeoops *)
let rec extract_asm_code_list l = 
    match l with 
    | [] -> []
    | (_, _, code_line)::t -> 
        if is_asm_code_valid code_line 
        then code_line::extract_asm_code_list t 
        else extract_asm_code_list t


let rec print_asm_code_list_rec n l = 
    match l with 
    | [] -> ()
      (* results either from the *.lst or *.asm 
         (addr, index, code_line) *) 
    | (addr, index, code_line)::t ->
        Printf.printf "[%d]:\t%s <+%s> %s\n" n addr index code_line;
        print_asm_code_list_rec (n+1) t

let print_asm_code_list = print_asm_code_list_rec 0 


let find_ret_istr l = 
  let rec find_ret_istr_rec i l =
    match l with 
    (* return value: -1  does not find one *)
    | [] -> -1
    | h::t ->  match h with 
               | "ret" | "retq"  -> i
               | _ -> find_ret_istr_rec (i+1) t
  in 
  find_ret_istr_rec 0 l


(* Extract a sublist from the list l, including the begin and end index.*)
let rec sublist b e l = 
    if b > e then []
    else
      match l with 
      | []   -> []
      | h::t -> 
        let tail = if e=0 then [] else sublist (b-1) (e-1) t in 
          if b>0 then tail else h::tail


(* 
   Extract the specific surrounding codes around the trapping instruction.
   l: the result from the parser;  
   r: the size of the required range. If 0, print all.  
   Return: [code_before_trap; code_after_trap]
 *)
let rec extract_code_snippet l r =
    match l with
    | [] -> []
    | (key, value)::t ->
      begin
        match key with
        | "asm_code" -> extract_code_snippet t r 

        | "code_before_trap" -> 
            let asm_list = extract_asm_code_list value in 
            let ret_index = find_ret_istr asm_list in 
            let istr_before_trap = 
              if ret_index > -1 
              (* truncate the instructions proceeding 'ret' *)
              then (sublist (ret_index+1) (List.length asm_list) asm_list)
              else asm_list 
            in
            let len_istr = List.length istr_before_trap in 
            let sur_code_zone = 
                if r > 0 then sublist (len_istr-r) (len_istr-1) istr_before_trap
                else if r = 0 then []
                else istr_before_trap 
            in
                sur_code_zone::extract_code_snippet t r
        
        | "code_after_trap"  ->
            let asm_list = extract_asm_code_list value in 
            let sur_code_zone = 
                if r >= 0 then sublist 0 r asm_list
                else asm_list
            in
                [sur_code_zone]
        
        | _ -> [] 
      end 


let rec print_operand_list l = 
    match l with 
    | [] -> ()
    | (addr_mode, para_list)::t -> 
        Printf.printf "\toperand: %s," addr_mode; 
        List.iter (Printf.printf "%s ") para_list; 
        print_operand_list t


let print_asm_code c = 
    let (opcode, operands) = c in 
      Printf.printf "opcode: %s" opcode; 
      print_operand_list operands;
      print_endline ""


let rec iter_list_with_index f i l = 
    match l with 
    | []   -> () 
    | h::t -> f i h; iter_list_with_index f (i+1) t 


let print_code_snippet r = 
    let code_before_trap = List.nth r 0 and 
        code_after_trap  = List.nth r 1 in 
    let full_seq = List.append code_before_trap code_after_trap in 
      iter_list_with_index (Printf.printf "[%d]:\t%s\n") 0 full_seq  

    (*
       List.iteri (Printf.printf "[%d]:\t%s\n") code_before_trap; 
       List.iteri (Printf.printf "[%d]:\t%s\n") code_after_trap  *)


(* Print C <-> Assembly code mapping list 
     
    c_asm_map_list
    %type <( (string * string) list * (string * string * string) list ) list> 
   
    c_asm_map_list:   <c_stmt_list, asm_istr_list> list
    c_stmt_list:      <line_num, c_code_line> list
    asm_istr_list:    <address, index, asm_code_line> list
 *)

let rec print_c_asm_map_list l = 
    match l with 
    | [] -> () 
    | (c_stmt_list, asm_istr_list)::t -> 
              print_endline "print_c_asm_map_list"; 
              print_c_asm_map_list t 


(* Extract Assemble code from the mapping list *)

let rec extract_asm_list l = 
    match l with 
    | [] -> [] 
    | (c_stmt_list, asm_istr_list)::t -> 
              asm_istr_list @ (extract_asm_list t) 


(* Print the C code list  *)

let rec print_c_stmt_list l = 
    match l with 
    | [] -> () 
    | (line_num, code)::t -> 
              Printf.printf "%s:%s\n" line_num code;
              print_c_stmt_list t 


(* Check whether an index is in an assembly code block by enumerating, 
     since the code is NOT orderred. *)

let rec is_index_in_asm_block l i = 
    match l with 
    | [] -> false 
    | (addr, index, code_line)::t -> 
        if i = index then true 
        else is_index_in_asm_block t i


(* Query the corresponding source code, 
     with an absolute index of the Assembly code section. *)

let rec query_src_by_asm_index map index = 
    match map with 
    | [] -> ([], [])    (* Do NOT find the index *) 
    | (c_stmt_list, asm_istr_list)::t -> 
        let is_found = is_index_in_asm_block asm_istr_list index in 
          if is_found then (c_stmt_list, asm_istr_list)
          else query_src_by_asm_index t index


let get_node_value node = 
    Xml.to_string (List.nth (Xml.children node) 0) 

(* 
    The output format of the BLAST tool, with the option '-outfmt 5'
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>51.6026</Hsp_bit-score>
      <Hsp_score>122</Hsp_score>
      <Hsp_evalue>1.07348e-15</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>39</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>45</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>37</Hsp_identity>
      <Hsp_positive>37</Hsp_positive>
      <Hsp_gaps>6</Hsp_gaps>
      <Hsp_align-len>45</Hsp_align-len>
      <Hsp_qseq>PSHMVVPSHMVVCALMVVM------PPTESMVVPSHMVVCMVPSH</Hsp_qseq>
      <Hsp_hseq>PSHMVVPSHMVVCALMVVMPPTESEEETESMVVPSHMVVCMVPSH</Hsp_hseq>
      <Hsp_midline>PSHMVVPSHMVVCALMVVM        TESMVVPSHMVVCMVPSH</Hsp_midline>
    </Hsp>
 *)

let parse_blast_output_xml doc = 
    let children = Xml.children doc in 
        let blastoutput_iters = List.nth children 8 in 
        let iteration = List.nth (Xml.children blastoutput_iters) 0 in 
        let iteration_hits = List.nth (Xml.children iteration) 4 in 
        let hit = List.nth (Xml.children iteration_hits) 0 in  
        let hit_hsps = List.nth (Xml.children hit) 5 in  

        (* Take only the first match *)
        let hsp = List.nth (Xml.children hit_hsps) 0 in  
        let hsp_value_list = Xml.map (get_node_value) hsp in 
            hsp_value_list 


let rec count_gap seq offset =
    let str_len = String.length seq in 
    if offset < 0 or str_len = 0 then 0
    else let tail = String.sub seq 1 (str_len-1) in 
         match seq.[0] with 
         | '-' -> 1 + (count_gap tail offset)
         |  _  -> count_gap tail (offset-1)


let correlate_trap_index hsp_value_list trap_index = 
    let seq_len = trap_index * encode_BLAST_UNIT_SIZE in  
    let hsp_query_from = int_of_string (List.nth hsp_value_list 4) and 
        hsp_query_to = int_of_string (List.nth hsp_value_list 5) and
        hsp_hit_from = int_of_string (List.nth hsp_value_list 6) and 
        hsp_identity = int_of_string (List.nth hsp_value_list 10) and 
        hsp_align_len = int_of_string (List.nth hsp_value_list 13) and 
        hsp_qseq = List.nth hsp_value_list 14 in 

    let offset = seq_len - hsp_query_from in 

    let gap_num = count_gap hsp_qseq offset in 
        (* Printf.printf 
          "seq_len:%d hsp_query_from:%d hsp_hit_from:%d offset:%d gap_num:%d hsp_qseq:%s\n" 
          seq_len hsp_query_from hsp_hit_from offset gap_num hsp_qseq; 
         *)
        (hsp_hit_from + gap_num + offset) / encode_BLAST_UNIT_SIZE 


let score_schema_type l r = 
    let l_type = encode_asm_schema_type l and
        r_type = encode_asm_schema_type r in
    let match_score = if l_type = r_type then 2 else -1 in 
    let gap_score = -1 in
        (match_score, gap_score) 


let compare_duo_operand l_operands r_operands = 
    let l_src_opd = List.nth l_operands 0 and 
        r_src_opd = List.nth r_operands 0 in 
    let l_tgt_opd = List.nth l_operands 1 and 
        r_tgt_opd = List.nth r_operands 1 in 

    let (l_src_addr_mode, l_src_paras) = l_src_opd and 
        (r_src_addr_mode, r_src_paras) = r_src_opd in
    let (l_tgt_addr_mode, l_tgt_paras) = l_tgt_opd and 
        (r_tgt_addr_mode, r_tgt_paras) = r_tgt_opd in

    match (l_src_addr_mode, l_tgt_addr_mode, 
           r_src_addr_mode, r_tgt_addr_mode) with 

    (* cmp %rsi,0x8(%rax)  <->  cmp %rsi,0x10(%rax) 
       cmpl   $0xfeeddeef,0x0 *)
    | ("HEX",      "IN_REGISTER", "HEX",      "IN_REGISTER")  
    | ("HEX",      "BASE_INDEX",  "HEX",      "BASE_INDEX")  
    | ("CONSTANT", "HEX",         "CONSTANT", "HEX")  
    | ("HEX",      "CONSTANT",    "HEX",      "CONSTANT")  
    | ("CONSTANT", "IN_REGISTER", "CONSTANT", "IN_REGISTER")  
    | ("CONSTANT", "BASE_INDEX",  "CONSTANT", "BASE_INDEX") -> 
      if List.nth l_src_paras 0 = List.nth r_src_paras 0 && 
         List.nth l_tgt_paras 0 = List.nth r_tgt_paras 0 
      then 2 else 1
   
    | ("REGISTER", "IN_REGISTER", "REGISTER", "IN_REGISTER")  
    | ("REGISTER", "BASE_INDEX",  "REGISTER", "BASE_INDEX") ->  
      if List.nth l_tgt_paras 0 = List.nth r_tgt_paras 0 
      then 2 else 1

    (* mov $0x0,%eax  <->  mov $0x6b,%edx *)
    | ("HEX",      "REGISTER", "HEX",      "REGISTER")  
    | ("CONSTANT", "REGISTER", "CONSTANT", "REGISTER") -> 
      if List.nth l_src_paras 0 = List.nth r_src_paras 0  
      then 2 else 1
   
    (* mov 0x7e(%rbx),%al  <->  movzbl 0x7e(%r12),%eax *)
    | ("IN_REGISTER", "REGISTER", "IN_REGISTER", "REGISTER")  
    | ("BASE_INDEX",  "REGISTER", "BASE_INDEX",  "REGISTER") -> 
      if List.nth l_src_paras 0 = List.nth r_src_paras 0 
      then 2 else 1 
    
    | (_, _, _,  _) -> 0 


let __score_schema_type_operand l r = 
    let (l_opcode, l_operands) = l and 
        (r_opcode, r_operands) = r in
    let l_type = encode_asm_schema_type l_opcode and 
        r_type = encode_asm_schema_type r_opcode in
    let match_score = 2 and mismatch_score = -1 and gap_score = -1 in 

    if l_type <> r_type then (mismatch_score, gap_score)
    else
        (* A bonus if the source and target operands of
             duo_operand instructions matches as well. *)
        if List.length l_operands = 2 &&
           List.length r_operands = 2 then
          (match_score + (compare_duo_operand l_operands r_operands), gap_score)
        else
          (match_score, gap_score)


(* Compare the instructions based on their types and operands *)
let score_schema_type_operand l r = 
    let l_asm_code = parse_asm_code l and 
        r_asm_code = parse_asm_code r in
    __score_schema_type_operand l_asm_code r_asm_code


let is_anchor_point_by_type candidate trap = 
    let (candidate_opcode, candidate_operands) = candidate and 
        (trap_opcode, trap_operands) = trap in 
    let l_type = encode_asm_schema_type candidate_opcode and 
        r_type = encode_asm_schema_type trap_opcode in 
    if l_type = r_type 
    then true
    else false


let is_anchor_point_by_type_operand candidate trap = 
    (* at least the type and the addressing mode of the source operand match *)
    let (match_score, gap_score) = 
        __score_schema_type_operand candidate trap in
    if match_score >= 4 then true
    else false


(* Get a list of indice of candidate instructions 
     that MIGHT match with the trapping instruction *)
let rec __get_anchor_point_lists cursor list trap = 
    match list with 
    | [] -> ([],[])
    | h::t -> 
      let candidate = parse_asm_code h in  
      let is_type = is_anchor_point_by_type candidate trap and 
          is_type_operand = is_anchor_point_by_type_operand candidate trap in 
      let (type_list, type_operand_list) = 
          __get_anchor_point_lists (cursor+1) t trap in 
      
      let new_type_list = 
          if is_type then cursor::type_list 
          else type_list in 
      let new_type_operand_list = 
          if is_type_operand then cursor::type_operand_list 
          else type_operand_list in 

      (new_type_list, new_type_operand_list)


let get_anchor_point_list list trap = 
    (* optimisaztion: parse the trapping instruction only once. *)
    let trap_asm_code = parse_asm_code trap in 
    let (type_list, type_operand_list) = 
         __get_anchor_point_lists 0 list trap_asm_code in 
    
    (* select the list with the following order *)
    if List.length type_operand_list > 0 then 
        (* instructions of the same type and the same source operand *)
        type_operand_list

    else if List.length type_list > 0 then 
        (* instructions of the same type *)
        type_list

    else
        (* all instructions are candidates *)
        Array.to_list (Array.init (List.length list) (fun i->i)) 


let rec print_anchor_point_list s_list a_list = 
    match a_list with 
    | [] -> ()
    | h::t -> 
      Printf.printf "[%d]:\t%s\n" h (List.nth s_list h);
      print_anchor_point_list s_list t


let rec print_match_pair l r = 
    match (l, r) with 
    | ([], _) -> ()
    | (_, []) -> ()
    | (lh::lt, rh::rt) -> 
      Printf.printf "%s\t<->\t%s\n" lh rh; 
      print_match_pair lt rt


let print_match_result t = 
    match t with 
    | (anchor, score, (m1, m2, m3), up_align, down_align) -> 
      Printf.printf "Anchor: %d, Score: %d, " anchor score; 
      Printf.printf "Match: %d, Mismatch: %d, Gap: %d\n" m1 m2 m3;
      (* source sequence on the left side, and query sequence on the right *)
      print_match_pair down_align up_align;
      print_endline ""


let print_matrix m = 
    let d1 = Array.length m and 
        d2 = Array.length m.(0) in 
    for i = 0 to d1 - 1 do
        for j = 0 to d2 - 1 do 
            Printf.printf "%d " m.(i).(j)
        done;
        print_endline ""
    done


let triple_max t =
    match t with 
    | (t1, t2, t3) -> let m1 = max t1 t2 in max m1 t3 


(* Do the sequence alignment with the dynamic programming method *)
let global_align_dp src_seq query_seq = 
    let sn = (List.length src_seq) + 1 and 
        qn = (List.length query_seq) + 1 in 
    
    (* R < |C|(min-max)/gap  R: maximal gaps *) 
    let scope = if (qn-1)*6 > (sn-1) then (sn-1) else (qn-1)*6 in 
   
    (* Disable the R optimization 
    let scope = sn -1 in *) 

    let dpm = Array.make_matrix (scope+1) qn 0 in 
    
    for i = 1 to scope do dpm.(i).(0) <- -i done; 
    for j = 1 to qn-1  do dpm.(0).(j) <- -j done;
   
    for m = 1 to scope do 
        for n = 1 to qn - 1 do 
          let (match_score, gap_score) =
              score_schema_type_operand 
                  (List.nth src_seq (m-1)) (List.nth query_seq (n-1))
          in
            dpm.(m).(n) <- triple_max (dpm.(m-1).(n-1) + match_score,
                                       dpm.(m).(n-1) + gap_score,
                                       dpm.(m-1).(n) + gap_score)

        (* TODO: Optimization: find a good boundary to break the loop. 
             in MOST of the cases, 
             the sign is that the value of dpm.(i).(qn) start to decrease 
         *)
        done;
    done;

    (* print_matrix dpm; *)
   
    (* Find the global alignment boundary for the query sequence *)
    let bound_index = ref 0 and max_score = ref min_int in 
    for i = 0 to scope do 
        (* Note: take the upper-most boundary with the operator '<=' *)
        if !max_score <= dpm.(i).(qn-1) 
        then
          begin
            max_score := dpm.(i).(qn-1); 
            bound_index := i 
          end;
    done;
    
    (* Printf.printf "Bound_Index:%d\n" !bound_index; *)

    (* Decode the matrix and construct the alignment sequences *)
    (* Align the query sequence back to the source sequence *)
    let max_align_size = !bound_index + qn in  
    let   up_align = Array.make max_align_size "---" and 
        down_align = Array.make max_align_size "---" in 
    
    let match_cnt = ref 0 and mismatch_cnt = ref 0 and gap_cnt = ref 0 in  
    let align_index = ref 0 and si = ref 0 and qi = ref 0 in  
      si := !bound_index; 
      qi := qn-1;

    while !qi > 0 or !si > 0 do 
    begin
      if !qi = 0 then (* Reaching the end of the query sequence *) 
            begin (* query gap match *)
              up_align.(!align_index) <- "---";  (* NO NEED *)
              down_align.(!align_index) <- List.nth src_seq (!si-1);
              si := !si - 1;
              gap_cnt := !gap_cnt + 1;
            end
      
      else if !si = 0 then (* Reaching the end of the source sequence *)
            begin (* src gap match *)
              up_align.(!align_index) <- List.nth query_seq (!qi-1);
              down_align.(!align_index) <- "---"; (* NO NEED*)
              qi := !qi - 1; 
              gap_cnt := !gap_cnt + 1;
            end
      
      else (* Still moving around within the internal of the matrix *)
      let (match_score, gap_score) = 
          score_schema_type_operand 
              (List.nth src_seq (!si-1)) (List.nth query_seq (!qi-1)) in
      let   src_gap = dpm.(!si).(!qi-1)   + gap_score and 
          query_gap = dpm.(!si-1).(!qi)   + gap_score and 
             no_gap = dpm.(!si-1).(!qi-1) + match_score in 

      match (query_gap >= src_gap, query_gap >= no_gap, src_gap >= no_gap) with
      | (true, true, _) ->
            begin (* query gap match. i.e. put a gap in the query sequence *)
              up_align.(!align_index) <- "---";  (* NO NEED *)
              down_align.(!align_index) <- List.nth src_seq (!si-1);
              si := !si - 1;    (* Move Up *)
              gap_cnt := !gap_cnt + 1;
            end;
      | (false, _, true)->
            begin (* src gap match. i.e. put a gap in the src sequence *)
              up_align.(!align_index) <- List.nth query_seq (!qi-1);
              down_align.(!align_index) <- "---"; (* NO NEED*)
              qi := !qi - 1;    (* Move Left *)
              gap_cnt := !gap_cnt + 1;
            end;
      | (_, _, _)  -> 
            begin (* No gap match *)
              up_align.(!align_index) <- List.nth query_seq (!qi-1);
              down_align.(!align_index) <- List.nth src_seq (!si-1);
              si := !si - 1;
              qi := !qi - 1;    (* Move Up and Left *)
              if match_score >= 2 
              then match_cnt := !match_cnt + 1
              else mismatch_cnt := !mismatch_cnt + 1
            end;
    end;
    align_index := !align_index + 1
    
    done;

    let match_metrics = (!match_cnt, !mismatch_cnt, !gap_cnt) in 
    let final_up_align = 
      List.rev (Array.to_list (Array.sub up_align 0 !align_index)) in 
    let final_down_align = 
      List.rev (Array.to_list (Array.sub down_align 0 !align_index)) in 
    (!max_score, match_metrics, final_up_align, final_down_align)


let rec global_align_rec score src_seq query_seq = 
    match (src_seq, query_seq) with 
    | ([], _) -> (score + (-1)*(List.length query_seq),
                  query_seq, List.map (fun a -> "---") query_seq) 
    | (_, []) -> (score, List.map (fun a -> "---") src_seq, src_seq)

    | (sh::st, qh::qt) -> 
        let (match_score, gap_score) = score_schema_type_operand sh qh in 

        (* Put a gap in the source/query sequences *)
        let src_gap   = global_align_rec (score+gap_score) src_seq qt and 
            query_gap = global_align_rec (score+gap_score) st query_seq and
            no_gap    = global_align_rec (score+match_score) st qt in 
        
        match (src_gap, query_gap) with 
        | ((sg, su, sd), (qg, qu, qd)) -> 
          if sg >= qg then 
              match no_gap with 
              | (ng, nu, nd) -> if ng >= sg 
                                then (ng, qh::nu, sh::nd)
                                else (sg, qh::su, "---"::sd)
          else 
              match no_gap with 
              | (ng, nu, nd) -> if ng >= qg 
                                then (ng, qh::nu, sh::nd)
                                else (qg, "---"::qu, sh::qd)

(* A recursive version of the global alignment algorithm *)
let global_align_rc = global_align_rec 0 


let max_score l r = 
    match (l, r) with 
    | ( (l_anchor, l_score, l_metrics, l_up_align, l_down_align), 
        (r_anchor, r_score, r_metrics, r_up_align, r_down_align) ) -> 
      if l_score < r_score then r else l 


(* If multiple points have the same maximal score, take the left most one. *)
let list_max_score l = 
    List.fold_left (max_score) (-1, min_int, (0,0,0), [], []) l 


let print_score s = 
    match s with 
    | (anchor, score, metrics, _, _) ->  
      Printf.printf "Anchor: %d\tScore: %d,\t" anchor score;
      let (match_cnt, mismatch_cnt, gap_cnt) = metrics in 
      let confidence = (float match_cnt) /. 
           ( float (match_cnt + mismatch_cnt) +. (float gap_cnt) /. 2.0) in
        Printf.printf "Confidence: %f, " confidence;
        Printf.printf "Match: %d, Mismatch: %d, Gap: %d\n" 
          match_cnt mismatch_cnt gap_cnt


let print_score_list header l = 
    print_endline header; 
    List.iter print_score l


let add_score s m = 
    match m with 
    | (anchor, score, metrics, _, _) -> s + score  


let calculate_relative_confidence score_list max_score = 
    let len = List.length score_list in       
    if len = 1 then 0.0 
    else 
      let score_sum = List.fold_left (add_score) 0 score_list in 
      let (_, score, _, _, _) = max_score in 
        (float (len * score - score_sum)) /. (float (len-1)) /. (float score)


let sum_match_metrics l r = 
    match (l, r) with 
    | ( (l_match_cnt, l_mismatch_cnt, l_gap_cnt), 
        (r_match_cnt, r_mismatch_cnt, r_gap_cnt) ) -> 
        (l_match_cnt + r_match_cnt, 
         l_mismatch_cnt + r_mismatch_cnt, 
         l_gap_cnt + r_gap_cnt)


(* Attribute a specific register to its family. e.g. a={rax, eax, ax, al}*)
let normalize_register str =
    try  
      let lexbuf = Lexing.from_string str in 
        Codeparser.register Codelexer.reg_token lexbuf
    (* Return the unrecognized string as it is *)
    with e -> str


(*  Mark the trace for each register/memory involved in the operand list. *)
let rec add_trace tbl index operand_list = 
    match operand_list with 
    | [] -> ()
    | (addr_mode, para_list)::tail -> 
      begin
        match addr_mode with
        | "REGISTER" -> 
            let reg = normalize_register (List.nth para_list 0) in 
              Hashtbl.add tbl reg index
        | "IN_REGISTER" -> (* Add an entry for both the register and the memory *)
            let reg = normalize_register (List.nth para_list 1) in 
            let key = reg ^ "!" ^ (List.nth para_list 0) in 
              Hashtbl.add tbl key index; 
              Hashtbl.add tbl reg index
        | "BASE_INDEX"  -> 
            let reg1 = normalize_register (List.nth para_list 1) and 
                reg2 = normalize_register (List.nth para_list 2) in 
              Hashtbl.add tbl reg1 index; 
              Hashtbl.add tbl reg2 index 
        | _ -> () 
      end;
      add_trace tbl index tail


(* Get a list of values that are associated with the key, 
   in a right order. *)
let get_values tbl key = List.rev (Hashtbl.find_all tbl key) 


let print_trace trace_tbl loc = 
    let trace = get_values trace_tbl loc in 
      Printf.printf "%s: " loc; 
      List.iter (Printf.printf "%d ") trace;
      print_endline ""


let rec __get_data_flow tbl index seq = 
    match seq with 
    | [] -> () 
    | hd::tl -> 
      let (opcode, operand_list) = parse_asm_code hd in 
        let _ = add_trace tbl index operand_list in 
          __get_data_flow tbl (index+1) tl


(* Parse the data flow from the sequence *)
let get_data_flow seq = 
    let trace_tbl = Hashtbl.create 100 in 
    let _ =  __get_data_flow trace_tbl 0 seq in
      trace_tbl


(* get a list of UNIQUE keys from a hash table *)
let get_keys h = 
    Hashtbl.fold 
       (fun key data accu -> 
            match accu with 
            | [] -> key::[] 
            | hd::tl -> if hd = key then accu 
                        else key::accu) h []


let sequences_match src_seq l_seq a_r_seq anchor = 
    let anchor_istr = List.nth src_seq anchor and 
        trap_istr   = List.hd a_r_seq 
    in  

    let a::r_seq = a_r_seq in 

    let (anchor_score, _) = 
        score_schema_type_operand anchor_istr trap_istr 
    in 

    let l_src_seq = sublist 0 (anchor-1) src_seq and 
        r_src_seq = sublist (anchor+1) ((List.length src_seq)-2) src_seq 
    in

    let (l_score, l_metrics, l_up_align, l_down_align) = 
         global_align_dp (List.rev l_src_seq) (List.rev l_seq) and 
        (r_score, r_metrics, r_up_align, r_down_align) = 
         global_align_dp r_src_seq r_seq 
    in
        
    (* 
    let (l_score, l_up_align, l_down_align) = 
         global_align_rc (List.rev l_src_seq) (List.rev l_seq) and 
        (r_score, r_up_align, r_down_align) = 
         global_align_rc r_src_seq r_seq 
    in
    let l_metrics = (0, 0, 0) and r_metrics = (0, 0, 0) in 
    *)

    (* Count the matching result of anchor point along with the substrings *)
    let (match_cnt, mismatch_cnt, gap_cnt) = 
        sum_match_metrics l_metrics r_metrics in
    let metrics_sum = if anchor_score >= 2 
                      then (match_cnt+1, mismatch_cnt, gap_cnt)
                      else (match_cnt, mismatch_cnt+1, gap_cnt)
    in 
    let l_rev_up_align = List.rev l_up_align and 
        l_rev_down_align = List.rev l_down_align in 

    let result = ( anchor, 
                   l_score + r_score + anchor_score, 
                   metrics_sum,
                   l_rev_up_align @ (trap_istr::r_up_align), 
                   l_rev_down_align @ (anchor_istr::r_down_align) ) 
    in 

    (* Print some information for debuging. *)
    if is_DEBUG then 
    begin 
      print_endline "Left Match======>";
      print_match_result 
        (anchor, l_score, l_metrics, l_rev_up_align, l_rev_down_align); 
    
      print_endline "Right Match======>";
      print_match_result 
        (anchor, r_score, r_metrics, r_up_align, r_down_align);
    
      print_endline "Total Match===========>";
      print_match_result result;
      print_endline "**********************";
    end; 
    result
    

(* Add the additional score value of each anchor point, 
    to adjust the final matching score. *)
let rec adjust_score_list_rec acc score_list src_asm trap_istr = 
    match score_list with 
    | [] -> acc 
    | (anchor, score, metrics, up_align, down_align)::tail -> 
        let anchor_istr = List.nth src_asm anchor in
        let (match_score, _) = 
            score_schema_type_operand anchor_istr trap_istr in 
        let new_acc = 
            (anchor, score + match_score, metrics, up_align, down_align)::acc in
            adjust_score_list_rec new_acc tail src_asm trap_istr 

let adjust_score_list score_list src_asm trap_istr = 
    let ret = adjust_score_list_rec [] score_list src_asm trap_istr in 
        List.rev ret 


let get_all_rgts operand = 
    match operand with 
    | None -> [] 
    | Some o -> let (addr_mode, para_list) = o in 
        match addr_mode with 
        | "REGISTER"    ->  para_list
        | "IN_REGISTER" -> (List.nth para_list 1)::[]
        | "BASE_INDEX"  ->  sublist 1 2 para_list  
        | _ -> []


let get_drt_rgt operand = 
    match operand with 
    | None -> None
    | Some o -> let (addr_mode, para_list) = o in 
        match addr_mode with 
        | "REGISTER" -> Some (List.hd para_list)
        | _ -> None


let get_idt_rgts operand = 
    match operand with 
    | None -> [] 
    | Some o -> let (addr_mode, para_list) = o in 
        match addr_mode with 
        | "IN_REGISTER" -> (List.nth para_list 1)::[]
        | "BASE_INDEX"  ->  sublist 1 2 para_list  
        | _ -> []


(* Get the source operand in the operand list. *)
let get_src_opd operand_list = 
    let len = List.length operand_list in 
    if len = 2 || len = 1 then 
      Some (List.hd operand_list) 
    else
      None  


(* Get the destination operand in the oeprand list. *)
let get_dst_opd operand_list = 
    let len = List.length operand_list in 
    if len = 2 then 
      Some (List.nth operand_list 1) 
    (* the operand is both the src and dst. *)
    else if len = 1 then 
      Some (List.nth operand_list 0)   (* e.g. dec %rax *)
    else 
      None 


(* Decide whether the instruction has any impact 
     on the values of its operands. *)
let is_immu_istr opcode = 
    match opcode with 
    | "test" | "testb" | "testl" -> true  
    | "cmp"  | "cmpb" | "cmpl" | "cmpq" -> true 
    | _ -> false 


(* Check whether the value of the destination register is used 
     in the operation, or it doesn't matter but 
     simply is overwritten, eg. mov value, reg *)
let use_dst_rgt opc = 
    (* Exclude the cases where the value does not matter. *)
    let op_type = encode_asm_schema_type opc in
    match op_type with
    (* Todo: need to refine *)
    | "MOV" | "LEA" -> false
    | _ -> true


(* Check whether an instruction (1) has an impact on another instruction (2). 
   For efficiency, parse the instruction first before passing them in. *)
let has_impact_on opc_1 opd_1 opc_2 opd_2 = 
    if is_immu_istr opc_1 then false 
    else 
      let dst_rgt = get_drt_rgt (get_dst_opd opd_1) in 
      match dst_rgt with 
      | None -> false
      | Some r -> 
          let src_rgts = get_all_rgts (get_src_opd opd_2) in 
          let dst_opd = get_dst_opd opd_2 in 
          let dst_rgts = 
              if use_dst_rgt opc_2 then get_all_rgts dst_opd 
              else get_idt_rgts dst_opd in  
          let rgt_list = src_rgts @ dst_rgts in 
          let rgt_name = normalize_register r in 
          List.exists (fun x -> normalize_register x = rgt_name) rgt_list  
        

(* Get a list of instructions that have some impact on 
    the trapping instruction. *)
let get_cause_instructions trap code_before_trap =  
    let l = List.rev code_before_trap in 
    let len = List.length l in 
    let (opc, opd) = parse_asm_code trap
    in 
    let rec aux c opc_2 opd_2 = function
      | [] -> []
      | hd::tl ->
          let (opc_1, opd_1) = parse_asm_code hd in 
          if has_impact_on opc_1 opd_1 opc_2 opd_2
          then (c, hd)::(aux (c+1) opc_1 opd_1 tl)
          else aux (c+1) opc_2 opd_2 tl
    in
    let rev_index = function | (i, istr) -> ((len-i-1), istr) in  
    let res = aux 0 opc opd l in (List.map rev_index res)  


(* Get a list of instructions that have some consequences 
    from the trap instruction. *)
let get_impact_instructions trap code_after_trap = 
    let (opc, opd) = parse_asm_code trap
    in
    let rec aux c opc_1 opd_1 = function 
      | [] -> []
      | hd::tl -> 
          let (opc_2, opd_2) = parse_asm_code hd in 
          if has_impact_on opc_1 opd_1 opc_2 opd_2 
          then (c, hd)::(aux (c+1) opc_2 opd_2 tl)
          else aux (c+1) opc_1 opd_1 tl
    in
      aux 0 opc opd code_after_trap


let print_causal_chain l = 
    let aux i = 
        let (i_i, i_istr) = i in Printf.printf "[%d] %s\n" i_i i_istr
    in 
      List.iter aux l 


(* Extract a slice from the trace table based on certain criteria. *)
let get_slice_from trace_tbl istr = 
    let (opcode, operand_list) = parse_asm_code istr in
      let src_rgts = get_all_rgts (get_src_opd operand_list) and
          dst_rgts = get_all_rgts (get_dst_opd operand_list) in
      let l = List.append src_rgts dst_rgts in
      let rgts = List.map (normalize_register) l in 
      let (_, slice) = List.fold_left 
          (fun (tbl, accu) rgt -> (tbl, List.append accu (get_values tbl rgt)))
          (trace_tbl, []) rgts in 
      let _ = print_endline "\nCritical_Slice:" in 
          List.iter (Printf.printf "%d ") slice 


(* Select a list of anchor points and return the matching scores for them. *)
let anchor_match src_asm code_before_trap code_after_trap =
    let trap_istr = List.hd code_after_trap in 
    let _ = Printf.printf "\nMatching_Instruction: %s\n" trap_istr in 
    
    (* Do the Anchor Point selection *)
    let anchor_list = get_anchor_point_list src_asm trap_istr in 

    (* Consider all points as anchor points. No Anchor Point Selection. 
    let anchor_list = 
        Array.to_list (Array.init (List.length src_asm) (fun i->i)) in *)

    print_endline "\nAnchor_List:";
    print_anchor_point_list src_asm anchor_list;

    let score_list = 
        List.map 
        (sequences_match src_asm code_before_trap code_after_trap) anchor_list
    in 
    print_score_list "Score List:" score_list;
   
    let adjusted_score_list = adjust_score_list score_list src_asm trap_istr in
    let _ = print_score_list "Adjusted Score List:" adjusted_score_list in
        (* Return the score list for the anchor points *)
        adjusted_score_list


let get_counterpart_from_cause src_asm anchor_match causal_index =
    let src_size = List.length src_asm in
    let (index, score, metric, up_align, down_align) = anchor_match in
    let anchor = List.nth src_asm index in 
    let code_after_anchor = sublist (index+1) (src_size-1) src_asm in 
    let list = get_impact_instructions anchor code_after_anchor in
    let impact_list = 
        List.map (fun (i,s) -> (i+index+1, s)) list in

        if List.length impact_list >= (causal_index+1) then 
           Some (List.nth impact_list causal_index)
        else
           None


(* Trace back in the source sequence to find the counterpart of 
    the trapping instruction from the impacted instruction. *)
let get_counterpart_from_impact src_asm anchor_match causal_index = 
    let (index, score, metric, up_align, down_align) = anchor_match in
    let anchor = List.nth src_asm index in 
    let code_before_anchor = sublist 0 (index-1) src_asm in 
    let cause_list = get_cause_instructions anchor code_before_anchor in
        
        (*
        let _ = Printf.printf "%s\n" anchor in 
        let _ = print_endline "Cause_list:" in 
        let _ = 
          List.iter (fun (i,s) -> Printf.printf "%d, %s\n" i s) cause_list in 
         *)

        if List.length cause_list >= (causal_index+1) then 
           Some (List.nth cause_list causal_index)
        else
           None 


let cause_istr_match src_asm code_before_trap code_after_trap = 
    let size_before = List.length code_before_trap in
    let trap = List.hd code_after_trap in 
    let cause_list = 
        get_cause_instructions trap code_before_trap in
    
    let rec aux count l = 
        match l with
        | [] -> []
        | (i, istr)::tl -> 
          let new_before = sublist 0 (i-1) code_before_trap and
              new_after = (sublist i (size_before-1) code_before_trap)
                            @ code_after_trap in

          let score_list = anchor_match src_asm new_before new_after in
          let anchor_match = list_max_score score_list in
          let counterpart = 
              get_counterpart_from_cause src_asm anchor_match count in

          match counterpart with
          | None -> aux (count+1) tl
          | Some o -> o::(aux (count+1) tl)
    in
    let cause_counterpart_list =  aux 0 cause_list in

    if is_DEBUG then 
    begin 
      print_endline "\nCause_List:";
      List.iter (fun (i,s) -> Printf.printf "<%d, %s>\n" i s) cause_list;
      
      print_endline "\nCause_Counterpart_List:";
      List.iter (fun (i,s) -> Printf.printf "<%d, %s>\n" i s) 
          cause_counterpart_list;
    end;

    cause_counterpart_list


let impact_istr_match src_asm code_before_trap code_after_trap = 
    let size_after = List.length code_after_trap in
    let trap = List.hd code_after_trap in 
    let impact_list = 
        get_impact_instructions trap (List.tl code_after_trap) in
      
    let rec aux count l = 
        match l with 
        | [] -> []
        | (i, istr)::tl -> 
          let new_before = code_before_trap @ (sublist 0 i code_after_trap) and
              new_after = sublist (i+1) (size_after-1) code_after_trap in 
          
          let score_list = anchor_match src_asm new_before new_after in
          let anchor_match = list_max_score score_list in
          let counterpart = 
            get_counterpart_from_impact src_asm anchor_match count in

          match counterpart with
          | None -> aux (count+1) tl
          | Some o -> o::(aux (count+1) tl) 
    in 
    
    let impact_counterpart_list = aux 0 impact_list in 

    if is_DEBUG then 
    begin 
      print_endline "\nImpact_List:";
      List.iter (fun (i,s) -> Printf.printf "<%d, %s>\n" i s) impact_list;
      
      print_endline "\nImpact_Counterpart_List:";
      List.iter (fun (i,s) -> Printf.printf "<%d, %s>\n" i s) 
          impact_counterpart_list;
    end;

    impact_counterpart_list
    

(* Check whether the source or destination operands of instruction (1) 
     depends on the destination operand of instruction (2). *) 
let depends_on opd_1 opd_2 =
      let dst_rgt_2 = get_drt_rgt (get_dst_opd opd_2) in
      match dst_rgt_2 with 
      | None -> (false, "NONE")
      | Some r -> 
          let src_rgts = get_all_rgts (get_src_opd opd_1) in 
          let dst_rgts = get_all_rgts (get_dst_opd opd_1) in 

          let rgt_name = normalize_register r in
          let compare_func = fun x -> normalize_register x = rgt_name in
          if List.exists compare_func src_rgts then 
              (true, "DST-SRC")
          else if List.exists compare_func dst_rgts then 
              (true, "DST-DST")
          else 
              (false, "NONE") 


(* Decide whether an opcode is distinguished, 
     e.g. not 'mov' or 'lea' *)
let is_distinguished opc = 
    let op_type = encode_asm_schema_type opc in
    match op_type with
    | "MOV" | "LEA" -> false
    | _ -> true


let is_jump opc = 
    match opc with
    | "jmp" | "jmpq"
    | "ja"  | "jae"
    | "jb"  | "jbe"
    | "je"  | "jne" 
    | "jg"  | "jge"
    | "jl"  | "jle"
    | "js"  | "jns"  -> true
    | _ -> false
    

let get_cause_tandem trap code_before_trap =
    let rev_code = List.rev code_before_trap in
    let len = List.length code_before_trap in
    let (opc_1, opd_1) = parse_asm_code trap in
    let rec aux c = function
    | [] -> None
    | hd::tl ->
        (* Restrain the search within one code block. *)
        let (opc_2, opd_2) = parse_asm_code hd in
        if is_jump opc_2 then None
        else
          if (is_distinguished opc_2) then
              let (res, _) = (depends_on opd_1 opd_2) in
              if res then Some (len-1-c, hd)
              else aux (c+1) tl
          else aux (c+1) tl
    in
      aux 0 rev_code


let get_impact_tandem trap code_after_trap = 
    let (opc_1, opd_1) = parse_asm_code trap in
    let rec aux c = function 
      | [] -> None
      | hd::tl ->
          let (opc_2, opd_2) = parse_asm_code hd in
          if is_jump opc_2 then None
          else
            if (is_distinguished opc_2) then 
                let (res, _) = (depends_on opd_2 opd_1) in
                if res then Some (c, hd)
                else aux (c+1) tl
            else aux (c+1) tl
    in
      aux 0 code_after_trap


let get_counterpart_of_impact_tandem src_asm anchor_match tandem = 
    let (index, score, metric, up_align, down_align) = anchor_match in
    let anchor = List.nth src_asm index in
    let (opc_1, opd_1) = parse_asm_code anchor in

    let (trap, impact) = tandem in 
    let (trap_opc, trap_opd) = parse_asm_code trap and
        (impact_opc, impact_opd) = parse_asm_code impact in
    let relation = depends_on impact_opd trap_opd in

    let code_before_anchor = sublist 0 (index-1) src_asm in 
    let rev_code = List.rev code_before_anchor in
     
    let rec aux c = function
    | [] -> []
    | hd::tl -> 
        let (opc_2, opd_2) = parse_asm_code hd in
        if relation = (depends_on opd_1 opd_2)
        then [(index-1-c, hd)]
        else aux (c+1) tl
    in
        aux 0 rev_code


let get_counterpart_of_cause_tandem src_asm anchor_match tandem = 
    let (index, score, metric, up_align, down_align) = anchor_match in
    let anchor = List.nth src_asm index in
    let (opc_1, opd_1) = parse_asm_code anchor in

    let (trap, cause) = tandem in 
    let (trap_opc,  trap_opd)  = parse_asm_code trap and
        (cause_opc, cause_opd) = parse_asm_code cause in
    let relation = depends_on trap_opd cause_opd in

    let len = List.length src_asm in
    let code_after_anchor = sublist (index+1) (len-1) src_asm in 
     
    let rec aux c = function
    | [] -> []
    | hd::tl -> 
        let (opc_2, opd_2) = parse_asm_code hd in
        if relation = (depends_on opd_2 opd_1)
        then [(index+c, hd)]
        else aux (c+1) tl
    in
        aux 1 code_after_anchor
    

(* Match the tandem consisting of the trapping instruction and
    an instruction before that has an impact on the trap. 
   e.g. si_vm_set_page: 
     or $0x24200000,%r11d -> * mov %r11d,(%r10,%rcx,4)
 *)
let cause_tandem_match src_asm code_before_trap code_after_trap = 
    let size_before = List.length code_before_trap in
    let trap = List.hd code_after_trap in
    let cause_tandem =
        get_cause_tandem trap code_before_trap in 
    match cause_tandem with
    | None -> []
    | Some (i, istr) -> 
        let new_before = sublist 0 (i-1) code_before_trap and
            new_after = sublist i (size_before-1) code_before_trap 
                          @ code_after_trap in 
        let score_list = anchor_match src_asm new_before new_after in
        let anchor_match = list_max_score score_list in
        let tandem = (trap, istr) in
        let counterpart =
            get_counterpart_of_cause_tandem src_asm anchor_match tandem in

        if is_DEBUG then 
        begin
          let (mi, _, _, _, _) = anchor_match in
          Printf.printf "\nCause_Tandem_Match: <%d, %s> <= <%d, %s>\n"
            mi (List.nth src_asm mi) i istr;
          match counterpart with
          | [(c_i, c_istr)] -> 
            Printf.printf "\nTrap_Match: <%d, %s> <= <%s>\n" c_i c_istr trap;
          | _ -> print_endline "\nTrap_Counterpart: None\n"
        end;

        counterpart


(* Match the tandem consisting of the trapping instruction and 
    a following instruction on which it has a direct impact, if there is any.
   e.g. ttm_bo_validate:   mov 0x50(%ebx),%eax ... --> and %eax,%ecx
 *)
let impact_tandem_match src_asm code_before_trap code_after_trap = 
    let size_after = List.length code_after_trap in
    let trap = List.hd code_after_trap in 
    let impact_tandem = 
        get_impact_tandem trap (List.tl code_after_trap) in 
    match impact_tandem with
    | None -> []
    | Some (i, istr) ->
        let new_before = code_before_trap @ (sublist 0 i code_after_trap) and
            new_after = sublist (i+1) (size_after-1) code_after_trap in 
        let score_list = anchor_match src_asm new_before new_after in
        let anchor_match = list_max_score score_list in
        let tandem = (trap, istr) in
        let counterpart =
            get_counterpart_of_impact_tandem src_asm anchor_match tandem in

        if is_DEBUG then 
        begin
          let (mi, _, _, _, _) = anchor_match in
          Printf.printf "\nImpact_Tandem_Match: <%d, %s> <= <%d, %s>\n" 
            mi (List.nth src_asm mi) i istr;
          match counterpart with
          | [(c_i, c_istr)] -> 
            Printf.printf "\nTrap_Match: <%d, %s> <= <%s>\n" c_i c_istr trap;
          | _ -> print_endline "\nTrap_Counterpart: None\n"
        end;

        counterpart


(* Augment the score of an anchor point, if it appears in the causal chain. *)
let augment_score_list score_list factor_list =
    if List.length factor_list = 0 then score_list 
    else
      let aug_factor = 10 in
      let aux item =
        let (anchor, score, metrics, up_align, down_align) = item in
          if List.exists (fun (x, _) -> x = anchor) factor_list
          then (anchor, score+aug_factor, metrics, up_align, down_align)
          else item
      in
        List.map aux score_list


(* Do the matching for the instructions in the slice that 
     involves the trapping instruction. *)
let slice_match src_asm snippet_asm = 
    let code_before_trap = List.nth snippet_asm 0 and 
        code_after_trap  = List.nth snippet_asm 1 
    in 
    
    if is_DEBUG then
    begin 
    let len_cbt = List.length code_before_trap and 
        len_cat = List.length code_after_trap in 
      
        print_endline "\nQuery_Sequence:"; 
        print_code_snippet snippet_asm;
        Printf.printf 
          "\nSource_Sequence_Size:%d, Query_Sequence_Size:%d\n" 
          (List.length src_asm) (len_cbt + len_cat);
    end; 

    let score_list = anchor_match src_asm code_before_trap code_after_trap in
        
    (* Augment the score list for the trapping instruction with 
         the counterpart instructions of the causal chain to
         get the final optimal matching result *)

    (*
    let cause = cause_istr_match src_asm code_before_trap code_after_trap in  
    let impact = impact_istr_match src_asm code_before_trap code_after_trap in  
    *)

    let cause = cause_tandem_match src_asm code_before_trap code_after_trap in  
    let impact = impact_tandem_match src_asm code_before_trap code_after_trap in  
    let aug_list = cause @ impact in 

    let aug_score_list = augment_score_list score_list aug_list in
    let _ = print_score_list "\nTrapping_Instruction_Score_List:" score_list in
    let _ = print_score_list "\nAugmented_Score_List:" aug_score_list in

    let max_match = list_max_score aug_score_list in 
        print_string "\nBest Match ";
        print_match_result max_match;

        Printf.printf "Relative Confidence: %f\n" 
          (calculate_relative_confidence score_list max_match);
        max_match

        

(* Parse the *.lst or *.asm files, and return the C and Assembly code mapping *) 
let parse_c_asm input_file =
    let input  = open_in input_file in 
    let lexbuf = Lexing.from_channel input in
    let c_asm_map = Codeparser.lst_file Codelexer.lst_token lexbuf in
        close_in input;
        c_asm_map


(* Order the assembly line by the index *)
let compare_asm_entry a b = 
    match (a, b) with 
    | ((a_addr, a_index, a_code), (b_addr, b_index, b_code)) 
     -> let a_order = int_of_string a_index and 
            b_order = int_of_string b_index 
        in (a_order - b_order)


(* Sort the Assembly code list extracted from the *.lst file *)
let sort_asm_list asm_list = 
    List.sort compare_asm_entry asm_list 


let parse_decodeoops input_file = 
    let input  = open_in input_file in 
    let lexbuf = Lexing.from_channel input in
    let result = Codeparser.decodecode_output 
                 Codelexer.decodecode_token lexbuf in
        close_in input;
        result



let print_usage() = 
    print_endline 
      "Usage: codeparser -m [asm|decode|match|query|index|xml|correlate] input.file [num]"


(* The main function. The entrance of the program. *)

let _ =
    match Array.length Sys.argv with 
    | 4 | 5 | 6 -> 
      begin   
        try 
          let mode = Sys.argv.(2) in 
          let input_file = Sys.argv.(3) 
          in
          match mode with 
          | "asm" -> 
            let c_asm_map = parse_c_asm input_file in
            let src_asm = extract_asm_list c_asm_map in 
            let asm_code_list = extract_asm_code_list src_asm in 
            let c = List.map (parse_asm_code) asm_code_list in 
              List.iter (Printf.printf "%s\n") asm_code_list;
              Printf.printf "====Length:%d====\n" (List.length asm_code_list);
              List.iter (print_asm_code) c 


          | "decode" -> 
            (* Parse the output file of the 'decodecode' script *) 
            let range  = if Array.length Sys.argv = 4 then -1 
                         else int_of_string Sys.argv.(4) in 
            let result = parse_decodeoops input_file in 
            let r = extract_code_snippet result range in
            let code_before_trap = List.nth r 0 and 
                code_after_trap  = List.nth r 1 in
            let trap = List.hd code_after_trap in
            
            let cause_list = 
                get_cause_instructions trap code_before_trap in
            let impact_list = 
                get_impact_instructions trap (List.tl code_after_trap) in
            
            let seq = List.append code_before_trap code_after_trap in 
              let _ = 
                  iter_list_with_index (Printf.printf "[%d]:\t%s\n") 0 seq in
              let _ = print_endline "\nCause:" in 
              let _ = print_causal_chain cause_list in 
              let _ = print_endline "\nImpact:" in
              let _ = print_causal_chain impact_list in 
              let trace_tbl = get_data_flow seq in 
              let key_lst = get_keys trace_tbl in 
                print_endline "\nData flow slices:";
                List.iter (print_trace trace_tbl) key_lst 

          
          | "match" -> 
            let c_asm_map = parse_c_asm input_file in
            let src_asm = extract_asm_list c_asm_map in 
            let extracted_asm = extract_asm_code_list src_asm in 

            let _ = print_endline "Source_Sequence:" and 
                _ = print_asm_code_list src_asm in 

            if List.length extracted_asm = 0 then 
                print_endline "Empty Source Sequence" 
            else 
            let decodeoops_file = Sys.argv.(4) in 
            let range = if Array.length Sys.argv = 5 then -1 
                        else int_of_string Sys.argv.(5) in 
            let decodeoops_result = parse_decodeoops decodeoops_file in 
            let snippet_asm = 
                extract_code_snippet decodeoops_result range in
            
            if List.length snippet_asm <> 2 then 
                print_endline "*.decodeoops malformat" 
            else
            let (anchor, score, metrics, up_align, down_align) = 
                slice_match extracted_asm snippet_asm in
            
            let (addr, index, codeline) = List.nth src_asm anchor in 
            
            Printf.printf "\nBest_Match_Index: %s, Score: %d, " index score;
            let (match_cnt, mismatch_cnt, gap_cnt) = metrics in 
            Printf.printf "Match: %d, Mismatch: %d, Gap: %d\n" 
                 match_cnt mismatch_cnt gap_cnt;
            print_endline "\nCounterpart_Instruction:";
            print_endline codeline 
            
          | "xml" -> 
            (* Parse the XML output file from the BLAST tool *)
            let doc = Xml.parse_file input_file in
                let hsp_value_list = parse_blast_output_xml doc in 
                    List.iter (Printf.printf "%s\n") hsp_value_list 
          
          | "query" -> 
            (* Query the corresponding source code, 
                  with an absolute index of the Assembly code section. *)
            let index  = Sys.argv.(4) in 
            let input  = open_in input_file in 
            let lexbuf = Lexing.from_channel input in
            let c_asm_map = Codeparser.lst_file Codelexer.lst_token lexbuf in
            let (c_stmt_list, asm_istr_list) = 
                  query_src_by_asm_index c_asm_map index in 
              print_c_stmt_list c_stmt_list; 
              close_in input 
          
          | "index" -> 
            (* Find the actual index in the Assembly code, 
                 with an absolute index given by the sequence alignment *)
            let abs_index = int_of_string Sys.argv.(4) in 
            let input  = open_in input_file in 
            let lexbuf = Lexing.from_channel input in
            let c_asm_map = Codeparser.lst_file Codelexer.lst_token lexbuf in
            let asm_istr_list = extract_asm_list c_asm_map in 
            let (addr, index, codeline) = List.nth asm_istr_list (abs_index-1) in 
              Printf.printf "%s\n" index;
              close_in input 
            
          | "correlate" -> 
            (* Correlate the trapping index in the code snippet 
                   to the one in the crash function *)
            let trap_index = int_of_string Sys.argv.(4) in 
            let doc = Xml.parse_file input_file in
                let hsp_value_list = parse_blast_output_xml doc in 
                    Printf.printf "%d\n" 
                      (correlate_trap_index hsp_value_list trap_index) 

          | _ -> print_usage()


          (* Return the error code for debugging *)
          with e -> print_endline "Oops! Some oops occurred."; 
                    Printexc.print_backtrace stdout; 
                    exit 1
      end 
    | _ ->
         (* print_endline (normalize_register "%al"); *)
         print_usage(); exit 1 



