cmake_minimum_required(VERSION 3.0)
project(LALGCompiler)

find_package(FLEX)
find_program(GPERF_EXECUTABLE
	gperf
	/bin
	)

function(gperf_generate input output)
	add_custom_command(
		OUTPUT ${output}
		COMMAND ${GPERF_EXECUTABLE} -t < ${input} > ${output}
		DEPENDS ${input}
		COMMENT "Using gperf to generate ${output}"
		)
endfunction()

gperf_generate(reserved_words.gpref reserved_words.h)

FLEX_TARGET(CompilerLEXICAL lexical.lex ${CMAKE_CURRENT_BINARY_DIR}/lexical.c)

add_executable(
	LALGCompiler
	${FLEX_CompilerLEXICAL_OUTPUTS}
	reserved_words.h
	)
