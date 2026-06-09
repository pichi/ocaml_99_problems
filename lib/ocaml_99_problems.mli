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

Different [last_two] implementations

{@text[
  Name                           Time R^2   Time/Run            95ci   Cycls/Run   mWd/Run   mGC/Run   Percentage   Speedup
 ------------------------------ ---------- ---------- --------------- ----------- --------- --------- ------------ ---------
  Loop.last_two                      1.00     1.90us   -0.39% +0.43%      4.57kc     5.00w   0.02e-3       76.75%      1.00
  Loop.last_two rev_data             1.00     1.91us   -0.37% +0.41%      4.58kc     5.00w   0.02e-3       76.85%      1.00
  LoopLambda.last_two                1.00     1.90us   -0.46% +0.50%      4.56kc     5.00w   0.02e-3       76.54%      1.00
  LoopLambda.last_two rev_data       1.00     1.92us   -0.74% +0.77%      4.60kc     5.00w   0.02e-3       77.30%      1.01
  Naive.last_two                     0.99     2.34us   -1.39% +2.12%      5.61kc     5.00w   0.02e-3       94.21%      1.23
  Naive.last_two rev_data            0.93     2.48us   -4.56% +5.32%      5.96kc     5.00w   0.02e-3      100.00%      1.31
]}

List size is 1000 and rev_data menas list is in reverse order which is default way how to allocate
list.

[LoopLambda.last_two] is choosen as "optimal" solution. When compiled to native
code there is not difference between [Loop] and [LoopLambda] code but in bytecode
interpretation LoopLambda is faster.

{@text[
  Name                           Time R^2   Time/Run            95ci   Cycls/Run   mWd/Run   mGC/Run   Percentage   Speedup
 ------------------------------ ---------- ---------- --------------- ----------- --------- --------- ------------ ---------
  Loop.last_two                      0.99   191.81ns   -1.77% +2.79%     460.26c     8.00w   0.03e-3       91.23%      1.08
  Loop.last_two rev_data             0.99   191.61ns   -0.82% +0.95%     459.77c     8.00w   0.03e-3       91.14%      1.08
  LoopLambda.last_two                1.00   178.22ns   -0.69% +0.81%     427.66c     5.00w   0.02e-3       84.77%      1.00
  LoopLambda.last_two rev_data       1.00   178.25ns   -0.97% +1.34%     427.73c     5.00w   0.02e-3       84.78%      1.00
  Naive.last_two                     0.99   209.31ns   -1.16% +1.43%     502.26c     5.00w   0.02e-3       99.56%      1.17
  Naive.last_two rev_data            0.99   210.24ns   -1.17% +1.40%     504.50c     5.00w   0.02e-3      100.00%      1.18
]}

List size is 10 and it's benchmark of interpreted code.

*)
val last_two : 'a list -> ('a * 'a) option

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
