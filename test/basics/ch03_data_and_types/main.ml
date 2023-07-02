(* dune exec -- test/basics/ch03_data_and_types/main.exe *)
open OUnit2
open Basics
open Basics.Ch03_data_and_types

let test_ch03 =
  "test ch03 data and types"
  >::: [ ("tree length"
          >:: fun _ ->
          assert_equal 7 (Ch03_data_and_types.t |> size) ~printer:string_of_int)
       ; ("concat case01"
          >:: fun _ -> assert_equal "abcd" (Ch03_data_and_types.concat [ "a"; "b"; "cd" ])
         )
       ; ("concat case01" >:: fun _ -> assert_equal "" (Ch03_data_and_types.concat []))
       ]
;;

let _ = run_test_tt_main test_ch03

let test_take =
  "test take the first n elements from a list"
  >::: [ ("case01" >:: fun _ -> assert_equal [ 1; 2; 3 ] (take 3 [ 1; 2; 3; 4; 5 ]))
       ; ("case02" >:: fun _ -> assert_equal [] (take 0 [ 1; 2; 3; 4; 5 ]))
       ]
;;

let _ = run_test_tt_main test_take

let test_drop =
  "test drop the first n elements from a list, return what is left in the list."
  >::: [ ("case01" >:: fun _ -> assert_equal [] (drop 100 [ 1; 2; 3; 3; 4 ]))
       ; ("case02" >:: fun _ -> assert_equal [ 3; 4; 5 ] (drop 2 [ 1; 2; 3; 4; 5 ]))
       ]
;;

let _ = run_test_tt_main test_drop
