.PHONY: all build run test watch clean fmt fmt-check bench

all: build

build:
	dune build

run:
	dune exec bin/main.exe -- $(ARGS)

test:
	dune runtest $(TEST_ARGS)

TARGET ?= build
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
