open! Core

let rec last = function
  | [] -> None
  | [ x ] -> Some x
  | x :: xs -> last xs
;;

let%expect_test "P01 test last" =
  [ "Empty", []; "Single", [ "a" ]; "List", [ "a"; "b"; "c"; "d" ] ]
  |> List.iter ~f:(fun (n, l) ->
    printf !"%s: %{sexp:string Option.t}\n" n (last l));
  [%expect
    {|
    Empty: ()
    Single: (a)
    List: (d)
    |}]
;;
