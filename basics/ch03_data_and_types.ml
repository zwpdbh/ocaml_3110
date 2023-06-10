(* 
What is variant and what is type:
Overall, the relationship between a variant and a type in OCaml is that a variant is a type constructor 
that allows you to define a new type with several possible values, 
and the type of a variant is the type that you define using the variant constructor. *)

let () = print_endline "Hello world from ch03_data_and_types !"

(* type t1 = C | D 
type t2 = D | E 

let x = D  *)

(* 3.4.1  Records*)
type ptype =
  | TNormal
  | TFire
  | TWater

type mon =
  { name : string
  ; hp : int
  ; ptype : ptype
  }

let x_value_of_type = { name = "Chara"; hp = 39; ptype = TFire }
let x_name = x_value_of_type.name
let { name = _; hp = x_hp; ptype = _ } = x_value_of_type
let x_hp_value () = print_int x_hp
let new_x_value = { x_value_of_type with name = "zhaowei" }

(* 3.4.2 *)
let thrd t =
  let _, _, z = t in
  z
;;

let thrdv2 (_, _, z) = z

(* 3.6 Type Synonyms *)
(* A type synonym is a new name for an already existing type *)
(* The two types are totally exchangable *)
type point = float * float

let get_x (x, _) = x
let p1 : point = 1., 2.
let p2 : float * float = 1., 3.
let a = get_x p1
let b = get_x p2

(* Association List *)
let d = [ "rectangle", 4; "nonagon", 9; "icosagon", 20 ];;

List.assoc_opt "rectangle" d

(* 3.9.4  recusive Variants*)
type intlist =
  | Nil
  | Cons of int * intlist

(* mutally recursive *)
type node =
  { value : int
  ; next : my_intlist
  }

and my_intlist =
  | Nil
  | Node of node

(* 3.9.5. Parameterized Variants, 
   instead of intList, we could create a general list *)
type 'a mylist =
  | Nil
  | Cons of 'a * 'a mylist

(* parametric polymorphism because the function don't care what the 'a is in 'a mylist *)
let rec length = function
  | Nil -> 0
  | Cons (_, t) -> 1 + length t
;;

(* 3.9.6. Polymorphic Variants OR anonymous variants
Occasionally, you might need a variant type only for the return value of a single function.   
*)
type fin_or_inf =
  | Finite of int
  | Infinity

let f_v1 = function
  | 0 -> Infinity
  | 1 -> Finite 1
  | n -> Finite (-n)
;;

(* With anonymous variants *)
let f_v2 = function
  | 0 -> `Infinity
  | 1 -> `Finite 1
  | n -> `Finite (-n)
;;

(* 3.10. Exceptions *)
(* exception A
exception B
exception Code of int
exception Details of string *)

(* 3.10.3 *)
let pattern_matching_example () =
  match List.hd [] with
  | [] -> "empty"
  | _ :: _ -> "nonempty"
  | exception Failure s -> Printf.sprintf "the exception is: %s" s
;;

(* 3.11.1 Representation with Tuples *)
type 'a tree =
  | Leaf
  | Node of 'a * 'a tree * 'a tree

let t =
  Node
    ( 4
    , Node (2, Node (1, Leaf, Leaf), Node (3, Leaf, Leaf))
    , Node (5, Node (6, Leaf, Leaf), Node (7, Leaf, Leaf)) )
;;

let rec size = function
  | Leaf -> 0
  | Node (_, l, r) -> 1 + size l + size r
;;

(* Exercise *)
let concat lst = 
  List.fold_left (fun acc x -> acc ^ x) "" lst