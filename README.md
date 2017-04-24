LALG Compiler
=============

This is a project of a compiler for the LALG programming language (Simplified Pascal)

Progress
--------

[-] Lexical Analyzer

[ ] Syntactical Analyzer

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

First of all clone this repository
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

if you get an error about missing GPERF executable, you may need to install it. Alternativelly you can use the pre-compiled hash map, which is not recommended, to do so change the `cmake ..` command above to `cmake -D USE_FALLBACK_GPERF=true ..`. This will allow cmake to use the fallback pre-compiled header.

Running
-------

To run the executable you can provide the code to be compiled from the `stdin` and it will print the results to `stdout`
```sh
./LALGCompiler < test.pas > test.pas.analisys
cat test.pas.analisys
```

Alternatively the program can read from files represented by the arguments.
```sh
./LALGcompiler test.pas > test.pas.analisys
```
