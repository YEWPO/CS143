CLASSDIR= ../..
COOLC = ${CLASSDIR}/bin/coolc
SPIM = ${CLASSDIR}/bin/spim

SRC = $(shell find . -name "*.cl")
OBJ = out.s

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
	rm -f *.s

.PHONY: compile test clean
