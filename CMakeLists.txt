project(ruby)

remove_sdk_framework(Ruby)

generate_sdk_framework(Ruby
    VERSION "2.6"
    HEADER "darling/include/ruby"
)

if (REGENERATE_SDK)
	set(preframework_path "")
	get_path_preframework(preframework_path)

	set(ruby_absolute_current_path "${preframework_path}/Ruby.framework/Versions/Current")
	file(RELATIVE_PATH ruby_relative_usr_path "${ruby_absolute_current_path}" "${CMAKE_CURRENT_SOURCE_DIR}/darling/framework_sdk/Ruby.framework/Versions/2.6/usr")

	create_symlink("${ruby_relative_usr_path}" "${ruby_absolute_current_path}/usr")
endif (REGENERATE_SDK)


include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}/gen
	${CMAKE_CURRENT_SOURCE_DIR}/gen/.ext/include/universal-darwin19
	${CMAKE_CURRENT_SOURCE_DIR}/ruby/include
	${CMAKE_CURRENT_SOURCE_DIR}/ruby
	${CMAKE_CURRENT_SOURCE_DIR}/ruby/enc/unicode/12.1.0
)

add_compile_options(
	-w
	-nostdinc
)

add_compile_definitions(
	HAVE_GCC_ATOMIC_BUILTINS

	_XOPEN_SOURCE
	_DARWIN_C_SOURCE
	_DARWIN_UNLIMITED_SELECT
	_REENTRANT

	DTRACE_PROBES_DISABLED=1 # So nice of them to have this!
)

add_link_options(
	-Wl,-undefined,dynamic_lookup
	-Wl,-multiply_defined,suppress
)

set(ruby_sources
	ruby/addr2line.c
	ruby/array.c
	ruby/ast.c
	ruby/bignum.c
	ruby/class.c
	ruby/compar.c
	ruby/compile.c
	ruby/complex.c
	ruby/cont.c
	ruby/debug_counter.c
	ruby/debug.c
	ruby/dir.c
	ruby/dln_find.c
	ruby/dln.c
	ruby/dmyenc.c
	ruby/dmyext.c
	ruby/encoding.c
	ruby/enum.c
	ruby/enumerator.c
	ruby/error.c
	ruby/eval.c
	ruby/file.c
	ruby/gc.c
	ruby/hash.c
	ruby/inits.c
	ruby/io.c
	ruby/iseq.c
	ruby/load.c
	ruby/loadpath.c
	ruby/localeinit.c
	ruby/marshal.c
	ruby/math.c
	ruby/mjit_compile.c
	ruby/mjit.c
	ruby/node.c
	ruby/numeric.c
	ruby/object.c
	ruby/pack.c
	ruby/parse.c
	ruby/prelude.c
	ruby/proc.c
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
	ruby/symbol.c
	ruby/thread.c
	ruby/time.c
	ruby/transcode.c
	ruby/transient_heap.c
	ruby/util.c
	ruby/variable.c
	ruby/version.c
	ruby/vm_backtrace.c
	ruby/vm_dump.c
	ruby/vm_trace.c
	ruby/vm.c

	ruby/missing/explicit_bzero.c
	ruby/missing/setproctitle.c

	ruby/enc/ascii.c
	ruby/enc/unicode.c
	ruby/enc/us_ascii.c
	ruby/enc/utf_8.c
	ruby/enc/trans/newline.c
)

set(DYLIB_COMPAT_VERSION "2.6")
set(DYLIB_CURRENT_VERSION "2.6.3")
add_framework(Ruby
	FAT CURRENT_VERSION
	VERSION "2.6"
	SOURCES
		${ruby_sources}
	DEPENDENCIES
		Security
		Foundation
		objc
		system
	RESOURCES
		Info.plist                      extras/framework_resources/Info.plist
		version.plist                   extras/framework_resources/version.plist
		English.lproj/InfoPlist.strings extras/framework_resources/English.lproj/InfoPlist.strings
)
target_compile_definitions(Ruby PRIVATE
	RUBY_EXPORT
	CANONICALIZATION_FOR_MATHN
)

add_darling_executable(ruby ruby/main.c)
make_fat(ruby)
target_link_libraries(ruby
	Ruby
)

function(add_ruby_bundle name)
	get_filename_component(EXT_SRCDIR "${ARGV1}" DIRECTORY)
	file(RELATIVE_PATH EXT_GENDIR "${CMAKE_CURRENT_SOURCE_DIR}/ruby" "${CMAKE_CURRENT_SOURCE_DIR}/${EXT_SRCDIR}")
	add_darling_bundle("ruby_${name}" "" ${ARGN})
	set_target_properties("ruby_${name}" PROPERTIES
		SUFFIX ".bundle"
		PREFIX ""
		OUTPUT_NAME "${name}"
	)
	target_include_directories("ruby_${name}" PRIVATE
		"gen/${EXT_GENDIR}"
		"ruby/${EXT_GENDIR}"
	)
	target_compile_definitions("ruby_${name}" PRIVATE
		RUBY_EXTCONF_H="extconf.h"
	)
	target_link_options("ruby_${name}" PRIVATE
		-Wl,-flat_namespace
	)
	add_dependencies("ruby_${name}" ruby)
	target_link_libraries("ruby_${name}" Ruby system)
endfunction(add_ruby_bundle)

function(add_ruby_bundle_enc name)
	add_ruby_bundle(${name} ${ARGN})
	target_compile_definitions("ruby_${name}" PRIVATE
		ONIG_ENC_REGISTER=rb_enc_register
	)
	target_compile_options("ruby_${name}" PRIVATE
		-fno-common

		-URUBY_EXTCONF_H # we don't want this for encoding bundles and there is no `target_remove_definitions` for CMake
	)
endfunction(add_ruby_bundle_enc)

# encoding and transcoding bundles

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

# extension bundles

add_ruby_bundle(bigdecimal ruby/ext/bigdecimal/bigdecimal.c)

add_ruby_bundle(util ruby/ext/bigdecimal/util/util.c)

add_ruby_bundle(continuation ruby/ext/continuation/continuation.c)

add_ruby_bundle(coverage ruby/ext/coverage/coverage.c)

add_ruby_bundle(date_core ruby/ext/date/date_core.c ruby/ext/date/date_parse.c ruby/ext/date/date_strftime.c ruby/ext/date/date_strptime.c)

add_ruby_bundle(dbm ruby/ext/dbm/dbm.c)

add_ruby_bundle(digest ruby/ext/digest/digest.c)
add_ruby_bundle(bubblebabble ruby/ext/digest/bubblebabble/bubblebabble.c)

function(add_ruby_digest_bundle name)
	add_ruby_bundle(${name} ruby/ext/digest/${name}/${name}init.c ruby/ext/digest/${name}/${name}.c)
	target_include_directories(ruby_${name} PRIVATE ruby/ext/digest)

	# Apple's config seems to show them using CommonCrypto, but the actual bundles on macOS use LibreSSL
	target_link_libraries(ruby_${name} ssl46 crypto44)
	string(TOUPPER "${name}" upper_name)
	target_compile_definitions(ruby_${name} PRIVATE ${upper_name}_USE_OPENSSL=1)
endfunction()

add_ruby_digest_bundle(md5)
add_ruby_digest_bundle(rmd160)
add_ruby_digest_bundle(sha1)
add_ruby_digest_bundle(sha2)

add_ruby_bundle(etc ruby/ext/etc/etc.c)

add_ruby_bundle(fcntl ruby/ext/fcntl/fcntl.c)

add_ruby_bundle(fiber ruby/ext/fiber/fiber.c)

add_ruby_bundle(fiddle
	ruby/ext/fiddle/closure.c
	ruby/ext/fiddle/conversions.c
	ruby/ext/fiddle/fiddle.c
	ruby/ext/fiddle/function.c
	ruby/ext/fiddle/handle.c
	ruby/ext/fiddle/pointer.c
)
target_link_libraries(ruby_fiddle ffi)

add_ruby_bundle(console ruby/ext/io/console/console.c)
add_ruby_bundle(nonblock ruby/ext/io/nonblock/nonblock.c)
add_ruby_bundle(wait ruby/ext/io/wait/wait.c)

add_ruby_bundle(generator ruby/ext/json/generator/generator.c)
add_ruby_bundle(parser ruby/ext/json/parser/parser.c)

add_ruby_bundle(nkf ruby/ext/nkf/nkf.c)

add_ruby_bundle(objspace ruby/ext/objspace/objspace.c ruby/ext/objspace/object_tracing.c ruby/ext/objspace/objspace_dump.c)

add_ruby_bundle(openssl
	ruby/ext/openssl/openssl_missing.c
	ruby/ext/openssl/ossl_asn1.c
	ruby/ext/openssl/ossl_bio.c
	ruby/ext/openssl/ossl_bn.c
	ruby/ext/openssl/ossl_cipher.c
	ruby/ext/openssl/ossl_config.c
	ruby/ext/openssl/ossl_digest.c
	ruby/ext/openssl/ossl_engine.c
	ruby/ext/openssl/ossl_hmac.c
	ruby/ext/openssl/ossl_kdf.c
	ruby/ext/openssl/ossl_ns_spki.c
	ruby/ext/openssl/ossl_ocsp.c
	ruby/ext/openssl/ossl_pkcs12.c
	ruby/ext/openssl/ossl_pkcs7.c
	ruby/ext/openssl/ossl_pkey_dh.c
	ruby/ext/openssl/ossl_pkey_dsa.c
	ruby/ext/openssl/ossl_pkey_ec.c
	ruby/ext/openssl/ossl_pkey_rsa.c
	ruby/ext/openssl/ossl_pkey.c
	ruby/ext/openssl/ossl_rand.c
	ruby/ext/openssl/ossl_ssl_session.c
	ruby/ext/openssl/ossl_ssl.c
	ruby/ext/openssl/ossl_x509.c
	ruby/ext/openssl/ossl_x509attr.c
	ruby/ext/openssl/ossl_x509cert.c
	ruby/ext/openssl/ossl_x509crl.c
	ruby/ext/openssl/ossl_x509ext.c
	ruby/ext/openssl/ossl_x509name.c
	ruby/ext/openssl/ossl_x509req.c
	ruby/ext/openssl/ossl_x509revoked.c
	ruby/ext/openssl/ossl_x509store.c
	ruby/ext/openssl/ossl.c
)
target_link_libraries(ruby_openssl
	crypto44
	ssl46
)

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
target_include_directories(ruby_psych PRIVATE
	ruby/ext/psych/yaml
)

add_ruby_bundle(pty ruby/ext/pty/pty.c)

add_ruby_bundle(cparse ruby/ext/racc/cparse/cparse.c)

add_ruby_bundle(sizeof ruby/ext/rbconfig/sizeof/limits.c ruby/ext/rbconfig/sizeof/sizes.c)

add_ruby_bundle(readline ruby/ext/readline/readline.c)
target_link_libraries(ruby_readline edit)

add_ruby_bundle(ripper ruby/ext/ripper/ripper.c)

add_ruby_bundle(sdbm ruby/ext/sdbm/_sdbm.c ruby/ext/sdbm/init.c)

add_ruby_bundle(socket
	ruby/ext/socket/init.c
	ruby/ext/socket/constants.c
	ruby/ext/socket/basicsocket.c
	ruby/ext/socket/socket.c
	ruby/ext/socket/ifaddr.c
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

#
# install everything
#

set(ruby_root "libexec/darling/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr")
set(ruby_bundle_root "${ruby_root}/lib/ruby/2.6.0/universal-darwin19")

install(TARGETS ruby DESTINATION ${ruby_root}/bin)

install(DIRECTORY darling/framework/Ruby.framework
	DESTINATION libexec/darling/System/Library/Frameworks
	USE_SOURCE_PERMISSIONS
)

install(DIRECTORY Library
	DESTINATION libexec/darling
	USE_SOURCE_PERMISSIONS
)

install(
	TARGETS
		ruby_bigdecimal
		ruby_continuation
		ruby_coverage
		ruby_date_core
		ruby_dbm
		ruby_digest
		ruby_etc
		ruby_fcntl
		ruby_fiber
		ruby_fiddle
		ruby_nkf
		ruby_objspace
		ruby_openssl
		ruby_pathname
		ruby_psych
		ruby_pty
		ruby_readline
		ruby_ripper
		ruby_sdbm
		ruby_socket
		ruby_stringio
		ruby_strscan
		ruby_syslog
		ruby_zlib
	DESTINATION
		${ruby_bundle_root}
)

install(TARGETS
	ruby_util

	DESTINATION ${ruby_bundle_root}/bigdecimal
)

install(TARGETS
	ruby_bubblebabble ruby_md5 ruby_rmd160 ruby_sha1 ruby_sha2

	DESTINATION ${ruby_bundle_root}/digest
)

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
	ruby_cparse

	DESTINATION ${ruby_bundle_root}/racc
)

install(TARGETS
	ruby_sizeof

	DESTINATION ${ruby_bundle_root}/rbconfig
)

InstallSymlink("../../Ruby" "${CMAKE_INSTALL_PREFIX}/libexec/darling/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/libruby.2.6.dylib")
InstallSymlink("libruby.2.6.dylib" "${CMAKE_INSTALL_PREFIX}/libexec/darling/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/libruby.dylib")

set(ruby_sym_root "/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr")
set(ruby_sym_dest "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin")

InstallSymlink(${ruby_sym_root}/bin/erb ${ruby_sym_dest}/erb)
InstallSymlink(${ruby_sym_root}/bin/gem ${ruby_sym_dest}/gem)
InstallSymlink(${ruby_sym_root}/bin/irb ${ruby_sym_dest}/irb)
InstallSymlink(${ruby_sym_root}/bin/rake ${ruby_sym_dest}/rake)
InstallSymlink(${ruby_sym_root}/bin/rdoc ${ruby_sym_dest}/rdoc)
InstallSymlink(${ruby_sym_root}/bin/ri ${ruby_sym_dest}/ri)
InstallSymlink(${ruby_sym_root}/bin/testrb ${ruby_sym_dest}/testrb)
InstallSymlink(${ruby_sym_root}/bin/ruby ${ruby_sym_dest}/ruby)

install(FILES extras/irbrc DESTINATION libexec/darling/etc)
install(PROGRAMS extras/rails DESTINATION libexec/darling/usr/bin)

InstallSymlink("../../System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/libruby.2.6.dylib" "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/lib/libruby.2.6.dylib")
InstallSymlink("libruby.2.6.dylib" "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/lib/libruby.dylib")
InstallSymlink("../../System/Library/Frameworks/Ruby.framework/Versions/Current/usr/lib/ruby" "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/lib/ruby")
