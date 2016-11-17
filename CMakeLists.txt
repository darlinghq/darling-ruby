project(ruby)

cmake_minimum_required(VERSION 2.4.0)

if(COMMAND cmake_policy)
	cmake_policy(SET CMP0003 NEW)
	cmake_policy(SET CMP0005 NEW)
endif(COMMAND cmake_policy)

add_definitions(-DTARGET_OS_MAC=1)
add_definitions(-D__APPLE__ -D__MACH__ -D__DYNAMIC__ -DMACOSX)
add_definitions(-DNDEBUG -DHAVE_NDBM_H -DHAVE_SEM_OPEN -DOBJC2RUNTIME)

add_definitions(-DVERSION="2.0" -DPREFIX="/System/Library/Frameworks/Ruby.framework/Versions/2.0" -DSUFFIX="${BITS}")
add_definitions(-DPLATFORM="darwin")

add_definitions(-DFALSE=0 -DTRUE=1)

add_definitions(-D _XOPEN_SOURCE -D _DARWIN_C_SOURCE -D _DARWIN_UNLIMITED_SELECT -D _REENTRANT -D RUBY_EXPORT -D FORTIFY_SOURCE=2)
set(RUBY_WARN_FLAGS "-Wall -Wextra -Wno-unused-parameter -Wno-parentheses -Wno-macro-redefined -Wno-comment -Wno-shift-negative-value -Wno-long-long -Wno-missing-field-initializers -Wno-unused-function -Wno-implicit-function-declaration -Wno-format -Wno-uninitialized")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${RUBY_WARN_FLAGS} -nostdinc -fwrapv -fPIC -ggdb -include ruby/config.h -include ruby/missing.h -include ruby/defines.h -include ruby/ruby.h")
set(CMAKE_SHARED_LINKER_FLAGS "-nodefaultlibs -nostdlib -fPIC -Wl,--version-script=${DARLING_TOP_DIRECTORY}/darwin.map")
set(CMAKE_EXE_LINKER_FLAGS "-nodefaultlibs -nostdlib -fPIC -Wl,--version-script=${DARLING_TOP_DIRECTORY}/darwin.map")

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${DARLING_TOP_DIRECTORY}/src/libc/include/FreeBSD)
include_directories(${DARLING_TOP_DIRECTORY}/src/libc/include/NetBSD)
include_directories(${DARLING_TOP_DIRECTORY}/src/libinfo)
include_directories(${DARLING_TOP_DIRECTORY}/src/libc/gen)
include_directories(${DARLING_TOP_DIRECTORY}/src/libc/darwin)
include_directories(${DARLING_TOP_DIRECTORY}/src/libc/stdtime/FreeBSD)
include_directories(${DARLING_TOP_DIRECTORY}/src/launchd/liblaunch)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/libdispatch)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/zlib)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/bzip2)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/expat/expat/lib)
include_directories(${DARLING_TOP_DIRECTORY}/src/ncurses/include)
include_directories(${DARLING_TOP_DIRECTORY}/src/ncurses/panel)
include_directories(${DARLING_TOP_DIRECTORY}/src/libedit/src)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/openssl/src/include)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/corefoundation/Headers)
include_directories(${CMAKE_BINARY_DIR}/src/external/corefoundation/Headers)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/foundation/Headers)
include_directories(${CMAKE_BINARY_DIR}/src/external/foundation/Headers)
include_directories(${DARLING_TOP_DIRECTORY}/platform-include/pthread)

add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/id.h
	COMMAND ruby tool/generic_erb.rb --output ${CMAKE_CURRENT_BINARY_DIR}/id.h template/id.h.tmpl
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/id.c
	COMMAND ruby tool/generic_erb.rb --output ${CMAKE_CURRENT_BINARY_DIR}/id.c template/id.c.tmpl
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/node_name.inc
	COMMAND ruby tool/node_name.rb node.h > ${CMAKE_CURRENT_BINARY_DIR}/node_name.inc
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/encdb.h
	COMMAND ruby tool/generic_erb.rb -c -o ${CMAKE_CURRENT_BINARY_DIR}/encdb.h template/encdb.h.tmpl
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/transdb.h
	COMMAND ruby tool/generic_erb.rb -c -o ${CMAKE_CURRENT_BINARY_DIR}/transdb.h template/transdb.h.tmpl
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

set(RUBY_PREBUILD_FILES
	${CMAKE_CURRENT_BINARY_DIR}/id.h
	${CMAKE_CURRENT_BINARY_DIR}/id.c
	${CMAKE_CURRENT_BINARY_DIR}/node_name.inc
	${CMAKE_CURRENT_BINARY_DIR}/encdb.h
	${CMAKE_CURRENT_BINARY_DIR}/transdb.h
)

add_custom_target(ruby-genfiles ALL DEPENDS ${RUBY_PREBUILD_FILES})

set(miniruby_sources
	dmydln.c
	dmyencoding.c
	dmyversion.c
	miniprelude.c
	array.c
	bignum.c
	class.c
	compar.c
	complex.c
	dir.c
	dln_find.c
	enum.c
	enumerator.c
	error.c
	eval.c
	load.c
	proc.c
	file.c
	gc.c
	hash.c
	inits.c
	io.c
	marshal.c
	math.c
	node.c
	numeric.c
	object.c
	pack.c
	parse.c
	process.c
	random.c
	range.c
	rational.c
	re.c
	regcomp.c
	regenc.c
	regerror.c
	regexec.c
	regparse.c
	regsyntax.c
	ruby.c
	safe.c
	signal.c
	sprintf.c
	st.c
	strftime.c
	string.c
	struct.c
	time.c
	transcode.c
	util.c
	variable.c
	compile.c
	debug.c
	iseq.c
	vm.c
	vm_dump.c
	vm_backtrace.c
	vm_trace.c
	thread.c
	cont.c

	enc/ascii.c
	enc/us_ascii.c
	enc/unicode.c
	enc/utf_8.c

	newline.c

	missing/setproctitle.c

	dmyext.c
)

if (NOT DARLING_NO_EXECUTABLES)
	add_darling_executable(miniruby main.c ${miniruby_sources})
	add_dependencies(miniruby ruby-genfiles)
	target_link_libraries(miniruby system objc)
endif (NOT DARLING_NO_EXECUTABLES)
