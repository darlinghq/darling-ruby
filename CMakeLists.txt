project(ruby)

include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}/include
	${CMAKE_CURRENT_SOURCE_DIR}/gen
	${CMAKE_CURRENT_SOURCE_DIR}/ruby
	${CMAKE_CURRENT_SOURCE_DIR}/ruby/include

	${CMAKE_SOURCE_DIR}/platform-include
	${CMAKE_SOURCE_DIR}/src/libc/gen
	${CMAKE_SOURCE_DIR}/src/CommonCrypto
	${CMAKE_SOURCE_DIR}/src/ncurses/include
	${CMAKE_SOURCE_DIR}/src/libffi/include
	${CMAKE_SOURCE_DIR}/src/external/zlib
	${CMAKE_SOURCE_DIR}/platform-include/sys
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
	-Wno-incompatible-pointer-types-discards-qualifiers
	-Wno-parentheses
	-Wno-int-conversion
	-Wno-logical-op-parentheses

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
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc -fpie -fwrapv -fstack-protector -fvisibility=hidden -pipe -include ruby/config.h -include ruby/missing.h -include ruby.h")

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

add_library(ruby-2.0.0 SHARED
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

add_library(bigdecimal SHARED ruby/ext/bigdecimal/bigdecimal.c)
add_library(continuation SHARED ruby/ext/continuation/continuation.c)
add_library(coverage SHARED ruby/ext/coverage/coverage.c)
add_library(curses SHARED ruby/ext/curses/curses.c)
add_library(date_core SHARED ruby/ext/date/date_core.c ruby/ext/date/date_parse.c ruby/ext/date/date_strftime.c ruby/ext/date/date_strptime.c)
add_library(dbm SHARED ruby/ext/dbm/dbm.c)
add_library(digest SHARED ruby/ext/digest/digest.c)
add_library(bubblebabble SHARED ruby/ext/digest/bubblebabble/bubblebabble.c)
add_library(md5 SHARED ruby/ext/digest/md5/md5init.c ruby/ext/digest/md5/md5cc.c)
add_library(rmd160 SHARED ruby/ext/digest/rmd160/rmd160init.c ruby/ext/digest/rmd160/rmd160.c)
add_library(sha1 SHARED ruby/ext/digest/sha1/sha1init.c ruby/ext/digest/sha1/sha1cc.c)
add_library(sha2 SHARED ruby/ext/digest/sha2/sha2init.c ruby/ext/digest/sha2/sha2.c)
add_library(dl SHARED ruby/ext/dl/cfunc.c ruby/ext/dl/cptr.c ruby/ext/dl/dl.c ruby/ext/dl/handle.c)
add_library(callback SHARED ruby/ext/dl/callback/callback-0.c ruby/ext/dl/callback/callback-1.c ruby/ext/dl/callback/callback-2.c ruby/ext/dl/callback/callback-3.c ruby/ext/dl/callback/callback-4.c ruby/ext/dl/callback/callback-5.c ruby/ext/dl/callback/callback-6.c ruby/ext/dl/callback/callback-7.c ruby/ext/dl/callback/callback-8.c)
add_library(etc SHARED ruby/ext/etc/etc.c)
add_library(fcntl SHARED ruby/ext/fcntl/fcntl.c)
add_library(fiber SHARED ruby/ext/fiber/fiber.c)
add_library(fiddle SHARED ruby/ext/fiddle/closure.c ruby/ext/fiddle/conversions.c ruby/ext/fiddle/fiddle.c ruby/ext/fiddle/function.c ruby/ext/fiddle/handle.c ruby/ext/fiddle/pointer.c)
add_library(console SHARED ruby/ext/io/console/console.c)
add_library(nonblock SHARED ruby/ext/io/nonblock/nonblock.c)
add_library(wait SHARED ruby/ext/io/wait/wait.c)
add_library(generator SHARED ruby/ext/json/generator/generator.c)
add_library(parser SHARED ruby/ext/json/parser/parser.c)
add_library(complex SHARED ruby/ext/mathn/complex/complex.c)
add_library(rational SHARED ruby/ext/mathn/rational/rational.c)
add_library(nkf SHARED ruby/ext/nkf/nkf.c)
add_library(objspace SHARED ruby/ext/objspace/objspace.c)
add_library(pathname SHARED ruby/ext/pathname/pathname.c)
add_library(psych SHARED ruby/ext/psych/psych.c ruby/ext/psych/psych_emitter.c ruby/ext/psych/psych_parser.c ruby/ext/psych/psych_to_ruby.c ruby/ext/psych/psych_yaml_tree.c)
add_library(pty SHARED ruby/ext/pty/pty.c)
add_library(cparse SHARED ruby/ext/racc/cparse/cparse.c)
#add_library(readline SHARED ruby/ext/readline/readline.c) FIXME: LIBRARY MISSING FROM DARLING: READLINE
add_library(ripper SHARED ruby/ext/ripper/ripper.c)
add_library(sdbm SHARED ruby/ext/sdbm/_sdbm.c ruby/ext/sdbm/init.c)
add_library(socket SHARED
	ruby/ext/socket/init.c
	ruby/ext/socket/constants.c
	ruby/ext/socket/basicsocket.c
	ruby/ext/socket/socket.c
	ruby/ext/socket/ipsocket.c
	ruby/ext/socket/tcpsocket.c
	ruby/ext/socket/tcpserver.c
	ruby/ext/socket/sockssocket.c
	ruby/ext/socket/udpsocket.c
	ruby/ext/socket/unixsocket.c
	ruby/ext/socket/unixserver.c
	ruby/ext/socket/option.c
	ruby/ext/socket/ancdata.c
	ruby/ext/socket/raddrinfo.c
)
add_library(stringio SHARED ruby/ext/stringio/stringio.c)
add_library(strscan SHARED ruby/ext/strscan/strscan.c)
add_library(syslog SHARED ruby/ext/syslog/syslog.c)
add_library(zlib SHARED ruby/ext/zlib/zlib.c)

target_include_directories(bigdecimal PRIVATE extconfs/bigdecimal)
target_include_directories(continuation PRIVATE extconfs/continuation)
target_include_directories(coverage PRIVATE extconfs/coverage)
target_include_directories(curses PRIVATE extconfs/curses)
target_include_directories(date_core PRIVATE extconfs/date)
target_include_directories(dbm PRIVATE extconfs/dbm)
target_include_directories(digest PRIVATE extconfs/digest ruby/ext/digest)
target_include_directories(bubblebabble PRIVATE extconfs/digest/bubblebabble ruby/ext/digest)
target_include_directories(md5 PRIVATE extconfs/digest/md5 ruby/ext/digest)
target_include_directories(rmd160 PRIVATE extconfs/digest/rmd160 ruby/ext/digest)
target_include_directories(sha1 PRIVATE extconfs/digest/sha1 ruby/ext/digest)
target_include_directories(sha2 PRIVATE extconfs/digest/sha2 ruby/ext/digest)
target_include_directories(dl PRIVATE extconfs/dl ruby/ext/dl)
target_include_directories(callback PRIVATE extconfs/dl/callback ruby/ext/dl)
target_include_directories(etc PRIVATE extconfs/etc)
target_include_directories(fcntl PRIVATE extconfs/fcntl)
target_include_directories(fiber PRIVATE extconfs/fiber)
target_include_directories(fiddle PRIVATE extconfs/fiddle ruby/ext/fiddle)
target_include_directories(console PRIVATE extconfs/io/console)
target_include_directories(nonblock PRIVATE extconfs/io/nonblock)
target_include_directories(wait PRIVATE extconfs/io/wait)
target_include_directories(generator PRIVATE extconfs/json/generator)
target_include_directories(parser PRIVATE extconfs/json/parser)
target_include_directories(complex PRIVATE extconfs/mathn/complex)
target_include_directories(rational PRIVATE extconfs/mathn/rational)
target_include_directories(nkf PRIVATE extconfs/nkf)
target_include_directories(objspace PRIVATE extconfs/objspace)
target_include_directories(pathname PRIVATE extconfs/pathname)
target_include_directories(psych PRIVATE extconfs/psych ruby/ext/psych ruby/ext/psych/yaml)
target_include_directories(pty PRIVATE extconfs/pty)
target_include_directories(cparse PRIVATE extconfs/racc/cparse)
#target_include_directories(readline PRIVATE extconfs/readline)
target_include_directories(ripper PRIVATE extconfs/ripper ruby/ext/ripper)
target_include_directories(sdbm PRIVATE extconfs/sdbm)
target_include_directories(socket PRIVATE extconfs/socket ruby/ext/socket)
target_include_directories(stringio PRIVATE extconfs/stringio)
target_include_directories(strscan PRIVATE extconfs/strscan)
target_include_directories(syslog PRIVATE extconfs/syslog)
target_include_directories(zlib PRIVATE extconfs/zlib)

# Other bundles
set_target_properties(
	bigdecimal continuation continuation coverage curses date_core dbm digest bubblebabble md5
	rmd160 sha1 sha2 dl callback etc fcntl fiber fiddle console nonblock wait generator parser
	complex rational nkf objspace pathname psych pty cparse #readline
	ripper sdbm socket stringio strscan syslog zlib

	PROPERTIES
		COMPILE_FLAGS "-bundle -DRUBY_EXTCONF_H=\\\"extconf.h\\\" -fno-common"
		SUFFIX ".bundle"
		PREFIX ""
)

set(ruby_root "libexec/darling/System/Library/Frameworks/Ruby.framework/Versions/2.0/usr")
set(ruby_bundle_root "${ruby_root}/lib/ruby/2.0.0/universal-darwin16")

if (NOT DARLING_NO_EXECUTABLES)
	add_darling_executable(ruby ruby/main.c ruby/dmyext.c)
	target_link_libraries(ruby ruby-2.0.0)
	install(TARGETS ruby DESTINATION ${ruby_root}/bin)
endif (NOT DARLING_NO_EXECUTABLES)

install(DIRECTORY Ruby.framework
	DESTINATION libexec/darling/System/Library/Frameworks
	USE_SOURCE_PERMISSIONS
)

install(TARGETS ruby-2.0.0 DESTINATION libexec/darling/System/Library/Frameworks/Ruby.framework/Versions/2.0 RENAME Ruby)

install(TARGETS
	bigdecimal continuation coverage curses date_core dbm digest dl etc fcntl fiber fiddle nkf
	objspace pathname psych pty ripper sdbm socket stringio strscan syslog zlib
	# readline openssl

	DESTINATION ${ruby_bundle_root}
)

install(TARGETS
	bubblebabble md5 rmd160 sha1 sha2

	DESTINATION ${ruby_bundle_root}/digest
)

install(TARGETS callback DESTINATION ${ruby_bundle_root}/dl)

install(TARGETS
	big5 cp949 emacs_mule encdb euc_jp euc_kr euc_tw gb2312 gb18030 gbk iso_8859_1 iso_8859_2
	iso_8859_3 iso_8859_4 iso_8859_5 iso_8859_6 iso_8859_7 iso_8859_8 iso_8859_9 iso_8859_10
	iso_8859_11 iso_8859_13 iso_8859_14 iso_8859_15 iso_8859_16 koi8_r koi8_u shift_jis utf_16be
	utf_16le utf_32be utf_32le windows_31j windows_1251

	DESTINATION ${ruby_bundle_root}/enc
)

install(TARGETS
	big5-trans chinese emoji emoji_iso2022_kddi emoji_sjis_docomo emoji_sjis_kddi emoji_sjis_softbank
	escape gb18030-trans gbk-trans iso2022 japanese japanese_euc japanese_sjis korean single_byte transdb
	utf8_mac utf_16_32

	DESTINATION ${ruby_bundle_root}/enc/trans
)

install(TARGETS big5-trans DESTINATION ${ruby_bundle_root}/enc/trans RENAME big5)

install(TARGETS
	console nonblock wait

	DESTINATION ${ruby_bundle_root}/io
)

install(TARGETS
	generator parser

	DESTINATION ${ruby_bundle_root}/json/ext
)

install(TARGETS
	complex rational

	DESTINATION ${ruby_bundle_root}/mathn
)

install(TARGETS
	cparse

	DESTINATION ${ruby_bundle_root}/racc
)

set(ruby_sym_root "/System/Library/Frameworks/Ruby.framework/Versions/2.0/usr")
set(ruby_sym_dest "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin")

InstallSymlink(${ruby_sym_root}/bin/erb ${ruby_sym_dest}/erb)
InstallSymlink(${ruby_sym_root}/bin/gem ${ruby_sym_dest}/gem)
InstallSymlink(${ruby_sym_root}/bin/irb ${ruby_sym_dest}/irb)
InstallSymlink(${ruby_sym_root}/bin/rake ${ruby_sym_dest}/rake)
InstallSymlink(${ruby_sym_root}/bin/rdoc ${ruby_sym_dest}/rdoc)
InstallSymlink(${ruby_sym_root}/bin/ri ${ruby_sym_dest}/ri)
InstallSymlink(${ruby_sym_root}/bin/testrb ${ruby_sym_dest}/testrb)
InstallSymlink(${ruby_sym_root}/bin/ruby ${ruby_sym_dest}/ruby)
