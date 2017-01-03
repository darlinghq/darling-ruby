project(ruby)

include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}/include
	${CMAKE_CURRENT_SOURCE_DIR}/ruby
	${CMAKE_CURRENT_SOURCE_DIR}/ruby/include

	${CMAKE_SOURCE_DIR}/platform-include
	${CMAKE_SOURCE_DIR}/src/libc/gen
)

set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/darling")
set(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

add_definitions(
	-Wno-unused-function
	-Wno-shift-negative-value
	-Wno-parentheses
	-Wno-dangling-else
	-Wno-deprecated-declarations
	-Wno-implicit-int
	-Wno-implicit-function-declaration
	-Wno-return-type
	-Wno-macro-redefined
	-Wno-uninitialized
	-D_FORTIFY_SOURCE=2
	-D_XOPEN_SOURCE
	-D_DARWIN_C_SOURCE
	-D_DARWIN_UNLIMITED_SELECT
	-D_REENTRANT
	-D__APPLE__
	-DMACOSX

	-DFALSE=0
	-DTRUE=1

	-DDTRACE_PROBES_DISABLED # So nice of them to have this!
)

set(ruby_link_flags "-Wl,-undefined,dynamic_lookup -Wl,-multiply_defined,suppress -fstack-protector -Wl,-u,_objc_msgSend -Wl,-pie -Wl,--version-script=${DARLING_TOP_DIRECTORY}/darwin.map -nodefaultlibs -nostdlib")

# The C_FLAG -fno-strict-overflow should be used, but Clang doesn't know what it is
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc -fwrapv -fstack-protector -fvisibility=hidden -pipe -include ruby/config.h -include ruby/missing.h -include ruby.h")

set(CMAKE_SHARED_LINKER_FLAGS "{ruby_link_flags} -dynamic -bundle")
set(CMAKE_EXE_LINKER_FLAGS "${ruby_link_flags}")

add_library(rubycore OBJECT
	ruby/dln.c
	ruby/encoding.c
	ruby/version.c
	ruby/array.c
	ruby/bignum.c
	ruby/class.c
	ruby/compar.c
	ruby/complex.c
	ruby/dir.c
	ruby/dln_find.c
	ruby/enum.c
	ruby/enumerator.c
	ruby/error.c
	ruby/eval.c
	ruby/load.c
	ruby/proc.c
	ruby/file.c
	ruby/gc.c
	ruby/hash.c
	ruby/inits.c
	ruby/io.c
	ruby/marshal.c
	ruby/math.c
	ruby/node.c
	ruby/numeric.c
	ruby/object.c
	ruby/pack.c
	ruby/parse.c
	ruby/process.c
	ruby/random.c
	ruby/range.c
	ruby/rational.c
	ruby/re.c
	ruby/regcomp.c
	ruby/regenc.c
	ruby/regerror.c
	ruby/regexec.c
	ruby/regparse.c
	ruby/regsyntax.c
	ruby/ruby.c
	ruby/safe.c
	ruby/signal.c
	ruby/sprintf.c
	ruby/st.c
	ruby/strftime.c
	ruby/string.c
	ruby/struct.c
	ruby/time.c
	ruby/transcode.c
	ruby/util.c
	ruby/variable.c
	ruby/compile.c
	ruby/debug.c
	ruby/iseq.c
	ruby/vm.c
	ruby/vm_dump.c
	ruby/vm_backtrace.c
	ruby/vm_trace.c
	ruby/thread.c
	ruby/cont.c

	ruby/enc/ascii.c
	ruby/enc/us_ascii.c
	ruby/enc/unicode.c
	ruby/enc/utf_8.c

	ruby/newline.c
	ruby/missing/setproctitle.c
	gen/prelude.c
	ruby/dmyext.c
)

add_library(ruby-static STATIC
	$<TARGET_OBJECTS:rubycore>
)
