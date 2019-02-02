Oopsa
=====

A tool to pinpoint the offending line from a Linux kernel oops. 

It is the implementation which enbodies the core results of our paper in MSR'13.

[Oops! What Did that Code Snippet Come From?](http://dl.acm.org/citation.cfm?id=2597094)  




#### Abstract

The project contains a parser that is implemented with the *ocamlyacc* framework to parse both the `*.lst` file and the Assemble code. 

#### Organization

- compile.sh: a shell to compile everything in a batch 
    Note: one should run the `make` command twice to compile the source code correctly, since the first round is used to generate a dependency file '.depend' for the compiling of the second round. 

- run.sh: bash shell to run the test cases 

- codeparser.mly: the grammar of parser for *.lst file and the Assemble code file as well.

- codelexer.mll : the grammar of lexer to parse the tokens/attributes. 

- testcases: directory that contains all relevant files for testing, including the sample input files.        


