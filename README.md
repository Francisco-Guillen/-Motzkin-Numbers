# Motzkin Numbers Calculator

This is an _OCaml_ program that calculates **Motzkin numbers**, a sequence of integers with various applications in mathematics and computer science.

## About the Project

The goal of this program is to calculate Motzkin numbers efficiently, avoiding redundancies and optimizing results through memoization.

## Getting Started

Before running the program, you need to install the **Zarith library**. You can do this using the following command:

```bashrc
opam install zarith.1.12
```

## How It Works

The program uses the _Zarith library_ for handling large integers, as the values of the Motzkin sequence can quickly exceed the capacity of standard integers in _OCaml_.
It implements a recursive function motzkin_number, which calculates Motzkin numbers for a given 'n'. The function uses memoization to store previously calculated results, improving the efficiency of the calculation.

## Usage
To run the program, you need to have an _OCaml_ environment set up on your machine. Compile the source code using the _OCaml_ compiler and execute the program, providing an integer n as input. The program will calculate the corresponding Motzkin number and display it in the output.

```bashrc
ocamlfind ocamlopt -package zarith -linkpkg -o ProblemaA  ProblemaA.ml
./ProblemaA
```
## References

- [Memoization - CS 3110 Spring 2021](https://cs3110.github.io/textbook/chapters/ds/memoization.html)
- [Zarith - Documentation](https://docs.ocaml.pro/docs/LIBRARY.zarith@zarith.1.11/Z/index.html)
