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
]}

{@text[
  Name            Time R^2   Time/Run            95ci   Cycls/Run   mWd/Run   Percentage   Speedup
 --------------- ---------- ---------- --------------- ----------- --------- ------------ ---------
  last                1.00     1.52us   -0.45% +0.50%      3.66kc     2.00w       99.44%      1.00
  last rev_data       1.00     1.53us   -0.56% +0.64%      3.68kc     2.00w      100.00%      1.01
]}

List size is 1000 and rev_data menas list is in reverse order which is default way how to allocate
list.
*)
val last : 'a list -> 'a option

(** {2 2. Last Two Elements of a List} *)

(**
Find the last two (last and penultimate) elements of a list.

{[
# last_two ["a"; "b"; "c"; "d"];;
- : (string * string) option = Some ("c", "d")
# last_two ["a"];;
- : (string * string) option = None
]}
*)
val last_two : 'a list -> ('a * 'a) option

(** Naive implementation
{@text[
  Name                      Time R^2   Time/Run            95ci   Cycls/Run   mWd/Run   mGC/Run   Percentage   Speedup
 ------------------------- ---------- ---------- --------------- ----------- --------- --------- ------------ ---------
  Loop.last_two                 1.00     1.89us   -0.34% +0.41%      4.54kc     5.00w   0.02e-3       81.71%      1.00
  Loop.last_two rev_data        1.00     1.93us   -0.38% +0.40%      4.62kc     5.00w   0.02e-3       83.23%      1.02
  Naive.last_two                1.00     2.26us   -0.42% +0.48%      5.43kc     5.00w   0.02e-3       97.86%      1.20
  Naive.last_two rev_data       1.00     2.31us   -0.45% +0.48%      5.55kc     5.00w   0.02e-3      100.00%      1.22
]}

List size is 1000 and rev_data menas list is in reverse order which is default way how to allocate
list.
*)
val last_two_n : 'a list -> ('a * 'a) option

(**/**)

module type P02_Sig = sig
  val last_two : 'a list -> ('a * 'a) option
end

val p02_all : (string * (module P02_Sig)) list

(**/**)

(** {2 3. N'th Element of a List} *)

(**
Find the N'th element of a list.

{[
# at 2 ["a"; "b"; "c"; "d"; "e"];;
- : string option = Some "c"
# at 2 ["a"];;
- : string option = None
]}

{@text[
  Name          Time R^2   Time/Run            95ci   Cycls/Run   mWd/Run   Percentage   Speedup
 ------------- ---------- ---------- --------------- ----------- --------- ------------ ---------
  at                1.00     1.51us   -0.65% +0.71%      3.62kc     2.00w       97.86%      1.00
  at rev_data       1.00     1.54us   -0.63% +0.70%      3.69kc     2.00w      100.00%      1.02
]}

List size is 1000 and rev_data menas list is in reverse order which is default way how to allocate
list.
*)
val at : int -> 'a list -> 'a option
