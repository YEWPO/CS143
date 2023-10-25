CLASSDIR = ../..
BUILDDIR = ./build

FLEX = flex
FFLAGS = -d

LEXSRC = cool.flex
LEXGEN = cool-lex.cc

$(LEXGEN): $(LEXSRC) 
	$(FLEX) $(FFLAGS) -o $@ $^

CXX = g++
LD = g++
INCLUDEDIR = . \
						 $(CLASSDIR)/include/PA2 \
						 $(CLASSDIR)/src/PA2
CXXSRC = $(shell find . -name "*.cc")
CXXSRC += $(LEXGEN)
CXXFLAGS = -g -MMD -Wall -Wno-unused -Wno-write-strings
CXXFLAGS += $(addprefix -I, $(INCLUDEDIR))
OBJS = $(addprefix $(BUILDDIR)/, $(addsuffix .o, $(basename $(CXXSRC))))
LIBS = -lfl

$(BUILDDIR)/%.o: %.cc
	@mkdir -p $(dir $@) && echo + CXX $<
	@$(CXX) $(CXXFLAGS) -c -o $@ $<

-include $(addprefix $(BUILDDIR)/, $(addsuffix .d, $(basename $(CXXSRC))))

BIN = lexer

$(BIN): $(OBJS) $(LIBS)
	@echo LD "->" $(BIN)
	@$(LD) $(LDFLAGS) -o $@ $^

run: $(BIN)
	./$(BIN)

clean:
	rm -rf $(BUILDDIR) $(LEXGEN)

.PHONY: clean run
