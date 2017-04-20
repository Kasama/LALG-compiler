cmake_minimum_required(VERSION 3.0)
project(LALGCompiler)

find_package(FLEX)
find_program(GPERF_EXECUTABLE
	gperf
	/bin
	)

macro(gperf_generate tagName input output)
	add_custom_command(
		OUTPUT ${output}
		COMMAND ${GPERF_EXECUTABLE} -t < ${input} > ${output}
		DEPENDS ${input}
		COMMENT "Using gperf to generate ${output}"
		WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
		)
	set(GPERF_${tagName}_OUTPUT ${output})
endmacro()

gperf_generate(ReservedWords reserved_words.gpref ${CMAKE_CURRENT_BINARY_DIR}/reserved_words.h)

FLEX_TARGET(CompilerLEXICAL lexical.lex ${CMAKE_CURRENT_BINARY_DIR}/lexical.c)

add_executable(
	LALGCompiler
	${FLEX_CompilerLEXICAL_OUTPUTS}
	${GPERF_ReservedWords_OUTPUT}
	)
