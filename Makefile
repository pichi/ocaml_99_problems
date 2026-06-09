.PHONY: all build run test doc watch clean fmt fmt-check bench

all: build

build:
	dune build

run:
	dune exec bin/main.exe -- $(ARGS)

test:
	dune runtest $(TEST_ARGS)

doc:
	dune build @doc

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
