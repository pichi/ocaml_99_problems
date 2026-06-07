open! Core

let last = P01_last.last

let last_two = function
  | [] | [ _ ] -> None
  | x1 :: x2 :: rest ->
    let rec lt a b = function
      | [] -> Some (a, b)
      | c :: rest -> lt b c rest
    in
    lt x1 x2 rest
;;

let%expect_test "test last_two Some" =
  let result = last_two [ "a"; "b"; "c"; "d" ] in
  Stdio.print_s [%sexp (result : (string * string) Option.t)];
  [%expect {| ((c d)) |}]
;;

let%expect_test "test last_two None" =
  let result = last_two [ "a" ] in
  Stdio.print_s [%sexp (result : (string * string) Option.t)];
  [%expect {| () |}]
;;

let rec last_two_n = function
  | [] | [ _ ] -> None
  | [ a; b ] -> Some (a, b)
  | _ :: xs -> last_two_n xs
;;

let%expect_test "test last_two Some" =
  let result = last_two_n [ "a"; "b"; "c"; "d" ] in
  Stdio.print_s [%sexp (result : (string * string) Option.t)];
  [%expect {| ((c d)) |}]
;;

let%expect_test "test last_two None" =
  let result = last_two_n [ "a" ] in
  Stdio.print_s [%sexp (result : (string * string) Option.t)];
  [%expect {| () |}]
;;

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
