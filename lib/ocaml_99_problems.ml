open! Core

let last = P01.last

module type P02_Sig = P02.Sig

let last_two = P02.LoopLambda.last_two
let p02_all = P02.all

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
