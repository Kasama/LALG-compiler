LALG Compiler
=============

This is a project of a compiler for the LALG programming language (Simplified Pascal)

Progress
--------

[-] Lexical Analyzer

[ ] Syntatical Analyzer

[ ] Semantical Analyzer

[ ] Optimizer

Requirements
------------

To build and run this project you will need:

- cmake
- lex (or flex)
- gperf
- gcc (or another C compiler)

Building
--------

first of all clone this repository
```sh
git clone https://github.com/Kasama/LALG-compiler.git
cd LALG-compiler
```
then create a build directory and run `cmake` and `make` from there
```sh
mkdir build
cd build
cmake ..
make
```
if everything goes well, you should have and executable called `LALGCompiler` inside the build directory

Running
-------

to run the executable you can provide the code to be compiled from the `stdin` and it will print the results to `stdout`
```sh
./LALGCompiler < test.pas > test.pas.analisys
cat test.pas.analisys
```
