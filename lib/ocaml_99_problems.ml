open! Core

let rec last = function
  | [] -> None
  | [ x ] -> Some x
  | x :: xs -> last xs
;;

let%expect_test "test last Some" =
  let result = last [ "a"; "b"; "c"; "d" ] in
  Stdio.print_s [%sexp (result : string Option.t)];
  [%expect {| (d) |}]
;;

let%expect_test "test last None" =
  let result = last [] in
  Stdio.print_s [%sexp (result : string Option.t)];
  [%expect {| () |}]
;;
