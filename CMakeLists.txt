cmake_minimum_required(VERSION 3.0)
project(LALGCompiler)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)
find_package(GPERF)

if(GPERF_FOUND)
	GPERF_TARGET(ReservedWords src/reserved_words.gpref ${CMAKE_CURRENT_BINARY_DIR}/reserved_words.h)
else()
	if(USE_FALLBACK_GPERF)
		MESSAGE(STATUS "Could NOT find gperf executable, using fallback pre-compiled hash map")
		set(GPERF_ReservedWords_OUTPUTS ${CMAKE_CURRENT_BINARY_DIR}/reserved_words.h)
		configure_file(src/reserved_words_fallback.h ${GPERF_ReservedWords_OUTPUTS} COPYONLY)
	else()
		MESSAGE(
			FATAL_ERROR
			"Could not find gperf executable. Please check if it's installed or run cmake with '-D USE_FALLBACK_GPERF=true' option to use precompiled version"
			)
	endif()
endif()

BISON_TARGET(
	CompilerSYNTATIC
	src/syntatic.y
	${CMAKE_CURRENT_BINARY_DIR}/syntatic.c
	COMPILE_FLAGS -y
	COMPILE_FLAGS -d
	COMPILE_FLAGS -v
	COMPILE_FLAGS --warning=all
	)

FLEX_TARGET(
	CompilerLEXICAL
	src/lexical.lex
	${CMAKE_CURRENT_BINARY_DIR}/lexical.c
	)

add_executable(
	LALGCompiler
	${BISON_CompilerSYNTATIC_OUTPUTS}
	${FLEX_CompilerLEXICAL_OUTPUTS}
	${GPERF_ReservedWords_OUTPUTS}
	)
