(* dune exec -- test/basics/ch03_data_and_types/main.exe *)
open OUnit2

open Basics
open Basics.Ch03_data_and_types

(* let test_ch03_v1 = "test ch03 data and types" >::: [
  "tree length" >:: (fun _ -> assert_equal 7 (Ch03_data_and_types.t |> size) ~printer: string_of_int);
  "concat case01" >:: (fun _ -> assert_equal "abcd" (Ch03_data_and_types.concat ["a"; "b"; "cd"]));
  "concat case01" >:: (fun _ -> assert_equal "" (Ch03_data_and_types.concat [])) 
] *)

let test_ch03 = "test ch03 data and types" >::: [
  "tree length" >:: (fun _ -> assert_equal 7 (Ch03_data_and_types.t |> size) ~printer: string_of_int);
  "concat case01" >:: (fun _ -> assert_equal "abcd" (Ch03_data_and_types.concat ["a"; "b"; "cd"]));
  "concat case01" >:: (fun _ -> assert_equal "" (Ch03_data_and_types.concat [])) 
]

(* we can run multiple test instances  *)
(* let _ = run_test_tt_main test_ch03_v1 *)
let _ = run_test_tt_main test_ch03