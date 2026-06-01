# Ocaml 99 problems
99 Ocaml problems solutions by Pichi.

Code is tested with `ocaml-base-compiler.5.4.1,ocaml-options-vanilla.1`

Install dependencies

```bash
opam install ppx_jane
```

Run tests

```bash
dune test
```

Implementaion can be found in
[lib/ocaml_99_problems.ml](lib/ocaml_99_problems.ml).

You can test functions in utop

```
> dune utop
utop # last [ "a"; "b"; "c"; "d" ];;
- : string option = Some "d"
```

If you want to see documenatation

```bash
opam install odoc
dune ocaml doc
```
