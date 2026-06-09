# Ocaml 99 problems
99 Ocaml problems solutions by Pichi.

Code is tested with `ocaml-base-compiler.5.4.1,ocaml-options-vanilla.1`

## Install dependencies

Minimal I guess

```bash
opam install core core_bench ppx_jane
```

For fancy documentaion

```bash
opam install sherlodoc
```

## Usage

Run tests

```bash
make test
```

When you are hacking, for continuous checking and to make your LSP happy run in other terminal

```bash
make watch
```

Implementaion can be found in [lib/ocaml_99_problems.ml](lib/ocaml_99_problems.ml) and [lib/pXX.ml](lib/) files.

You can test functions in utop

```
> dune utop
utop # last [ "a"; "b"; "c"; "d" ];;
- : string option = Some "d"
```

If you want to see documentation

```bash
make doc-open
```

Just for documentation refresh. Documenation can be found in [lib/ocaml_99_problems.mli](lib/ocaml_99_problems.mli)

```bash
make doc
```

Run benchmark

```bash
make bench
```
