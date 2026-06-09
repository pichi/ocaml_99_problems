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

let%test_unit "P01 quickcheck last = hd rev" =
  Quickcheck.test
    ~sexp_of:[%sexp_of: int list]
    ~shrinker:[%quickcheck.shrinker: int list]
    ~examples:[ []; [ 1 ]; [ 2; 3 ] ]
    ~trials:C.qc_trials
    [%quickcheck.generator: int list]
    ~f:(fun list ->
      let expected = List.hd (List.rev list) in
      let actual = last list in
      [%test_eq: int option] actual expected)
;;
