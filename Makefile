# 
# Rules to compile the ocaml source code into binary, 
#  and to clean up some intermediate object files. 
#
# Author:  Lisong Guo <lisong.guo@lip6.fr>
# Date:    6 Mar, 2013
#

# 'native_code' or 'byte_code' 
OUTPUT := native_code

ifeq ($(OUTPUT), byte_code)
    # Compiler for bytecode, add debugging information by default
    CC=ocamlc -g 
    SYSLIBS=str.cma unix.cma
    OTHER_LIBS=libs/xml-light/xml-light.cma
    OTHER_LIBS_TARGET=all
    OBJECTS=$(SOURCES:.ml=.cmo)
else
    # Compiler for optimized native code 
    CC=ocamlopt
    SYSLIBS=str.cmxa unix.cmxa
    OTHER_LIBS=libs/xml-light/xml-light.cmxa
    OTHER_LIBS_TARGET=opt
    OBJECTS=$(SOURCES:.ml=.cmx)
endif

# -g: add debugging information 
CFLAGS=-c
LDFLAGS=
OCAMLDEP=ocamldep 
DEPENDENCIES=$(shell touch .depend)
TARGET=codeparser
MAKESUBDIRS=libs/xml-light
INCLUDEDIRS=libs/xml-light
INCLUDES=$(INCLUDEDIRS:%=-I %)

# Put the entrance program at the end of the list for sake of compiling
MAIN_SOURCE_FILE=main.ml
SOURCES=$(shell ls *.ml | grep -v $(MAIN_SOURCE_FILE)) $(MAIN_SOURCE_FILE)
OBJECTS_PAT=*.cmi *.cmo *.cmx *.o *.mli
TEST_SOURCES=$(shell ls *.ml | grep -v $(MAIN_SOURCE_FILE))

OCAML_LEXER=ocamllex
OCAML_PARSER=ocamlyacc
LEXER_GRAMMAR=$(shell ls *.mll)
PARSER_GRAMMAR=$(shell ls *.mly)


all: lexer parser makesubdir $(SOURCES) $(TARGET)


$(TARGET): $(OBJECTS)
	$(CC) -o $(TARGET) $(SYSLIBS) $(OTHER_LIBS) $^

# Control the order of compiling through defining the dependencies
# Can also be found in file '.depend'
main.ml: codelexer.ml codeparser.ml

%.cmx: 
	$(CC) $(CFLAGS) $(INCLUDES) $*.ml

%.cmo: 
	$(CC) $(CFLAGS) $(INCLUDES) $*.ml

lexer:
	$(OCAML_LEXER) $(LEXER_GRAMMAR)

# Generate the parser from the grammar, the '-v' option produces the state machine. 
parser: 
	$(OCAML_PARSER) -v $(PARSER_GRAMMAR)
	$(CC) $(CFLAGS) $(PARSER_GRAMMAR:.mly=.mli)

# Make the third-party libraries in the sub-directories before the main program 
makesubdir: 
	@set -e; for i in $(MAKESUBDIRS); do $(MAKE) -C $$i $(OTHER_LIBS_TARGET); done

test: $(TEST_SOURCES)
	$(CC) -o test $(SYSLIBS) $(TEST_SOURCES)

cleanobj:
	rm -f $(OBJECTS_PAT)

# Note: always keeping the .depend file 
clean:
	rm -f $(TARGET) $(OBJECTS_PAT) $(LEXER_GRAMMAR:.mll=.ml) $(PARSER_GRAMMAR:.mly=.ml) $(PARSER_GRAMMAR:.mly=.output)


# Dependencies 
depend::
	$(OCAMLDEP) *.ml *.mli > .depend

# Use the '-include' directive to generate the dependency files before this run of Make. 
# directive of GNU Make, to 'include' before Make runs, won't generate WARNING when the files do not exist.
-include .depend

