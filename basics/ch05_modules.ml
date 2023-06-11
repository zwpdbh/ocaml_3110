(* Chapter 05 modular programming *)

module ListStack = struct
  (** [empty] is the empty stack. *)
  let empty = []

  (** [is_empty s] is whether [s] is empty. *)
  let is_empty = function
    | [] -> true
    | _ -> false
  ;;

  (** [push x s] pushes [x] onto the top of [s]. *)
  let push x s = x :: s

  (** [Empty] is raised when an operation cannot be applied
      to an empty stack. *)
  exception Empty

  (** [peek s] is the top element of [s].
      Raises [Empty] if [s] is empty. *)
  let peek = function
    | [] -> raise Empty
    | x :: _ -> x
  ;;

  (** [pop s] is all but the top element of [s].
      Raises [Empty] if [s] is empty. *)
  let pop = function
    | [] -> raise Empty
    | _ :: s -> s
  ;;
end

module M1 = struct
  let x = 0;;

  assert (x = 0)
end

module M2 = struct
  (* Requires: input is non-negative. *)
  let rec even = function
    | 0 -> true
    | n -> odd (n - 1)

  and odd = function
    | 0 -> false
    | n -> even (n - 1)
  ;;
end

(* 5.2.2. Scope and Open *)
(* But you can bring all of the definitions of a module into the current scope using open *)
(* Opening a module is like writing a local definition for each name defined in the module. *)
(* let open M in e. It makes all the names from M be in scope in e. *)

(* 5.2.3. Module Type Definitions , signature or interface*)

module type Fact = sig
  (** [fact n] is [n] factorial *)
  val fact : int -> int
end

module RecursiveFact : Fact = struct
  let rec fact n = if n = 0 then 1 else n * fact (n - 1)
end

module TailRecursiveFact : Fact = struct
  (* module definition as interface, only defined one in interface are available to user *)
  let rec fact_aux n acc = if n = 0 then acc else fact_aux (n - 1) (n * acc)
  let fact n = fact_aux n 1
end

(* 5.3.1. Loading Compiled Modules *)
(* #load *)
(* Compiling an OCaml file produces a module having the same name as the file, 
   but with the first letter capitalized. These compiled modules can be loaded into the toplevel using #load. *)

(* Module Type Definitions *)
module type Queue = sig
  (* abstract type *)
  type 'a queue

  val empty : 'a queue
  val peek : 'a queue -> 'a option
  val enqueue : 'a -> 'a queue -> 'a queue
  val dequeue : 'a queue -> 'a queue option
end

module ListQueue : Queue = struct
  (* front = [a; b]; back = [e; d; c] and the queue will be [a; b; c; d; e]*)
  type 'a queue =
    { front : 'a list
    ; back : 'a list
    }

  let empty = { front = []; back = [] }

  let peek = function
    | { front = []; _ } -> None
    | { front = x :: _; _ } -> Some x
  ;;

  let enqueue x = function
    | { front = []; _ } -> { front = [ x ]; back = [] }
    | q -> { q with back = x :: q.back }
  ;;

  let dequeue = function
    | { front = []; _ } -> None
    | { front = _ :: []; back } -> Some { front = List.rev back; back = [] }
    | { front = _ :: t; back } -> Some { front = t; back }
  ;;
end

(* Rebinding from module value *)
module CustomQueue : Queue = ListQueue

(* Option.map *)
let ( >>| ) opt f =
  match opt with
  | None -> None
  | Some x -> Some (f x)
;;

(* Option.bind *)
let ( >>= ) opt f =
  match opt with
  | None -> None
  | Some x -> f x
;;
