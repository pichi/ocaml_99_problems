open! Core
open Core_bench
module O = Ocaml_99_problems

let () = Random.self_init ()
let last_tests = [ "at", O.at ]

let[@tail_mod_cons] rec rand_list = function
  | n when n > 0 -> Random.int 10000 :: rand_list (n - 1)
  | _ -> []
;;

let bench tests = Command_unix.run @@ Bench.make_command @@ tests

let () =
  if not !Sys.interactive
  then (
    let n = 1000 in
    let list = rand_list (n + 1) in
    let open Bench.Test in
    [ create ~name:"last" (fun () -> O.last list) ] |> bench;
    let btc (name, (module M : O.P02_last_two.Sig)) =
      let name = name ^ " last_two" in
      create ~name (fun () -> M.last_two list)
    in
    O.p02_all |> List.map ~f:btc |> bench;
    [ create ~name:"at" (fun () -> O.at n list) ] |> bench)
;;
