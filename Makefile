.PHONY: all build run test doc doc-open watch clean fmt fmt-check bench bench-bytes

all: build

build:
	dune build

run:
	dune exec bin/main.exe -- $(ARGS)

test:
	dune runtest $(TEST_ARGS)

doc:
	dune build @doc

doc-open:
	dune ocaml doc

TARGET ?= build @check
watch:
	dune $(TARGET) --watch

clean:
	dune clean

# Automaticky opraví a naformátuje zdrojové soubory
fmt:
	dune fmt

fmt-check:
	dune build @fmt

bench:
	dune build @bench

bench-bytes:
	dune exec bench/bench.bc -- -ascii -quota 3 +time cycles alloc gc percentage speedup
