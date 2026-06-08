(** {1 99 Ocaml problems} *)

(** {2 1. Tail of a List} *)

(**
Write a function [last : 'a list -> 'a option] that returns the last
element of a list.

{[
# last ["a" ; "b" ; "c" ; "d"];;
- : string option = Some "d"
# last [];;
- : 'a option = None
]} *)
val last : 'a list -> 'a option

(** {2 2. Last Two Elements of a List} *)

(**
Find the last two (last and penultimate) elements of a list.

{[
# last_two ["a"; "b"; "c"; "d"];;
- : (string * string) option = Some ("c", "d")
# last_two ["a"];;
- : (string * string) option = None
]} *)
val last_two : 'a list -> ('a * 'a) option

(** Naive implementation
{@text[
  Name             Time R^2   Time/Run            95ci   Cycls/Run   mWd/Run   mGC/Run   Percentage   Speedup
 ---------------- ---------- ---------- --------------- ----------- --------- --------- ------------ ---------
  Loop last_two        1.00     1.91us   -0.44% +0.46%      4.57kc     5.00w   0.02e-3       84.38%      1.00
  Naive last_two       1.00     2.26us   -0.32% +0.37%      5.42kc     5.00w   0.02e-3      100.00%      1.19
]} *)
val last_two_n : 'a list -> ('a * 'a) option

(**/**)

module P02_last_two : sig
  module type Sig = sig
    val last_two : 'a list -> ('a * 'a) option
  end
end

val p02_all : (string * (module P02_last_two.Sig)) list

(**/**)

(** {2 3. N'th Element of a List} *)

(**
Find the N'th element of a list.

{[
# at 2 ["a"; "b"; "c"; "d"; "e"];;
- : string option = Some "c"
# at 2 ["a"];;
- : string option = None
]} *)
val at : int -> 'a list -> 'a option
