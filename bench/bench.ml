open! Core
open Core_bench
module O = Ocaml_99_problems

let () = Random.self_init ()
let last_tests = [ "at", O.at ]

let[@tail_mod_cons] rec rand_list = function
  | n when n > 0 -> Random.int 10000 :: rand_list (n - 1)
  | _ -> []
;;

(* lay data in reverse order in memomry *)
let rec rand_list_rev = function
  | n when n > 0 -> Random.int 10000 :: rand_list_rev (n - 1)
  | _ -> []
;;

let bench tests = Command_unix.run @@ Bench.make_command @@ tests

let () =
  if not !Sys.interactive
  then (
    let n = 1000 in
    let lists =
      List.map
        ~f:(fun (p, f) -> p, f n)
        [ "", rand_list; " rev", rand_list_rev ]
    in
    let n = n - 1 in
    let make_tests (n, f) =
      List.map
        ~f:(fun (p, l) -> Bench.Test.create ~name:(n ^ p) (fun () -> f l))
        lists
    in
    let bench tests = bench @@ List.concat_map ~f:make_tests tests in
    [ "last", O.last ] |> bench;
    let btc (name, (module M : O.P02_Sig)) = name ^ ".last_two", M.last_two in
    O.p02_all |> List.map ~f:btc |> bench;
    [ "at", O.at n ] |> bench)
;;
