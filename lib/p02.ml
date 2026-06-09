open! Core

module type Sig = sig
  val last_two : 'a list -> ('a * 'a) option
end

module Loop = struct
  let last_two = function
    | [] | [ _ ] -> None
    | x1 :: x2 :: rest ->
      let rec lt a b = function
        | [] -> Some (a, b)
        | c :: rest -> lt b c rest
      in
      lt x1 x2 rest
  ;;
end

module LoopLambda = struct
  let last_two =
    let rec lt a b = function
      | [] -> Some (a, b)
      | c :: rest -> lt b c rest
    in
    function
    | [] | [ _ ] -> None
    | x1 :: x2 :: rest -> lt x1 x2 rest
  ;;
end

module Naive = struct
  let rec last_two = function
    | [] | [ _ ] -> None
    | [ a; b ] -> Some (a, b)
    | _ :: xs -> last_two xs
  ;;
end

let all =
  [ "Loop", (module Loop : Sig)
  ; "LoopLambda", (module LoopLambda)
  ; "Naive", (module Naive)
  ]
;;

module Make_Test (M : Sig) = struct
  let%expect_test "P02 test last two" =
    [ "Empty", []
    ; "Single", [ "a" ]
    ; "Two", [ "a"; "b" ]
    ; "List", [ "a"; "b"; "c"; "d" ]
    ]
    |> List.iter ~f:(fun (n, l) ->
      printf !"%s: %{sexp:(string * string) Option.t}\n" n (M.last_two l));
    [%expect
      {|
      Empty: ()
      Single: ()
      Two: ((a b))
      List: ((c d))
      |}]
  ;;
end

module T1 = Make_Test (Loop)
module T2 = Make_Test (LoopLambda)
module T3 = Make_Test (Naive)
