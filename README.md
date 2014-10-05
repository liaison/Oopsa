Oopsa
=====

A tool to pinpoint the offending line from a Linux kernel oops. 

It is the implementation which enbodies the core results of our paper in MSR'13.
"Oops! What Did that Code Snippet Come From?"  

http://dl.acm.org/citation.cfm?id=2597094


====

The project contains a parser to parse the *.lst file as well as the Assemble code through ocamlyacc framework. 

=========

compile.sh: a shell to compile everything in a batch 
    Note: one should run the 'make' command twice to compile the source code correctly, since the first round is used to generate a dependency fiel '.depend' for the compiling of the second round. 

run.sh:         bash shell to automatically run test cases 

codeparser.mly: the grammar of parser for *.lst file and Assemble code file as well.

codelexer.mll : the grammar of lexer to parse the tokens/attributes. 



