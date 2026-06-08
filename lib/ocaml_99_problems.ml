open! Core

let last = P01_last.last

module P02_last_two = P02_last_two

let last_two = P02_last_two.Loop.last_two
let last_two_n = P02_last_two.Naive.last_two
let p02_all = P02_last_two.all

let rec at n list =
  match n, list with
  | 0, x :: _ -> Some x
  | n, _ :: xs when n > 0 -> at (n - 1) xs
  | _, _ -> None
;;

let%expect_test "test last_two Some" =
  let result = at 2 [ "a"; "b"; "c"; "d"; "e" ] in
  Stdio.print_s [%sexp (result : string Option.t)];
  [%expect {| (c) |}]
;;

let%expect_test "test last_two None" =
  let result = at 2 [ "a" ] in
  Stdio.print_s [%sexp (result : string Option.t)];
  [%expect {| () |}]
;;
