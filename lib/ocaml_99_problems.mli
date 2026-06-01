(** {1 99 Ocaml problems} *)

(** {2 1. Problem}

Write a function [last : 'a list -> 'a option] that returns the last
element of a list.

{[
    # last ["a" ; "b" ; "c" ; "d"];;
    - : string option = Some "d"
    # last [];;
    - : 'a option = None
]} *)

(** *)
val last : 'a list -> 'a option
