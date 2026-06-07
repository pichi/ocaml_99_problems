open! Core
open Ocaml_99_problems

let%expect_test "P01 test last" =
  [ "List", [ "a"; "b"; "c"; "d" ]; "Empty", [] ]
  |> List.iter ~f:(fun (n, l) ->
    printf !"%s: %{sexp:string Option.t}\n" n (last l));
  [%expect
    {|
    List: (d)
    Empty: ()
    |}]
;;
