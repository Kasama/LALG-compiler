cmake_minimum_required(VERSION 3.0)
project(LALGCompiler)

find_package(FLEX)

FLEX_TARGET(CompilerLEXICAL lexical.lex ${CMAKE_CURRENT_BINARY_DIR}/lexical.c)

add_executable(
	LALGCompiler
	${FLEX_CompilerLEXICAL_OUTPUTS}
	)
