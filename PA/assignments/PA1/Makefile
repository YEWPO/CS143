CLASSDIR= ../..
BUILDDIR = ./build
COOLC = ${CLASSDIR}/bin/coolc
SPIM = ${CLASSDIR}/bin/spim

$(shell mkdir -p $(BUILDDIR))

SRC = $(shell find . -name "*.cl")
OBJ = $(BUILDDIR)/out.s

compile: $(OBJ)

$(OBJ): $(SRC)
	@echo + COOLC $^
	@$(COOLC) -o $@ $^ 

run: $(OBJ)
	@echo RUN
	@$(SPIM) -file $^

test:	$(OBJ)
	@echo + TEST stack.test
	@$(SPIM) -file $^ < stack.test

clean :
	rm -rf $(BUILDDIR)

.PHONY: compile test clean
