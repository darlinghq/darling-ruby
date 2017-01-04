project(ruby)

include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}/include
	${CMAKE_CURRENT_SOURCE_DIR}/ruby
	${CMAKE_CURRENT_SOURCE_DIR}/ruby/include

	${CMAKE_SOURCE_DIR}/platform-include
	${CMAKE_SOURCE_DIR}/src/libc/gen
	${CMAKE_SOURCE_DIR}/src/CommonCrypto
	${CMAKE_SOURCE_DIR}/src/ncurses/include
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

# FIXME: These are for ld64 -Wl,-multiply_defined,suppress
set(ruby_link_flags "-Wl,-undefined,dynamic_lookup -Wl,--allow-multiple-definition -fstack-protector -Wl,-u,_objc_msgSend -Wl,-pie -Wl,--version-script=${DARLING_TOP_DIRECTORY}/darwin.map -nodefaultlibs -nostdlib")

# The C_FLAG -fno-strict-overflow should be used, but Clang doesn't know what it is
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc -fwrapv -fstack-protector -fvisibility=hidden -pipe -include ruby/config.h -include ruby/missing.h -include ruby.h")

set(CMAKE_SHARED_LINKER_FLAGS "${ruby_link_flags}")
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

add_library(encdb SHARED ruby/enc/encdb.c)
add_library(big5 SHARED ruby/enc/big5.c)
add_library(cp949 SHARED ruby/enc/cp949.c)
add_library(emacs_mule SHARED ruby/enc/emacs_mule.c)
add_library(euc_jp SHARED ruby/enc/euc_jp.c)
add_library(euc_kr SHARED ruby/enc/euc_kr.c)
add_library(euc_tw SHARED ruby/enc/euc_tw.c)
add_library(gb2312 SHARED ruby/enc/gb2312.c)
add_library(gb18030 SHARED ruby/enc/gb18030.c)
add_library(gbk SHARED ruby/enc/gbk.c)
add_library(iso_8859_1 SHARED ruby/enc/iso_8859_1.c)
add_library(iso_8859_2 SHARED ruby/enc/iso_8859_2.c)
add_library(iso_8859_3 SHARED ruby/enc/iso_8859_3.c)
add_library(iso_8859_4 SHARED ruby/enc/iso_8859_4.c)
add_library(iso_8859_5 SHARED ruby/enc/iso_8859_5.c)
add_library(iso_8859_6 SHARED ruby/enc/iso_8859_6.c)
add_library(iso_8859_7 SHARED ruby/enc/iso_8859_7.c)
add_library(iso_8859_8 SHARED ruby/enc/iso_8859_8.c)
add_library(iso_8859_9 SHARED ruby/enc/iso_8859_9.c)
add_library(iso_8859_10 SHARED ruby/enc/iso_8859_10.c)
add_library(iso_8859_11 SHARED ruby/enc/iso_8859_11.c)
add_library(iso_8859_13 SHARED ruby/enc/iso_8859_13.c) # Yes, there is no 12
add_library(iso_8859_14 SHARED ruby/enc/iso_8859_14.c)
add_library(iso_8859_15 SHARED ruby/enc/iso_8859_15.c)
add_library(iso_8859_16 SHARED ruby/enc/iso_8859_16.c)
add_library(koi8_r SHARED ruby/enc/koi8_r.c)
add_library(koi8_u SHARED ruby/enc/koi8_u.c)
add_library(shift_jis SHARED ruby/enc/shift_jis.c)
add_library(utf_16be SHARED ruby/enc/utf_16be.c)
add_library(utf_16le SHARED ruby/enc/utf_16le.c)
add_library(utf_32be SHARED ruby/enc/utf_32be.c)
add_library(utf_32le SHARED ruby/enc/utf_32le.c)
add_library(windows_31j SHARED ruby/enc/windows_31j.c)
add_library(windows_1251 SHARED ruby/enc/windows_1251.c)

add_library(transdb SHARED ruby/enc/trans/transdb.c)
add_library(big5-trans SHARED ruby/enc/trans/big5.c)
add_library(chinese SHARED ruby/enc/trans/chinese.c)
add_library(emoji SHARED ruby/enc/trans/emoji.c)
add_library(emoji_iso2022_kddi SHARED ruby/enc/trans/emoji_iso2022_kddi.c)
add_library(emoji_sjis_docomo SHARED ruby/enc/trans/emoji_sjis_docomo.c)
add_library(emoji_sjis_kddi SHARED ruby/enc/trans/emoji_sjis_kddi.c)
add_library(emoji_sjis_softbank SHARED ruby/enc/trans/emoji_sjis_softbank.c)
add_library(escape SHARED ruby/enc/trans/escape.c)
add_library(gb18030-trans SHARED ruby/enc/trans/gb18030.c)
add_library(gbk-trans SHARED ruby/enc/trans/gbk.c)
add_library(iso2022 SHARED ruby/enc/trans/iso2022.c)
add_library(japanese SHARED ruby/enc/trans/japanese.c)
add_library(japanese_euc SHARED ruby/enc/trans/japanese_euc.c)
add_library(japanese_sjis SHARED ruby/enc/trans/japanese_sjis.c)
add_library(korean SHARED ruby/enc/trans/korean.c)
add_library(single_byte SHARED ruby/enc/trans/single_byte.c)
add_library(utf8_mac SHARED ruby/enc/trans/utf8_mac.c)
add_library(utf_16_32 SHARED ruby/enc/trans/utf_16_32.c)

add_library(bigdecimal SHARED ruby/ext/bigdecimal/bigdecimal.c)
add_library(continuation SHARED ruby/ext/continuation/continuation.c)
add_library(coverage SHARED ruby/ext/coverage/coverage.c)
add_library(curses SHARED ruby/ext/curses/curses.c)
add_library(date_core SHARED ruby/ext/date/date_core.c ruby/ext/date/date_parse.c ruby/ext/date/date_strftime.c ruby/ext/date/date_strptime.c)
add_library(dbm SHARED ruby/ext/dbm/dbm.c)
add_library(digest SHARED ruby/ext/digest/digest.c)
add_library(bubblebabble SHARED ruby/ext/digest/bubblebabble/bubblebabble.c)
add_library(md5 SHARED ruby/ext/digest/md5/md5init.c ruby/ext/digest/md5/md5cc.c)

# Encoding and transcoding bundles
set_target_properties(
	encdb big5 emacs_mule euc_jp euc_kr euc_tw gb2312 gb18030 gbk iso_8859_1
	iso_8859_2 iso_8859_3 iso_8859_4 iso_8859_5 iso_8859_6 iso_8859_7 iso_8859_8 iso_8859_9
	iso_8859_10 iso_8859_11 iso_8859_13 iso_8859_14 iso_8859_15 iso_8859_16 koi8_r
	koi8_u shift_jis utf_16be utf_16le utf_32be utf_32le windows_31j windows_1251

	transdb big5-trans chinese emoji emoji_iso2022_kddi emoji_sjis_docomo emoji_sjis_kddi 
	emoji_sjis_softbank escape gb18030-trans gbk-trans iso2022 japanese japanese_euc japanese_sjis
	korean single_byte utf8_mac utf_16_32

	PROPERTIES
		COMPILE_FLAGS "-bundle -DONIG_ENC_REGISTER=rb_enc_register -fno-common"
		SUFFIX ".bundle" 
		PREFIX ""
)

target_include_directories(bigdecimal PRIVATE extconfs/bigdecimal)
target_include_directories(continuation PRIVATE extconfs/continuation)
target_include_directories(coverage PRIVATE extconfs/coverage)
target_include_directories(curses PRIVATE extconfs/curses)
target_include_directories(date_core PRIVATE extconfs/date)
target_include_directories(dbm PRIVATE extconfs/dbm)
target_include_directories(digest PRIVATE extconfs/digest ruby/ext/digest)
target_include_directories(bubblebabble PRIVATE extconfs/digest/bubblebabble ruby/ext/digest)
target_include_directories(md5 PRIVATE extconfs/digest/md5 ruby/ext/digest)

# Other bundles
set_target_properties(
	bigdecimal continuation continuation coverage curses date_core dbm digest bubblebabble md5

	PROPERTIES
		COMPILE_FLAGS "-bundle -DRUBY_EXTCONF_H=\\\"extconf.h\\\" -fno-common"
		SUFFIX ".bundle"
		PREFIX ""
)
