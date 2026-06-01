open! Core
open Core_bench
module O = Ocaml_99_problems

let () = Random.self_init ()

let rec last_p = function
  | [ x ] -> Some x
  | x :: xs -> last_p xs
  | [] -> None
;;

let is_empty = function
  | _ :: _ -> false
  | _ -> true
;;

let rec last_m = function
  | x :: xs -> if is_empty xs then Some x else last_p xs
  | [] -> None
;;

let last_tests = [ "last_p", last_p; "last", O.last; "last_m", last_m ]

let rec rand_list = function
  | n when n > 0 -> Random.int 10000 :: rand_list (n - 1)
  | _ -> []
;;

let bench tests = Command_unix.run @@ Bench.make_command @@ tests

let () =
  if not !Sys.interactive
  then (
    let list = rand_list 1000 in
    let make_test (n, f) =
      Bench.Test.create ~name:n (fun () -> ignore (f list))
    in
    last_tests |> List.map ~f:make_test |> bench)
;;
