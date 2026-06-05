open! Core
open Core_bench
module O = Ocaml_99_problems

let () = Random.self_init ()
let last_tests = [ "at", O.at ]

let[@tail_mod_cons] rec rand_list = function
  | n when n > 0 -> Random.int 10000 :: rand_list (n - 1)
  | _ -> []
;;

let bench tests = Command_unix.run @@ Bench.make_command @@ tests

let () =
  if not !Sys.interactive
  then (
    let list = rand_list 1000 in
    let make_test (n, f) = Bench.Test.create ~name:n (fun () -> f 999 list) in
    last_tests |> List.map ~f:make_test |> bench)
;;
