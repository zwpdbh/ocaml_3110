# README

## How to use a local library in a project

Just use it as same as external library.

### What is a library

A library is a collection of modules

- A library's name is usually the name of the folder contains the dune file.
- The dune file simply specifies the compiled result is a library.

  ```dune
  (library
  (name basics)
  (libraries ))
  ```

- Each file with in the folder will be compiled and becomes a module. The name of the module is the name of the file with Captialized first letter.

### How to use it

For example, suppose we have above above `dune` file and a file `basics/ch03_data_and_types.ml`, it will become `Ch03_data_and_types` module in library `Basic`.

- At last, we just specify the library name in the libraries stanza in a bin project as:

  ```dune
  (executable
  (public_name ocaml_3110)
  (name main)
  (libraries ocaml_3110 basics))
  ```

  Use it: 1) open the library 2) use the function from module

  ```ocaml
  open Basics
  let () =
    Ch03_data_and_types.pattern_matching_example() |> ignore;
    print_endline "Hello, World!"
  ```

### How to use a module in utop

- Local module from source code

  ```utop
  #mod_use "basics/ch05_modules.ml";;
  open Ch05_modules.ListQueue;;
  ```

- External module installed from depend stanza
  ```utop
  #require "yojson";;
  open Yojson;;
  ```
