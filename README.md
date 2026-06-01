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

Implementaion can be found in [lib/impl.ml](lib/impl.ml).

You can test functions in utop

```
> dune utop
utop # last [ "a"; "b"; "c"; "d" ];;
- : string option = Some "d"
```
