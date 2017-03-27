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
	${CMAKE_SOURCE_DIR}/src/external/syslog/libsystem_asl.tproj/include
)

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
	-DMACOSX
	-DRUBY_PLATFORM_OS="darwin16"

	-DFALSE=0
	-DTRUE=1

	-DDTRACE_PROBES_DISABLED # So nice of them to have this!
)

# FIXME: These are for ld64 -Wl,-multiply_defined,suppress
set(ruby_link_flags "-Wl,-multiply_defined,suppress -fstack-protector -nodefaultlibs -nostdlib")

# The C_FLAG -fno-strict-overflow should be used, but Clang doesn't know what it is
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc -fwrapv -fstack-protector -include ruby/config.h -include ruby/missing.h -include ruby.h")

set(CMAKE_SHARED_LINKER_FLAGS "${ruby_link_flags}")
set(CMAKE_EXE_LINKER_FLAGS "${ruby_link_flags}")

set(ruby_sources
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

#add_library(ruby-static STATIC
#	$<TARGET_OBJECTS:rubycore>
#)

add_framework(Ruby
	FAT CURRENT_VERSION
	VERSION "2.0"
	SOURCES
		${ruby_sources}
	DEPENDENCIES
		system
		objc
)

add_darling_executable(ruby ruby/main.c ruby/dmyext.c)
make_fat(ruby)
target_link_libraries(ruby system Ruby_2.0)

function(add_ruby_bundle name)
	add_darling_bundle("ruby_${name}" "${CMAKE_CURRENT_BINARY_DIR}/ruby" ${ARGN})
	set_target_properties(
		"ruby_${name}"

		PROPERTIES
			SUFFIX ".bundle" 
			PREFIX ""
			COMPILE_FLAGS "-include extconf.h"
			OUTPUT_NAME "${name}"
	)
	set_property(TARGET "ruby_${name}" APPEND_STRING PROPERTY LINK_FLAGS " -Wl,-flat_namespace ")
	add_dependencies("ruby_${name}" ruby)
	target_link_libraries("ruby_${name}" system)

endfunction(add_ruby_bundle)

function(add_ruby_bundle_enc name)
	add_ruby_bundle(${name} ${ARGN})

	set_target_properties("ruby_${name}"
		PROPERTIES
			COMPILE_FLAGS "-DONIG_ENC_REGISTER=rb_enc_register -fno-common"
	)
endfunction(add_ruby_bundle_enc)

# Encoding and transcoding bundles

add_ruby_bundle_enc(encdb ruby/enc/encdb.c)
add_ruby_bundle_enc(big5 ruby/enc/big5.c)
add_ruby_bundle_enc(cp949 ruby/enc/cp949.c)
add_ruby_bundle_enc(emacs_mule ruby/enc/emacs_mule.c)
add_ruby_bundle_enc(euc_jp ruby/enc/euc_jp.c)
add_ruby_bundle_enc(euc_kr ruby/enc/euc_kr.c)
add_ruby_bundle_enc(euc_tw ruby/enc/euc_tw.c)
add_ruby_bundle_enc(gb2312 ruby/enc/gb2312.c)
add_ruby_bundle_enc(gb18030 ruby/enc/gb18030.c)
add_ruby_bundle_enc(gbk ruby/enc/gbk.c)
add_ruby_bundle_enc(iso_8859_1 ruby/enc/iso_8859_1.c)
add_ruby_bundle_enc(iso_8859_2 ruby/enc/iso_8859_2.c)
add_ruby_bundle_enc(iso_8859_3 ruby/enc/iso_8859_3.c)
add_ruby_bundle_enc(iso_8859_4 ruby/enc/iso_8859_4.c)
add_ruby_bundle_enc(iso_8859_5 ruby/enc/iso_8859_5.c)
add_ruby_bundle_enc(iso_8859_6 ruby/enc/iso_8859_6.c)
add_ruby_bundle_enc(iso_8859_7 ruby/enc/iso_8859_7.c)
add_ruby_bundle_enc(iso_8859_8 ruby/enc/iso_8859_8.c)
add_ruby_bundle_enc(iso_8859_9 ruby/enc/iso_8859_9.c)
add_ruby_bundle_enc(iso_8859_10 ruby/enc/iso_8859_10.c)
add_ruby_bundle_enc(iso_8859_11 ruby/enc/iso_8859_11.c)
add_ruby_bundle_enc(iso_8859_13 ruby/enc/iso_8859_13.c) # Yes, there is no 12
add_ruby_bundle_enc(iso_8859_14 ruby/enc/iso_8859_14.c)
add_ruby_bundle_enc(iso_8859_15 ruby/enc/iso_8859_15.c)
add_ruby_bundle_enc(iso_8859_16 ruby/enc/iso_8859_16.c)
add_ruby_bundle_enc(koi8_r ruby/enc/koi8_r.c)
add_ruby_bundle_enc(koi8_u ruby/enc/koi8_u.c)
add_ruby_bundle_enc(shift_jis ruby/enc/shift_jis.c)
add_ruby_bundle_enc(utf_16be ruby/enc/utf_16be.c)
add_ruby_bundle_enc(utf_16le ruby/enc/utf_16le.c)
add_ruby_bundle_enc(utf_32be ruby/enc/utf_32be.c)
add_ruby_bundle_enc(utf_32le ruby/enc/utf_32le.c)
add_ruby_bundle_enc(windows_31j ruby/enc/windows_31j.c)
add_ruby_bundle_enc(windows_1251 ruby/enc/windows_1251.c)

add_ruby_bundle_enc(transdb ruby/enc/trans/transdb.c)
add_ruby_bundle_enc(big5-trans ruby/enc/trans/big5.c)
add_ruby_bundle_enc(chinese ruby/enc/trans/chinese.c)
add_ruby_bundle_enc(emoji ruby/enc/trans/emoji.c)
add_ruby_bundle_enc(emoji_iso2022_kddi ruby/enc/trans/emoji_iso2022_kddi.c)
add_ruby_bundle_enc(emoji_sjis_docomo ruby/enc/trans/emoji_sjis_docomo.c)
add_ruby_bundle_enc(emoji_sjis_kddi ruby/enc/trans/emoji_sjis_kddi.c)
add_ruby_bundle_enc(emoji_sjis_softbank ruby/enc/trans/emoji_sjis_softbank.c)
add_ruby_bundle_enc(escape ruby/enc/trans/escape.c)
add_ruby_bundle_enc(gb18030-trans ruby/enc/trans/gb18030.c)
add_ruby_bundle_enc(gbk-trans ruby/enc/trans/gbk.c)
add_ruby_bundle_enc(iso2022 ruby/enc/trans/iso2022.c)
add_ruby_bundle_enc(japanese ruby/enc/trans/japanese.c)
add_ruby_bundle_enc(japanese_euc ruby/enc/trans/japanese_euc.c)
add_ruby_bundle_enc(japanese_sjis ruby/enc/trans/japanese_sjis.c)
add_ruby_bundle_enc(korean ruby/enc/trans/korean.c)
add_ruby_bundle_enc(single_byte ruby/enc/trans/single_byte.c)
add_ruby_bundle_enc(utf8_mac ruby/enc/trans/utf8_mac.c)
add_ruby_bundle_enc(utf_16_32 ruby/enc/trans/utf_16_32.c)


# Other bundles

add_ruby_bundle(bigdecimal ruby/ext/bigdecimal/bigdecimal.c)
add_ruby_bundle(continuation ruby/ext/continuation/continuation.c)
add_ruby_bundle(coverage ruby/ext/coverage/coverage.c)
add_ruby_bundle(curses ruby/ext/curses/curses.c)
target_link_libraries(ruby_curses ncurses)
add_ruby_bundle(date_core ruby/ext/date/date_core.c ruby/ext/date/date_parse.c ruby/ext/date/date_strftime.c ruby/ext/date/date_strptime.c)
add_ruby_bundle(dbm ruby/ext/dbm/dbm.c)
add_ruby_bundle(digest ruby/ext/digest/digest.c)
add_ruby_bundle(bubblebabble ruby/ext/digest/bubblebabble/bubblebabble.c)
add_ruby_bundle(md5 ruby/ext/digest/md5/md5init.c ruby/ext/digest/md5/md5cc.c)
add_ruby_bundle(rmd160 ruby/ext/digest/rmd160/rmd160init.c ruby/ext/digest/rmd160/rmd160.c)
add_ruby_bundle(sha1 ruby/ext/digest/sha1/sha1init.c ruby/ext/digest/sha1/sha1cc.c)
add_ruby_bundle(sha2 ruby/ext/digest/sha2/sha2init.c ruby/ext/digest/sha2/sha2.c)
add_ruby_bundle(dl ruby/ext/dl/cfunc.c ruby/ext/dl/cptr.c ruby/ext/dl/dl.c ruby/ext/dl/handle.c)
add_ruby_bundle(callback ruby/ext/dl/callback/callback.c ruby/ext/dl/callback/callback-0.c ruby/ext/dl/callback/callback-1.c ruby/ext/dl/callback/callback-2.c ruby/ext/dl/callback/callback-3.c ruby/ext/dl/callback/callback-4.c ruby/ext/dl/callback/callback-5.c ruby/ext/dl/callback/callback-6.c ruby/ext/dl/callback/callback-7.c ruby/ext/dl/callback/callback-8.c)
add_ruby_bundle(etc ruby/ext/etc/etc.c)
add_ruby_bundle(fcntl ruby/ext/fcntl/fcntl.c)
add_ruby_bundle(fiber ruby/ext/fiber/fiber.c)
add_ruby_bundle(fiddle ruby/ext/fiddle/closure.c ruby/ext/fiddle/conversions.c ruby/ext/fiddle/fiddle.c ruby/ext/fiddle/function.c ruby/ext/fiddle/handle.c ruby/ext/fiddle/pointer.c)
target_link_libraries(ruby_fiddle ffi)
add_ruby_bundle(console ruby/ext/io/console/console.c)
add_ruby_bundle(nonblock ruby/ext/io/nonblock/nonblock.c)
add_ruby_bundle(wait ruby/ext/io/wait/wait.c)
add_ruby_bundle(generator ruby/ext/json/generator/generator.c)
add_ruby_bundle(parser ruby/ext/json/parser/parser.c)
add_ruby_bundle(complex ruby/ext/mathn/complex/complex.c)
add_ruby_bundle(rational ruby/ext/mathn/rational/rational.c)
add_ruby_bundle(nkf ruby/ext/nkf/nkf.c)
add_ruby_bundle(objspace ruby/ext/objspace/objspace.c)
add_ruby_bundle(pathname ruby/ext/pathname/pathname.c)
add_ruby_bundle(psych
	ruby/ext/psych/psych.c
	ruby/ext/psych/psych_emitter.c
	ruby/ext/psych/psych_parser.c
	ruby/ext/psych/psych_to_ruby.c
	ruby/ext/psych/psych_yaml_tree.c
	ruby/ext/psych/yaml/api.c
	ruby/ext/psych/yaml/dumper.c
	ruby/ext/psych/yaml/emitter.c
	ruby/ext/psych/yaml/loader.c
	ruby/ext/psych/yaml/parser.c
	ruby/ext/psych/yaml/reader.c
	ruby/ext/psych/yaml/scanner.c
	ruby/ext/psych/yaml/writer.c
)
set_target_properties(ruby_psych PROPERTIES COMPILE_DEFINITIONS "HAVE_CONFIG_H")
add_ruby_bundle(pty ruby/ext/pty/pty.c)
add_ruby_bundle(cparse ruby/ext/racc/cparse/cparse.c)
add_ruby_bundle(readline ruby/ext/readline/readline.c)
target_link_libraries(ruby_readline edit)
add_ruby_bundle(ripper ruby/ext/ripper/ripper.c)
add_ruby_bundle(sdbm ruby/ext/sdbm/_sdbm.c ruby/ext/sdbm/init.c)
add_ruby_bundle(socket
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
add_ruby_bundle(stringio ruby/ext/stringio/stringio.c)
add_ruby_bundle(strscan ruby/ext/strscan/strscan.c)
add_ruby_bundle(syslog ruby/ext/syslog/syslog.c)
add_ruby_bundle(zlib ruby/ext/zlib/zlib.c)
target_link_libraries(ruby_zlib z)

target_include_directories(ruby_bigdecimal PRIVATE extconfs/bigdecimal)
target_include_directories(ruby_continuation PRIVATE extconfs/continuation)
target_include_directories(ruby_coverage PRIVATE extconfs/coverage)
target_include_directories(ruby_curses PRIVATE extconfs/curses)
target_include_directories(ruby_date_core PRIVATE extconfs/date)
target_include_directories(ruby_dbm PRIVATE extconfs/dbm)
target_include_directories(ruby_digest PRIVATE extconfs/digest ruby/ext/digest)
target_include_directories(ruby_bubblebabble PRIVATE extconfs/digest/bubblebabble ruby/ext/digest)
target_include_directories(ruby_md5 PRIVATE extconfs/digest/md5 ruby/ext/digest)
target_include_directories(ruby_rmd160 PRIVATE extconfs/digest/rmd160 ruby/ext/digest)
target_include_directories(ruby_sha1 PRIVATE extconfs/digest/sha1 ruby/ext/digest)
target_include_directories(ruby_sha2 PRIVATE extconfs/digest/sha2 ruby/ext/digest)
target_include_directories(ruby_dl PRIVATE extconfs/dl ruby/ext/dl)
target_include_directories(ruby_callback PRIVATE extconfs/dl/callback ruby/ext/dl)
target_include_directories(ruby_etc PRIVATE extconfs/etc)
target_include_directories(ruby_fcntl PRIVATE extconfs/fcntl)
target_include_directories(ruby_fiber PRIVATE extconfs/fiber)
target_include_directories(ruby_fiddle PRIVATE extconfs/fiddle ruby/ext/fiddle)
target_include_directories(ruby_console PRIVATE extconfs/io/console)
target_include_directories(ruby_nonblock PRIVATE extconfs/io/nonblock)
target_include_directories(ruby_wait PRIVATE extconfs/io/wait)
target_include_directories(ruby_generator PRIVATE extconfs/json/generator)
target_include_directories(ruby_parser PRIVATE extconfs/json/parser)
target_include_directories(ruby_complex PRIVATE extconfs/mathn/complex)
target_include_directories(ruby_rational PRIVATE extconfs/mathn/rational)
target_include_directories(ruby_nkf PRIVATE extconfs/nkf)
target_include_directories(ruby_objspace PRIVATE extconfs/objspace)
target_include_directories(ruby_pathname PRIVATE extconfs/pathname)
target_include_directories(ruby_psych PRIVATE extconfs/psych ruby/ext/psych ruby/ext/psych/yaml)
target_include_directories(ruby_pty PRIVATE extconfs/pty)
target_include_directories(ruby_cparse PRIVATE extconfs/racc/cparse)
target_include_directories(ruby_readline PRIVATE extconfs/readline ${CMAKE_SOURCE_DIR}/src/libedit/src)
target_include_directories(ruby_ripper PRIVATE extconfs/ripper ruby/ext/ripper)
target_include_directories(ruby_sdbm PRIVATE extconfs/sdbm)
target_include_directories(ruby_socket PRIVATE extconfs/socket ruby/ext/socket)
target_include_directories(ruby_stringio PRIVATE extconfs/stringio)
target_include_directories(ruby_strscan PRIVATE extconfs/strscan)
target_include_directories(ruby_syslog PRIVATE extconfs/syslog)
target_include_directories(ruby_zlib PRIVATE extconfs/zlib)

set(ruby_root "libexec/darling/System/Library/Frameworks/Ruby.framework/Versions/2.0/usr")
set(ruby_bundle_root "${ruby_root}/lib/ruby/2.0.0/universal-darwin16")

install(TARGETS ruby DESTINATION ${ruby_root}/bin)

install(DIRECTORY Ruby.framework
	DESTINATION libexec/darling/System/Library/Frameworks
	USE_SOURCE_PERMISSIONS
)

install(TARGETS
    ruby_bigdecimal ruby_continuation ruby_coverage ruby_curses ruby_date_core ruby_dbm ruby_digest ruby_dl ruby_etc ruby_fcntl ruby_fiber ruby_fiddle ruby_nkf
    ruby_objspace ruby_pathname ruby_psych ruby_pty ruby_ripper ruby_sdbm ruby_socket ruby_stringio ruby_strscan ruby_syslog ruby_zlib
    ruby_readline # ruby_openssl


	DESTINATION ${ruby_bundle_root}
)

install(TARGETS
	ruby_bubblebabble ruby_md5 ruby_rmd160 ruby_sha1 ruby_sha2

	DESTINATION ${ruby_bundle_root}/digest
)

install(TARGETS ruby_callback DESTINATION ${ruby_bundle_root}/dl)

install(TARGETS
    ruby_big5 ruby_cp949 ruby_emacs_mule ruby_encdb ruby_euc_jp ruby_euc_kr ruby_euc_tw ruby_gb2312 ruby_gb18030 ruby_gbk ruby_iso_8859_1 ruby_iso_8859_2
    ruby_iso_8859_3 ruby_iso_8859_4 ruby_iso_8859_5 ruby_iso_8859_6 ruby_iso_8859_7 ruby_iso_8859_8 ruby_iso_8859_9 ruby_iso_8859_10
    ruby_iso_8859_11 ruby_iso_8859_13 ruby_iso_8859_14 ruby_iso_8859_15 ruby_iso_8859_16 ruby_koi8_r ruby_koi8_u ruby_shift_jis ruby_utf_16be
    ruby_utf_16le ruby_utf_32be ruby_utf_32le ruby_windows_31j ruby_windows_1251

	DESTINATION ${ruby_bundle_root}/enc
)

install(TARGETS
    ruby_big5-trans ruby_chinese ruby_emoji ruby_emoji_iso2022_kddi ruby_emoji_sjis_docomo ruby_emoji_sjis_kddi ruby_emoji_sjis_softbank
    ruby_escape ruby_gb18030-trans ruby_gbk-trans ruby_iso2022 ruby_japanese ruby_japanese_euc ruby_japanese_sjis ruby_korean ruby_single_byte ruby_transdb
    ruby_utf8_mac ruby_utf_16_32


	DESTINATION ${ruby_bundle_root}/enc/trans
)

install(TARGETS ruby_big5-trans DESTINATION ${ruby_bundle_root}/enc/trans RENAME big5)

install(TARGETS
	ruby_console ruby_nonblock ruby_wait

	DESTINATION ${ruby_bundle_root}/io
)

install(TARGETS
	ruby_generator ruby_parser

	DESTINATION ${ruby_bundle_root}/json/ext
)

install(TARGETS
	ruby_complex ruby_rational

	DESTINATION ${ruby_bundle_root}/mathn
)

install(TARGETS
	ruby_cparse

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
