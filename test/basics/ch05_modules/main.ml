(* dune exec -- test/basics/ch05_modules/main.exe *)

open OUnit2

(* open Basics *)
open Basics.Ch05_modules

let q = ListQueue.(empty |> enqueue 42 |> dequeue >>| enqueue 43 >>= dequeue)

let test_queue =
  match q with
  | Some x ->
    "test queue module"
    >::: [ ("case01" >:: fun _ -> assert_equal (ListQueue.peek x) None) ]
  | None -> "test queue module" >::: []
;;

let _ = run_test_tt_main test_queue
