open! Core

let rec at n list =
  match n, list with
  | 0, x :: _ -> Some x
  | n, _ :: xs when n > 0 -> at (n - 1) xs
  | _, _ -> None
;;

let%expect_test "P01 test last" =
  [ "Empty", []; "Single", [ "a" ]; "List", [ "a"; "b"; "c"; "d" ] ]
  |> List.iter ~f:(fun (name, l) ->
    [ 0; 1; 2 ]
    |> List.iter ~f:(fun n ->
      printf !"%d %s: %{sexp:string Option.t}\n" n name (at n l)));
  [%expect
    {|
    0 Empty: ()
    1 Empty: ()
    2 Empty: ()
    0 Single: (a)
    1 Single: ()
    2 Single: ()
    0 List: (a)
    1 List: (b)
    2 List: (c)
    |}]
;;
