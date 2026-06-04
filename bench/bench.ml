open! Core
open Core_bench
module O = Ocaml_99_problems

let () = Random.self_init ()
let last_tests = [ "last_two", O.last_two; "last_two_n", O.last_two_n ]

let rec rand_list = function
  | n when n > 0 -> Random.int 10000 :: rand_list (n - 1)
  | _ -> []
;;

let bench tests = Command_unix.run @@ Bench.make_command @@ tests

let () =
  if not !Sys.interactive
  then (
    let list = rand_list 1000 in
    let make_test (n, f) = Bench.Test.create ~name:n (fun () -> f list) in
    last_tests |> List.map ~f:make_test |> bench)
;;
