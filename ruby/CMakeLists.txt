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

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc -fwrapv -fPIC -ggdb -O0")
set(CMAKE_SHARED_LINKER_FLAGS "-nodefaultlibs -nostdlib -fPIC -Wl,--version-script=${DARLING_TOP_DIRECTORY}/darwin.map")
set(CMAKE_EXE_LINKER_FLAGS "-nodefaultlibs -nostdlib -fPIC -Wl,--version-script=${DARLING_TOP_DIRECTORY}/darwin.map")

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/Include)
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
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/Modules/_ctypes/libffi_osx/include)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/openssl/src/include)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/corefoundation/Headers)
include_directories(${CMAKE_BINARY_DIR}/src/external/corefoundation/Headers)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/foundation/Headers)
include_directories(${CMAKE_BINARY_DIR}/src/external/foundation/Headers)
include_directories(${DARLING_TOP_DIRECTORY}/src/external/sqlite)

set(ruby_sources
	addr2line.c
	array.c
	bignum.c
	class.c
	compar.c
	compile.c
	complex.c
	cont.c
	debug.c
	dir.c
	dln.c
	dln_find.c
	dmydln.c
	dmyencoding.c
	dmyext.c
	dmyversion.c

	enc/ascii.c
	enc/big5.c
	enc/cp949.c
	enc/emacs_mule.c
	enc/encdb.c
	enc/encinit.c
	enc/encinit.c.erb
	enc/euc_jp.c
	enc/euc_kr.c
	enc/euc_tw.c
	enc/gb18030.c
	enc/gb2312.c
	enc/gbk.c
	enc/iso_8859_10.c
	enc/iso_8859_11.c
	enc/iso_8859_13.c
	enc/iso_8859_14.c
	enc/iso_8859_15.c
	enc/iso_8859_16.c
	enc/iso_8859_1.c
	enc/iso_8859_2.c
	enc/iso_8859_3.c
	enc/iso_8859_4.c
	enc/iso_8859_5.c
	enc/iso_8859_6.c
	enc/iso_8859_7.c
	enc/iso_8859_8.c
	enc/iso_8859_9.c
	enc/koi8_r.c
	enc/koi8_u.c
	enc/mktable.c
	enc/prelude.rb
	enc/shift_jis.c

)
