(*Run it in root of project:  dune exec -- bin/main.exe *)

open Basics
let () = 
  Ch03_data_and_types.pattern_matching_example() |> ignore;   
  Ch03_data_and_types.t |> Ch03_data_and_types.size  |> print_int |> ignore;
  
  print_endline "Hello, OCaml World"
  