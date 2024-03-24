(* Libraries used  *)
exception Inpunt_Negativo
exception Inpunt_Maior_10k
open Scanf

(* Zarith library operations used, since operations between "int" and "Z.of_int", for example, are not allowed. *)
let ( ~+ ) = Z.add ;; 
let ( ~- ) = Z.sub ;; 
let ( ~* ) = Z.mul ;; 
let ( ~/ ) = Z.div ;;

(* Objective: To calculate Motzkin numbers, but it is necessary to record the values of the function as they are calculated, in order to avoid redundancies and to optimise results.
Therefore, whenever we invoke the function, we store the value in a "table" indexed by "n", using an Array.
However, it is necessary to consider that the function uses large input values, since the sequence will very quickly
return values that clearly exceed the capacity of integers in size, hence the implementation of the Zarith library *)

let motzkin_number n =
  let memo :  Z.t option array = Array.make(n+1) None in (* Otherwise, an Array that accepts the typing used by the Zarith library is invoked: Z.t option Array *)
    
    (* Start of recursive function *)
  let rec motzkin_number_recursiva n =
    let aux = Z.of_int n in(* Helper created to facilitate arithmetic operations using the Zarith library, since we can't use the variable "n" because it's an "int".*)

    (* Checks that the result has already been calculated and stored in the Array. *)
    match memo.(n) with
          | Some result -> (result) (*If the result is already in the Array, it keeps the value in the same position*)
          | None -> (* Otherwise, it performs the calculation, filling a previously empty entry in the Array with a new value *)
    
            let result= 
        
              if n = 0 then Z.of_int 1 (*Base case*)
              else if n = 1 then Z.of_int 1 (*Base case*)
              else
                (* Expression of the motzkin number: ((2n+1) * M(n-1) + (3n-3) * M(n-2))/(n+2) *)
                (~/) ((~+) ((~*) ((~+) ((~*) (Z.of_int 2) (aux)) (Z.of_int 1))  (motzkin_number_recursiva(n - 1))) ((~*) ((~-) ((~*) (Z.of_int 3) (aux)) (Z.of_int 3)) (motzkin_number_recursiva(n-2)))) ((~+)(aux)(Z.of_int 2))
                (*((Z.of_int 2) ~* (aux) ~+ (Z.of_int 1) ~* (motzkin_number_recursiva(n - 1))~+ (Z.of_int 3)~*(aux)~-(Z.of_int 3) ~* (motzkin_number_recursiva(n-2))) ~/ ((aux)~+(Z.of_int 2))*)
            in   
    memo.(n) <- Some result; (* Adds the result value to the array *)
    result
  in
  motzkin_number_recursiva n
let () = 
  let n = scanf "%d" (fun n -> n) in
  if n<0 then raise Inpunt_Negativo
  else if n>10000 then raise Inpunt_Maior_10k
  else let resultado = motzkin_number n in
  print_endline (Z.to_string resultado);


(* Bibliografia:
    https://cs3110.github.io/textbook/chapters/ds/memoization.html 
    https://docs.ocaml.pro/docs/LIBRARY.zarith@zarith.1.11/Z/index.html#val-of_int64 *)