bin: $(PROGRAM) $(WPROGRAM)
lib: $(LIBRUBY)
dll: $(LIBRUBY_SO)

.SUFFIXES: .inc .h .c .y .i .$(ASMEXT) .$(DTRACE_EXT)

# V=0 quiet, V=1 verbose.  other values don't work.
V = 0
Q1 = $(V:1=)
Q = $(Q1:0=@)
ECHO0 = $(ECHO1:0=echo)
ECHO = @$(ECHO0)

mflags = $(MFLAGS)
gnumake_recursive =
enable_shared = $(ENABLE_SHARED:no=)

UNICODE_VERSION = 12.1.0
UNICODE_EMOJI_VERSION = 12.0
UNICODE_BETA = YES

### set the following environment variable or uncomment the line if
### the Unicode data files should be updated completely on every update ('make up',...).
# ALWAYS_UPDATE_UNICODE = yes
UNICODE_DATA_DIR = enc/unicode/data/$(UNICODE_VERSION)/ucd
UNICODE_SRC_DATA_DIR = $(srcdir)/$(UNICODE_DATA_DIR)
UNICODE_SRC_EMOJI_DATA_DIR = $(srcdir)/enc/unicode/data/emoji/$(UNICODE_EMOJI_VERSION)
UNICODE_HDR_DIR = $(srcdir)/enc/unicode/$(UNICODE_VERSION)
UNICODE_DATA_HEADERS = \
	$(UNICODE_HDR_DIR)/casefold.h \
	$(UNICODE_HDR_DIR)/name2ctype.h \
	$(empty)

RUBY_RELEASE_DATE = $(RUBY_RELEASE_YEAR)-$(RUBY_RELEASE_MONTH)-$(RUBY_RELEASE_DAY)
RUBYLIB       = $(PATH_SEPARATOR)
RUBYOPT       = -
RUN_OPTS      = --disable-gems

INCFLAGS = -I. -I$(arch_hdrdir) -I$(hdrdir) -I$(srcdir) -I$(UNICODE_HDR_DIR)

GEM_HOME =
GEM_PATH =
GEM_VENDOR =

BENCHMARK_DRIVER_GIT_URL = https://github.com/benchmark-driver/benchmark-driver
BENCHMARK_DRIVER_GIT_REF = v0.14.11
SIMPLECOV_GIT_URL = https://github.com/colszowka/simplecov.git
SIMPLECOV_GIT_REF = v0.15.0
SIMPLECOV_HTML_GIT_URL = https://github.com/colszowka/simplecov-html.git
SIMPLECOV_HTML_GIT_REF = v0.10.2
DOCLIE_GIT_URL = https://github.com/ms-ati/docile.git
DOCLIE_GIT_REF = v1.1.5

STATIC_RUBY   = static-ruby

TIMESTAMPDIR  = $(EXTOUT)/.timestamp
EXTCONF       = extconf.rb
LIBRUBY_EXTS  = ./.libruby-with-ext.time
REVISION_H    = ./.revision.time
PLATFORM_D    = $(TIMESTAMPDIR)/.$(PLATFORM_DIR).time
ENC_TRANS_D   = $(TIMESTAMPDIR)/.enc-trans.time
RDOCOUT       = $(EXTOUT)/rdoc
HTMLOUT       = $(EXTOUT)/html
CAPIOUT       = doc/capi
INSTALL_DOC_OPTS = --rdoc-output="$(RDOCOUT)" --html-output="$(HTMLOUT)"

INITOBJS      = dmyext.$(OBJEXT) dmyenc.$(OBJEXT)
NORMALMAINOBJ = main.$(OBJEXT)
MAINOBJ       = $(NORMALMAINOBJ)
DLDOBJS	      = $(INITOBJS)
EXTSOLIBS     =
MINIOBJS      = $(ARCHMINIOBJS) miniinit.$(OBJEXT) dmyext.$(OBJEXT) miniprelude.$(OBJEXT)
ENC_MK        = enc.mk
MAKE_ENC      = -f $(ENC_MK) V="$(V)" UNICODE_HDR_DIR="$(UNICODE_HDR_DIR)" \
		RUBY="$(MINIRUBY)" MINIRUBY="$(MINIRUBY)" $(mflags)

COMMONOBJS    = array.$(OBJEXT) \
		ast.$(OBJEXT) \
		bignum.$(OBJEXT) \
		class.$(OBJEXT) \
		compar.$(OBJEXT) \
		compile.$(OBJEXT) \
		complex.$(OBJEXT) \
		cont.$(OBJEXT) \
		debug.$(OBJEXT) \
		debug_counter.$(OBJEXT) \
		dir.$(OBJEXT) \
		dln_find.$(OBJEXT) \
		encoding.$(OBJEXT) \
		enum.$(OBJEXT) \
		enumerator.$(OBJEXT) \
		error.$(OBJEXT) \
		eval.$(OBJEXT) \
		file.$(OBJEXT) \
		gc.$(OBJEXT) \
		hash.$(OBJEXT) \
		inits.$(OBJEXT) \
		io.$(OBJEXT) \
		iseq.$(OBJEXT) \
		load.$(OBJEXT) \
		marshal.$(OBJEXT) \
		math.$(OBJEXT) \
		mjit.$(OBJEXT) \
		mjit_compile.$(OBJEXT) \
		node.$(OBJEXT) \
		numeric.$(OBJEXT) \
		object.$(OBJEXT) \
		pack.$(OBJEXT) \
		parse.$(OBJEXT) \
		proc.$(OBJEXT) \
		process.$(OBJEXT) \
		random.$(OBJEXT) \
		range.$(OBJEXT) \
		rational.$(OBJEXT) \
		re.$(OBJEXT) \
		regcomp.$(OBJEXT) \
		regenc.$(OBJEXT) \
		regerror.$(OBJEXT) \
		regexec.$(OBJEXT) \
		regparse.$(OBJEXT) \
		regsyntax.$(OBJEXT) \
		ruby.$(OBJEXT) \
		safe.$(OBJEXT) \
		signal.$(OBJEXT) \
		sprintf.$(OBJEXT) \
		st.$(OBJEXT) \
		strftime.$(OBJEXT) \
		string.$(OBJEXT) \
		struct.$(OBJEXT) \
		symbol.$(OBJEXT) \
		thread.$(OBJEXT) \
		time.$(OBJEXT) \
		transcode.$(OBJEXT) \
		transient_heap.$(OBJEXT) \
		util.$(OBJEXT) \
		variable.$(OBJEXT) \
		version.$(OBJEXT) \
		vm.$(OBJEXT) \
		vm_backtrace.$(OBJEXT) \
		vm_dump.$(OBJEXT) \
		vm_trace.$(OBJEXT) \
		$(COROUTINE_OBJ) \
		$(DTRACE_OBJ) \
		$(BUILTIN_ENCOBJS) \
		$(BUILTIN_TRANSOBJS) \
		$(MISSING)

EXPORTOBJS    = $(DLNOBJ) \
		localeinit.$(OBJEXT) \
		loadpath.$(OBJEXT) \
		$(COMMONOBJS)

OBJS          = $(EXPORTOBJS) prelude.$(OBJEXT)
ALLOBJS       = $(NORMALMAINOBJ) $(MINIOBJS) $(COMMONOBJS) $(INITOBJS)

GOLFOBJS      = goruby.$(OBJEXT) golf_prelude.$(OBJEXT)

DEFAULT_PRELUDES = $(GEM_PRELUDE)
PRELUDE_SCRIPTS = $(srcdir)/prelude.rb $(DEFAULT_PRELUDES)
GEM_PRELUDE   = $(srcdir)/gem_prelude.rb
PRELUDES      = prelude.c miniprelude.c
GOLFPRELUDES  = golf_prelude.c

SCRIPT_ARGS   =	--dest-dir="$(DESTDIR)" \
		--extout="$(EXTOUT)" \
		--mflags="$(MFLAGS)" \
		--make-flags="$(MAKEFLAGS)"
EXTMK_ARGS    =	$(SCRIPT_ARGS) --extension $(EXTS) --extstatic $(EXTSTATIC) \
		--make-flags="V=$(V) MINIRUBY='$(MINIRUBY)'" \
		--gnumake=$(gnumake) --extflags="$(EXTLDFLAGS)" \
		--
INSTRUBY      =	$(SUDO) SDKROOT=/ $(RUNRUBY) -r./$(arch)-fake $(srcdir)/tool/rbinstall.rb
INSTRUBY_ARGS =	$(SCRIPT_ARGS) \
		--data-mode=$(INSTALL_DATA_MODE) \
		--prog-mode=$(INSTALL_PROG_MODE) \
		--installed-list $(INSTALLED_LIST) \
		--mantype="$(MANTYPE)"
INSTALL_PROG_MODE = 0755
INSTALL_DATA_MODE = 0644

TESTSDIR      = $(srcdir)/test
TEST_EXCLUDES = --excludes-dir=$(TESTSDIR)/excludes --name=!/memory_leak/
EXCLUDE_TESTFRAMEWORK = --exclude=/testunit/ --exclude=/minitest/
TESTWORKDIR   = testwork
TESTOPTS      = $(RUBY_TESTOPTS)

TESTRUN_SCRIPT = $(srcdir)/test.rb

COMPILE_PRELUDE = $(srcdir)/tool/generic_erb.rb $(srcdir)/template/prelude.c.tmpl

SHOWFLAGS = showflags

MAKE_LINK = $(MINIRUBY) -rfileutils -e "include FileUtils::Verbose" \
	  -e "src, dest = ARGV" \
	  -e "exit if File.identical?(src, dest) or cmp(src, dest) rescue nil" \
	  -e "def noraise; yield; rescue; rescue NotImplementedError; end" \
	  -e "noraise {ln_sf('../'*dest.count('/')+src, dest)} or" \
	  -e "noraise {ln(src, dest)} or" \
	  -e "cp(src, dest)"


all: $(SHOWFLAGS) main docs

main: $(SHOWFLAGS) exts $(ENCSTATIC:static=lib)encs
	@$(NULLCMD)

mjit-headers: $(MJIT_SUPPORT)-mjit-headers
no-mjit-headers: PHONY
yes-mjit-headers: mjit_config.h PHONY

mjit.$(OBJEXT): mjit_config.h
mjit_config.h: Makefile


# These rules using MJIT_HEADER_SUFFIX must be in common.mk, not
# Makefile.in, in order to override the macro in defs/universal.mk.

# Other `-Dxxx`s preceding `-DMJIT_HEADER` will be removed in transform_mjit_header.rb.
# So `-DMJIT_HEADER` should be passed first when rb_mjit_header.h is generated.
$(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time: probes.h vm.$(OBJEXT) \
		$(TIMESTAMPDIR)/$(arch)/.time
	$(ECHO) building $(@F:.time=.h)
	$(Q) $(CPP) -DMJIT_HEADER $(MJIT_HEADER_FLAGS) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(srcdir)/vm.c $(CPPOUTFLAG)$(@F:.time=.h).new
	$(Q) $(IFCHANGE) "--timestamp=$@" $(@F:.time=.h) $(@F:.time=.h).new

$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).h: $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time

$(MJIT_MIN_HEADER:.h=)$(MJIT_HEADER_SUFFIX).h: \
		$(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time \
		$(srcdir)/tool/transform_mjit_header.rb $(PREP) \
		$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).h
	$(ECHO) building $@
	$(MINIRUBY) $(srcdir)/tool/transform_mjit_header.rb "$(CC) $(ARCH_FLAG)" $(MJIT_HEADER:.h=)$(MJIT_HEADER_ARCH).h $@
	$(Q) $(MAKEDIRS) $(MJIT_HEADER_INSTALL_DIR)
	$(Q) $(MAKE_LINK) $@ $(MJIT_HEADER_INSTALL_DIR)/$(@F)

.PHONY: showflags
exts enc trans: $(SHOWFLAGS)
showflags:
	$(MESSAGE_BEGIN) \
	"	BASERUBY = $(BASERUBY)" \
	"	CC = $(CC)" \
	"	LD = $(LD)" \
	"	LDSHARED = $(LDSHARED)" \
	"	CFLAGS = $(CFLAGS)" \
	"	XCFLAGS = $(XCFLAGS)" \
	"	CPPFLAGS = $(CPPFLAGS)" \
	"	DLDFLAGS = $(DLDFLAGS)" \
	"	SOLIBS = $(SOLIBS)" \
	"	LANG = $(LANG)" \
	"	LC_ALL = $(LC_ALL)" \
	"	LC_CTYPE = $(LC_CTYPE)" \
	$(MESSAGE_END)
	-@$(CC_VERSION)

.PHONY: showconfig
showconfig:
	@$(ECHO_BEGIN) \
	$(configure_args) \
	$(ECHO_END)

EXTS_NOTE = -f $(EXTS_MK) $(mflags) RUBY="$(MINIRUBY)" top_srcdir="$(srcdir)" note

exts: build-ext

EXTS_MK = exts.mk
$(EXTS_MK): ext/configure-ext.mk $(TIMESTAMPDIR)/$(arch)/.time $(srcdir)/template/exts.mk.tmpl
	$(Q)$(MAKE) -f ext/configure-ext.mk $(mflags) V=$(V) EXTSTATIC=$(EXTSTATIC) \
		gnumake=$(gnumake) MINIRUBY="$(MINIRUBY)" \
		EXTLDFLAGS="$(EXTLDFLAGS)" srcdir="$(srcdir)"
	$(ECHO) generating makefile $@
	$(Q)$(MINIRUBY) $(srcdir)/tool/generic_erb.rb -o $@ -c \
	    $(srcdir)/template/exts.mk.tmpl --gnumake=$(gnumake)

ext/configure-ext.mk: $(PREP) all-incs $(MKFILES) $(RBCONFIG) $(LIBRUBY) \
		$(srcdir)/template/configure-ext.mk.tmpl
	$(ECHO) generating makefiles $@
	$(Q)$(MAKEDIRS) $(@D)
	$(Q)$(MINIRUBY) $(srcdir)/tool/generic_erb.rb -o $@ -c \
	    $(srcdir)/template/$(@F).tmpl --srcdir="$(srcdir)" \
	    --miniruby="$(MINIRUBY)" --script-args='$(SCRIPT_ARGS)'

configure-ext: $(EXTS_MK)

build-ext: $(EXTS_MK)
	$(Q)$(MAKE) -f $(EXTS_MK) $(mflags) libdir="$(libdir)" LIBRUBY_EXTS=$(LIBRUBY_EXTS) \
	    EXTENCS="$(ENCOBJS)" UPDATE_LIBRARIES=no $(EXTSTATIC)
	$(Q)$(MAKE) $(EXTS_NOTE)

exts-note: $(EXTS_MK)
	$(Q)$(MAKE) $(EXTS_NOTE)

ext/extinit.c: $(srcdir)/template/extinit.c.tmpl
	$(Q)$(MINIRUBY) $(srcdir)/tool/generic_erb.rb -o $@ -c \
	    $(srcdir)/template/extinit.c.tmpl $(EXTINITS)

prog: program wprogram
programs: $(PROGRAM) $(WPROGRAM)

$(PREP): $(MKFILES)

miniruby$(EXEEXT): config.status $(ALLOBJS) $(ARCHFILE)

objs: $(ALLOBJS)

GORUBY = go$(RUBY_INSTALL_NAME)
GOLF = $(GORUBY)
golf: $(GOLF)
$(GOLF): $(LIBRUBY) $(GOLFOBJS) PHONY
	$(Q) $(MAKE) $(mflags) \
		GOLF=_dummy_golf_target_to_avoid_conflict_just_in_case_ \
		MAINOBJ=goruby.$(OBJEXT) \
		EXTOBJS="golf_prelude.$(OBJEXT) $(EXTOBJS)" \
		PROGRAM=$(GORUBY)$(EXEEXT) \
		V=$(V) \
	program
capi: $(CAPIOUT)/.timestamp PHONY

$(CAPIOUT)/.timestamp: Doxyfile $(PREP)
	$(Q) $(MAKEDIRS) "$(@D)"
	$(ECHO) generating capi
	-$(Q) $(DOXYGEN) -b
	$(Q) $(MINIRUBY) -e 'File.open(ARGV[0], "w"){'"|f|"' f.puts(Time.now)}' "$@"

Doxyfile: $(srcdir)/template/Doxyfile.tmpl $(PREP) $(srcdir)/tool/generic_erb.rb $(RBCONFIG)
	$(ECHO) generating $@
	$(Q) $(MINIRUBY) $(srcdir)/tool/generic_erb.rb -o $@ $(srcdir)/template/Doxyfile.tmpl \
	--srcdir="$(srcdir)" --miniruby="$(MINIRUBY)"

program: $(SHOWFLAGS) $(PROGRAM)
wprogram: $(SHOWFLAGS) $(WPROGRAM)
mini: PHONY miniruby$(EXEEXT)

$(PROGRAM) $(WPROGRAM): $(LIBRUBY) $(MAINOBJ) $(OBJS) $(EXTOBJS) $(SETUP) $(PREP)

$(LIBRUBY_A):	$(LIBRUBY_A_OBJS) $(MAINOBJ) $(INITOBJS) $(ARCHFILE)

$(LIBRUBY_SO):	$(OBJS) $(DLDOBJS) $(LIBRUBY_A) $(PREP) $(BUILTIN_ENCOBJS)

$(LIBRUBY_EXTS):
	@exit > $@

$(STATIC_RUBY)$(EXEEXT): $(MAINOBJ) $(DLDOBJS) $(EXTOBJS) $(LIBRUBY_A)
	$(Q)$(RM) $@
	$(PURIFY) $(CC) $(MAINOBJ) $(DLDOBJS) $(LIBRUBY_A) $(MAINLIBS) $(EXTLIBS) $(LIBS) $(OUTFLAG)$@ $(LDFLAGS) $(XLDFLAGS)

ruby.imp: $(COMMONOBJS)
	$(Q){ \
	$(NM) -Pgp $(COMMONOBJS) | \
	awk 'BEGIN{print "#!"}; $$2~/^[BDT]$$/&&$$1!~/^$(SYMBOL_PREFIX)(Init_|InitVM_|ruby_static_id_|.*_threadptr_|rb_ec_)|^\./{print $$1}'; \
	($(CHDIR) $(srcdir) && \
	 exec sed -n '/^MJIT_FUNC_EXPORTED/!d;N;s/.*\n\(rb_[a-zA-Z_0-9]*\).*/$(SYMBOL_PREFIX)\1/p' cont.c gc.c thread*c vm*.c) \
	} | \
	sort -u -o $@

install: install-$(INSTALLDOC)
docs: $(DOCTARGETS)
pkgconfig-data: $(ruby_pc)
$(ruby_pc): $(srcdir)/template/ruby.pc.in config.status

install-all: docs pre-install-all do-install-all post-install-all
pre-install-all:: all pre-install-local pre-install-ext pre-install-doc
do-install-all: pre-install-all
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=all $(INSTALL_DOC_OPTS)
post-install-all:: post-install-local post-install-ext post-install-doc
	@$(NULLCMD)

install-nodoc: pre-install-nodoc do-install-nodoc post-install-nodoc
pre-install-nodoc:: pre-install-local pre-install-ext
do-install-nodoc: main pre-install-nodoc
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS)
post-install-nodoc:: post-install-local post-install-ext

install-local: pre-install-local do-install-local post-install-local
pre-install-local:: pre-install-bin pre-install-lib pre-install-man
do-install-local: $(PROGRAM) pre-install-local
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=local
post-install-local:: post-install-bin post-install-lib post-install-man

install-ext: pre-install-ext do-install-ext post-install-ext
pre-install-ext:: pre-install-ext-arch pre-install-ext-comm
do-install-ext: exts pre-install-ext
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=ext
post-install-ext:: post-install-ext-arch post-install-ext-comm

install-arch: pre-install-arch do-install-arch post-install-arch
pre-install-arch:: pre-install-bin pre-install-ext-arch
do-install-arch: main do-install-arch
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=arch
post-install-arch:: post-install-bin post-install-ext-arch

install-comm: pre-install-comm do-install-comm post-install-comm
pre-install-comm:: pre-install-lib pre-install-ext-comm pre-install-man
do-install-comm: $(PREP) pre-install-comm
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=lib --install=ext-comm --install=man
post-install-comm:: post-install-lib post-install-ext-comm post-install-man

install-bin: pre-install-bin do-install-bin post-install-bin
pre-install-bin:: install-prereq
do-install-bin: $(PROGRAM) pre-install-bin
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=bin
post-install-bin::
	@$(NULLCMD)

install-lib: pre-install-lib do-install-lib post-install-lib
pre-install-lib:: install-prereq
do-install-lib: $(PREP) pre-install-lib
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=lib
post-install-lib::
	@$(NULLCMD)

install-ext-comm: pre-install-ext-comm do-install-ext-comm post-install-ext-comm
pre-install-ext-comm:: install-prereq
do-install-ext-comm: exts pre-install-ext-comm
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=ext-comm
post-install-ext-comm::
	@$(NULLCMD)

install-ext-arch: pre-install-ext-arch do-install-ext-arch post-install-ext-arch
pre-install-ext-arch:: install-prereq
do-install-ext-arch: exts pre-install-ext-arch
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=ext-arch
post-install-ext-arch::
	@$(NULLCMD)

install-man: pre-install-man do-install-man post-install-man
pre-install-man:: install-prereq
do-install-man: $(PREP) pre-install-man
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=man
post-install-man::
	@$(NULLCMD)

install-capi: capi pre-install-capi do-install-capi post-install-capi
pre-install-capi:: install-prereq
do-install-capi: $(PREP) pre-install-capi
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=capi
post-install-capi::
	@$(NULLCMD)

what-where: no-install
no-install: no-install-$(INSTALLDOC)
what-where-all: no-install-all
no-install-all: pre-no-install-all dont-install-all post-no-install-all
pre-no-install-all:: pre-no-install-local pre-no-install-ext pre-no-install-doc
dont-install-all: $(PROGRAM)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=all $(INSTALL_DOC_OPTS)
post-no-install-all:: post-no-install-local post-no-install-ext post-no-install-doc
	@$(NULLCMD)

uninstall: $(INSTALLED_LIST) sudo-precheck
	$(Q)$(SUDO) $(MINIRUBY) $(srcdir)/tool/rbuninstall.rb --destdir=$(DESTDIR) $(INSTALLED_LIST)

reinstall: all uninstall install

what-where-nodoc: no-install-nodoc
no-install-nodoc: pre-no-install-nodoc dont-install-nodoc post-no-install-nodoc
pre-no-install-nodoc:: pre-no-install-local pre-no-install-ext
dont-install-nodoc:  $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS)
post-no-install-nodoc:: post-no-install-local post-no-install-ext

what-where-local: no-install-local
no-install-local: pre-no-install-local dont-install-local post-no-install-local
pre-no-install-local:: pre-no-install-bin pre-no-install-lib pre-no-install-man
dont-install-local: $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=local
post-no-install-local:: post-no-install-bin post-no-install-lib post-no-install-man

what-where-ext: no-install-ext
no-install-ext: pre-no-install-ext dont-install-ext post-no-install-ext
pre-no-install-ext:: pre-no-install-ext-arch pre-no-install-ext-comm
dont-install-ext: $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=ext
post-no-install-ext:: post-no-install-ext-arch post-no-install-ext-comm

what-where-arch: no-install-arch
no-install-arch: pre-no-install-arch dont-install-arch post-no-install-arch
pre-no-install-arch:: pre-no-install-bin pre-no-install-ext-arch
dont-install-arch: $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=bin --install=ext-arch
post-no-install-arch:: post-no-install-lib post-no-install-man post-no-install-ext-arch

what-where-comm: no-install-comm
no-install-comm: pre-no-install-comm dont-install-comm post-no-install-comm
pre-no-install-comm:: pre-no-install-lib pre-no-install-ext-comm pre-no-install-man
dont-install-comm: $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=lib --install=ext-comm --install=man
post-no-install-comm:: post-no-install-lib post-no-install-ext-comm post-no-install-man

what-where-bin: no-install-bin
no-install-bin: pre-no-install-bin dont-install-bin post-no-install-bin
pre-no-install-bin:: install-prereq
dont-install-bin: $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=bin
post-no-install-bin::
	@$(NULLCMD)

what-where-lib: no-install-lib
no-install-lib: pre-no-install-lib dont-install-lib post-no-install-lib
pre-no-install-lib:: install-prereq
dont-install-lib: $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=lib
post-no-install-lib::
	@$(NULLCMD)

what-where-ext-comm: no-install-ext-comm
no-install-ext-comm: pre-no-install-ext-comm dont-install-ext-comm post-no-install-ext-comm
pre-no-install-ext-comm:: install-prereq
dont-install-ext-comm: $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=ext-comm
post-no-install-ext-comm::
	@$(NULLCMD)

what-where-ext-arch: no-install-ext-arch
no-install-ext-arch: pre-no-install-ext-arch dont-install-ext-arch post-no-install-ext-arch
pre-no-install-ext-arch:: install-prereq
dont-install-ext-arch: $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=ext-arch
post-no-install-ext-arch::
	@$(NULLCMD)

what-where-man: no-install-man
no-install-man: pre-no-install-man dont-install-man post-no-install-man
pre-no-install-man:: install-prereq
dont-install-man: $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=man
post-no-install-man::
	@$(NULLCMD)

install-doc: rdoc pre-install-doc do-install-doc post-install-doc
pre-install-doc:: install-prereq
do-install-doc: $(PROGRAM) pre-install-doc
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=rdoc $(INSTALL_DOC_OPTS)
post-install-doc::
	@$(NULLCMD)

install-gem: pre-install-gem do-install-gem post-install-gem
pre-install-gem:: pre-install-bin pre-install-lib pre-install-man
do-install-gem: $(PROGRAM) pre-install-gem
	$(INSTRUBY) --make="$(MAKE)" $(INSTRUBY_ARGS) --install=gem
post-install-gem::
	@$(NULLCMD)

rdoc: PHONY main
	@echo Generating RDoc documentation
	$(Q) $(XRUBY) "$(srcdir)/libexec/rdoc" --root "$(srcdir)" --page-dir "$(srcdir)/doc" --encoding=UTF-8 --no-force-update --all --ri --op "$(RDOCOUT)" $(RDOCFLAGS) "$(srcdir)"

html: PHONY main
	@echo Generating RDoc HTML files
	$(Q) $(XRUBY) "$(srcdir)/libexec/rdoc" --root "$(srcdir)" --page-dir "$(srcdir)/doc" --encoding=UTF-8 --no-force-update --all --op "$(HTMLOUT)" $(RDOCFLAGS) "$(srcdir)"

rdoc-coverage: PHONY main
	@echo Generating RDoc coverage report
	$(Q) $(XRUBY) "$(srcdir)/libexec/rdoc" --root "$(srcdir)" --encoding=UTF-8 --all --quiet -C $(RDOCFLAGS) "$(srcdir)"

RDOCBENCHOUT=/tmp/rdocbench

GCBENCH_ITEM=null

gcbench: PHONY
	$(Q) $(XRUBY) "$(srcdir)/benchmark/gc/gcbench.rb" $(GCBENCH_ITEM)

gcbench-rdoc: PHONY
	$(Q) $(XRUBY) "$(srcdir)/benchmark/gc/gcbench.rb" rdoc

nodoc: PHONY

what-where-doc: no-install-doc
no-install-doc: pre-no-install-doc dont-install-doc post-no-install-doc
pre-no-install-doc:: install-prereq
dont-install-doc:: $(PREP)
	$(INSTRUBY) -n --make="$(MAKE)" $(INSTRUBY_ARGS) --install=rdoc $(INSTALL_DOC_OPTS)
post-no-install-doc::
	@$(NULLCMD)

CLEAR_INSTALLED_LIST = clear-installed-list

install-prereq: $(CLEAR_INSTALLED_LIST) yes-fake sudo-precheck PHONY

clear-installed-list: PHONY
	@> $(INSTALLED_LIST) set MAKE="$(MAKE)"

clean: clean-ext clean-enc clean-golf clean-docs clean-extout clean-local clean-platform clean-spec
clean-local:: clean-runnable
	$(Q)$(RM) $(OBJS) $(MINIOBJS) $(MAINOBJ) $(LIBRUBY_A) $(LIBRUBY_SO) $(LIBRUBY) $(LIBRUBY_ALIASES)
	$(Q)$(RM) $(PROGRAM) $(WPROGRAM) miniruby$(EXEEXT) dmyext.$(OBJEXT) dmyenc.$(OBJEXT) $(ARCHFILE) .*.time
	$(Q)$(RM) y.tab.c y.output encdb.h transdb.h config.log rbconfig.rb $(ruby_pc)
	$(Q)$(RM) probes.h probes.$(OBJEXT) probes.stamp ruby-glommed.$(OBJEXT) ruby.imp
	$(Q)$(RM) GNUmakefile.old Makefile.old $(arch)-fake.rb bisect.sh $(ENC_TRANS_D)
	-$(Q) $(RMDIR) enc/jis enc/trans enc 2> $(NULL) || exit 0
clean-runnable:: PHONY
	$(Q)$(CHDIR) bin 2>$(NULL) && $(RM) $(PROGRAM) $(WPROGRAM) $(GORUBY)$(EXEEXT) bin/*.$(DLEXT) 2>$(NULL) || exit 0
	$(Q)$(CHDIR) lib 2>$(NULL) && $(RM) $(LIBRUBY_A) $(LIBRUBY) $(LIBRUBY_ALIASES) $(RUBY_BASE_NAME)/$(RUBY_PROGRAM_VERSION) $(RUBY_BASE_NAME)/vendor_ruby 2>$(NULL) || exit 0
	$(Q)$(RMDIR) lib/$(RUBY_BASE_NAME) lib bin 2>$(NULL) || exit 0
clean-ext:: PHONY
clean-golf: PHONY
	$(Q)$(RM) $(GORUBY)$(EXEEXT) $(GOLFOBJS)
clean-rdoc: PHONY
clean-html: PHONY
clean-capi: PHONY
clean-platform: PHONY
clean-extout: PHONY
	-$(Q)$(RMDIR) $(EXTOUT)/$(arch) $(EXTOUT) 2> $(NULL) || exit 0
clean-docs: clean-rdoc clean-html clean-capi
clean-spec: PHONY
clean-rubyspec: clean-spec

distclean: distclean-ext distclean-enc distclean-golf distclean-docs distclean-extout distclean-local distclean-platform distclean-spec
distclean-local:: clean-local
	$(Q)$(RM) $(MKFILES) yasmdata.rb *.inc $(PRELUDES)
	$(Q)$(RM) config.cache config.status config.status.lineno
	$(Q)$(RM) *~ *.bak *.stackdump core *.core gmon.out $(PREP)
	-$(Q)$(RMALL) $(srcdir)/autom4te.cache
distclean-ext:: PHONY
distclean-golf: clean-golf
distclean-rdoc: clean-rdoc
distclean-html: clean-html
distclean-capi: clean-capi
distclean-docs: clean-docs
distclean-extout: clean-extout
distclean-platform: clean-platform
distclean-spec: clean-spec
distclean-rubyspec: distclean-spec

realclean:: realclean-ext realclean-local realclean-enc realclean-golf realclean-extout
realclean-local:: distclean-local realclean-srcs-local

clean-srcs:: clean-srcs-local clean-srcs-ext
realclean-srcs:: realclean-srcs-local realclean-srcs-ext

clean-srcs-local::
	$(Q)$(RM) parse.c parse.h lex.c enc/trans/newline.c revision.h
	$(Q)$(RM) id.c id.h probes.dmyh probes.h
	$(Q)$(RM) encdb.h transdb.h verconf.h ruby-runner.h
	$(Q)$(RM) mjit_config.h rb_mjit_header.h
	$(Q)$(RM) $(MJIT_MIN_HEADER) $(MJIT_MIN_HEADER:.h=)$(MJIT_HEADER_SUFFIX:%=*).h

realclean-srcs-local:: clean-srcs-local
	$(Q)$(CHDIR) $(srcdir) && $(exec) $(RM) parse.c parse.h lex.c enc/trans/newline.c $(PRELUDES) revision.h
	$(Q)$(CHDIR) $(srcdir) && $(exec) $(RM) id.c id.h probes.dmyh
	$(Q)$(CHDIR) $(srcdir) && $(exec) $(RM) configure aclocal.m4 tool/config.guess tool/config.sub gems/*.gem

clean-srcs-ext::
realclean-srcs-ext:: clean-srcs-ext

realclean-ext:: PHONY
realclean-golf: distclean-golf
	$(Q)$(RM) $(GOLFPRELUDES)
realclean-rdoc: distclean-rdoc
realclean-html: distclean-html
realclean-capi: distclean-capi
realclean-docs: distclean-docs
realclean-extout: distclean-extout
realclean-platform: distclean-platform
realclean-spec: distclean-spec
realclean-rubyspec: realclean-spec

clean-ext:: ext/clean gems/clean timestamp/clean
distclean-ext:: ext/distclean gems/distclean timestamp/distclean
realclean-ext:: ext/realclean gems/realclean timestamp/realclean

ext/clean.mk ext/distclean.mk ext/realclean.mk::
ext/clean gems/clean:: ext/clean.mk
ext/distclean gems/distclean:: ext/distclean.mk
ext/realclean gems/realclean:: ext/realclean.mk

timestamp/clean:: ext/clean gems/clean
timestamp/distclean:: ext/distclean gems/distclean
timestamp/realclean:: ext/realclean gems/realclean

timestamp/clean timestamp/distclean timestamp/realclean::
	$(Q)$(RM) $(TIMESTAMPDIR)/.*.time $(TIMESTAMPDIR)/$(arch)/.time
	$(Q)$(RMDIRS) $(TIMESTAMPDIR)/$(arch) 2> $(NULL) || exit 0

clean-ext::
	-$(Q)$(RM) ext/extinit.$(OBJEXT)

distclean-ext realclean-ext::
	-$(Q)$(RM) $(EXTS_MK) ext/extinit.* ext/configure-ext.mk
	-$(Q)$(RMDIR) ext 2> $(NULL) || exit 0

clean-enc distclean-enc realclean-enc: PHONY

clean-enc: clean-enc.d

clean-enc.d: PHONY
	$(Q)$(RM) $(ENC_TRANS_D)
	-$(Q) $(RMDIR) enc/jis enc/trans enc 2> $(NULL) || exit 0

clean-rdoc distclean-rdoc realclean-rdoc:
	@echo $(@:-rdoc=ing) rdoc
	$(Q)$(RMALL) $(RDOCOUT)

clean-html distclean-html realclean-html:
	@echo $(@:-html=ing) HTML
	$(Q)$(RMALL) $(HTMLOUT)

clean-capi distclean-capi realclean-capi:
	@echo $(@:-capi=ing) capi
	$(Q)$(RMALL) $(CAPIOUT)

clean-platform:
	$(Q) $(RM) $(PLATFORM_D)
	-$(Q) $(RMDIR) $(PLATFORM_DIR) 2> $(NULL) || exit 0

RUBYSPEC_CAPIEXT = spec/ruby/optional/capi/ext
clean-spec: PHONY
	-$(Q) $(RM) $(RUBYSPEC_CAPIEXT)/*.$(OBJEXT) $(RUBYSPEC_CAPIEXT)/*.$(DLEXT)
	-$(Q) $(RMDIRS) $(RUBYSPEC_CAPIEXT) 2> $(NULL) || exit 0

check: main test test-testframework test-almost test-spec
	$(ECHO) check succeeded
check-ruby: test test-ruby

fake: $(CROSS_COMPILING)-fake
yes-fake: $(arch)-fake.rb $(RBCONFIG) PHONY
no-fake -fake: PHONY

# really doesn't depend on .o, just ensure newer than headers which
# version.o depends on.
$(arch)-fake.rb: $(srcdir)/template/fake.rb.in $(srcdir)/tool/generic_erb.rb version.$(OBJEXT) miniruby$(EXEEXT)
	$(ECHO) generating $@
	$(Q) $(CPP) $(warnflags) $(XCFLAGS) $(CPPFLAGS) "$(srcdir)/version.c" | \
	$(BOOTSTRAPRUBY) "$(srcdir)/tool/generic_erb.rb" -o $@ "$(srcdir)/template/fake.rb.in" \
		i=- srcdir="$(srcdir)" BASERUBY="$(BASERUBY)"

btest: $(TEST_RUNNABLE)-btest
no-btest: PHONY
yes-btest: fake miniruby$(EXEEXT) PHONY
	$(Q)$(exec) $(BOOTSTRAPRUBY) "$(srcdir)/bootstraptest/runner.rb" --ruby="$(BTESTRUBY) $(RUN_OPTS)" $(OPTS) $(TESTOPTS) $(BTESTS)

btest-ruby: $(TEST_RUNNABLE)-btest-ruby
no-btest-ruby: PHONY
yes-btest-ruby: prog PHONY
	$(Q)$(exec) $(RUNRUBY) "$(srcdir)/bootstraptest/runner.rb" --ruby="$(PROGRAM) -I$(srcdir)/lib $(RUN_OPTS)" -q $(OPTS) $(TESTOPTS) $(BTESTS)

test-basic: $(TEST_RUNNABLE)-test-basic
no-test-basic: PHONY
yes-test-basic: prog PHONY
	$(Q)$(exec) $(RUNRUBY) "$(srcdir)/basictest/runner.rb" --run-opt=$(RUN_OPTS) $(OPTS) $(TESTOPTS)

test-knownbugs: test-knownbug
test-knownbug: $(TEST_RUNNABLE)-test-knownbug
no-test-knownbug: PHONY
yes-test-knownbug: prog PHONY
	-$(exec) $(RUNRUBY) "$(srcdir)/bootstraptest/runner.rb" --ruby="$(PROGRAM) $(RUN_OPTS)" $(OPTS) $(TESTOPTS) $(srcdir)/KNOWNBUGS.rb

test-testframework: $(TEST_RUNNABLE)-test-testframework
yes-test-testframework: prog PHONY
	$(gnumake_recursive)$(Q)$(exec) $(RUNRUBY) "$(srcdir)/test/runner.rb" --ruby="$(RUNRUBY)" $(TESTOPTS) testunit minitest
no-test-testframework: PHONY

test-sample: test-basic # backward compatibility for mswin-build
test-short: btest-ruby test-knownbug test-basic
test: test-short

# $ make test-all TESTOPTS="--help" displays more detail
# for example, make test-all TESTOPTS="-j2 -v -n test-name -- test-file-name"
test-all: $(TEST_RUNNABLE)-test-all
yes-test-all: programs PHONY
	$(gnumake_recursive)$(Q)$(exec) $(RUNRUBY) "$(srcdir)/test/runner.rb" --ruby="$(RUNRUBY)" $(TEST_EXCLUDES) $(TESTOPTS) $(TESTS)
TESTS_BUILD = mkmf
no-test-all: PHONY
	$(gnumake_recursive)$(MINIRUBY) -I"$(srcdir)/lib" "$(srcdir)/test/runner.rb" $(TESTOPTS) $(TESTS_BUILD)

test-almost: $(TEST_RUNNABLE)-test-almost
yes-test-almost: prog PHONY
	$(gnumake_recursive)$(Q)$(exec) $(RUNRUBY) "$(srcdir)/test/runner.rb" --ruby="$(RUNRUBY)" $(TEST_EXCLUDES) $(TESTOPTS) $(EXCLUDE_TESTFRAMEWORK) $(TESTS)
no-test-almost: PHONY

test-ruby: $(TEST_RUNNABLE)-test-ruby
no-test-ruby: PHONY
yes-test-ruby: prog encs PHONY
	$(gnumake_recursive)$(RUNRUBY) "$(srcdir)/test/runner.rb" $(TEST_EXCLUDES) $(TESTOPTS) -- ruby -ext-

extconf: $(PREP)
	$(Q) $(MAKEDIRS) "$(EXTCONFDIR)"
	$(RUNRUBY) -C "$(EXTCONFDIR)" $(EXTCONF) $(EXTCONFARGS)

$(RBCONFIG): $(srcdir)/tool/mkconfig.rb config.status $(srcdir)/version.h
	$(Q)$(BOOTSTRAPRUBY) -n \
	-e 'BEGIN{version=ARGV.shift;mis=ARGV.dup}' \
	-e 'END{abort "UNICODE version mismatch: #{mis}" unless mis.empty?}' \
	-e '(mis.delete(ARGF.path); ARGF.close) if /ONIG_UNICODE_VERSION_STRING +"#{Regexp.quote(version)}"/o' \
	$(UNICODE_VERSION) $(UNICODE_DATA_HEADERS)
	$(Q)$(BOOTSTRAPRUBY) $(srcdir)/tool/mkconfig.rb \
		-arch=$(arch) -version=$(RUBY_PROGRAM_VERSION) \
		-install_name=$(RUBY_INSTALL_NAME) \
		-so_name=$(RUBY_SO_NAME) \
		-unicode_version=$(UNICODE_VERSION) \
		-unicode_emoji_version=$(UNICODE_EMOJI_VERSION) \
	> rbconfig.tmp
	$(IFCHANGE) "--timestamp=$@" rbconfig.rb rbconfig.tmp

test-rubyspec: test-spec
yes-test-rubyspec: yes-test-spec

test-spec-precheck: $(arch)-fake.rb programs

test-spec: $(TEST_RUNNABLE)-test-spec
yes-test-spec: test-spec-precheck
	$(gnumake_recursive)$(Q) \
	$(RUNRUBY) -r./$(arch)-fake $(srcdir)/spec/mspec/bin/mspec run -B $(srcdir)/spec/default.mspec $(MSPECOPT) $(SPECOPTS)
no-test-spec:

RUNNABLE = $(LIBRUBY_RELATIVE:no=un)-runnable
runnable: $(RUNNABLE) prog $(srcdir)/tool/mkrunnable.rb PHONY
	$(Q) $(MINIRUBY) $(srcdir)/tool/mkrunnable.rb -v $(EXTOUT)
yes-runnable: PHONY

encs: enc trans
libencs: libenc libtrans
encs enc trans libencs libenc libtrans: $(SHOWFLAGS) $(ENC_MK) $(LIBRUBY) $(PREP) PHONY
	$(ECHO) making $@
	$(Q) $(MAKE) $(MAKE_ENC) $@


libenc enc: encdb.h
libtrans trans: transdb.h

# Use MINIRUBY which loads fake.rb for cross compiling
$(ENC_MK): $(srcdir)/enc/make_encmake.rb $(srcdir)/enc/Makefile.in $(srcdir)/enc/depend \
	$(srcdir)/enc/encinit.c.erb $(srcdir)/lib/mkmf.rb $(RBCONFIG) fake
	$(ECHO) generating $@
	$(Q) $(MINIRUBY) $(srcdir)/enc/make_encmake.rb --builtin-encs="$(BUILTIN_ENCOBJS)" --builtin-transes="$(BUILTIN_TRANSOBJS)" --module$(ENCSTATIC) $(ENCS) $@

.PRECIOUS: $(MKFILES)

.PHONY: PHONY all fake prereq incs srcs preludes help
.PHONY: test install install-nodoc install-doc dist
.PHONY: loadpath golf capi rdoc install-prereq clear-installed-list
.PHONY: clean clean-ext clean-local clean-enc clean-golf clean-rdoc clean-html clean-extout
.PHONY: distclean distclean-ext distclean-local distclean-enc distclean-golf distclean-extout
.PHONY: realclean realclean-ext realclean-local realclean-enc realclean-golf realclean-extout
.PHONY: exam check test test-short test-all btest btest-ruby test-basic test-knownbug
.PHONY: run runruby parse benchmark gdb gdb-ruby
.PHONY: update-mspec update-rubyspec test-rubyspec test-spec
.PHONY: touch-unicode-files

PHONY:

parse.c: parse.y $(srcdir)/tool/ytab.sed id.h
parse.h: parse.c

.y.c:
	$(ECHO) generating $@
	$(Q)$(BASERUBY) $(srcdir)/tool/id2token.rb --path-separator=.$(PATH_SEPARATOR)./ --vpath=$(VPATH) id.h $(SRC_FILE) > parse.tmp.y
	$(Q)$(YACC) -d $(YFLAGS) -o y.tab.c parse.tmp.y
	$(Q)$(RM) parse.tmp.y
	$(Q)sed -f $(srcdir)/tool/ytab.sed -e "/^#/s|parse\.tmp\.[iy]|$(SRC_FILE)|" -e "/^#/s!y\.tab\.c!$@!" y.tab.c > $@.new
	$(Q)$(MV) $@.new $@
	$(Q)sed -e "/^#line.*y\.tab\.h/d;/^#line.*parse.*\.y/d" y.tab.h > $(@:.c=.h)
	$(Q)$(RM) y.tab.c y.tab.h

$(PLATFORM_D):
	$(Q) $(MAKEDIRS) $(PLATFORM_DIR) $(@D)
	@exit > $@

exe/$(PROGRAM): ruby-runner.c ruby-runner.h exe/.time miniruby$(EXEEXT) config.h
	$(Q) $(CC) $(CFLAGS) $(CPPFLAGS) -DRUBY_INSTALL_NAME=$(@F) $(COUTFLAG)ruby-runner.$(OBJEXT) -c $(CSRCFLAG)$(srcdir)/ruby-runner.c
	$(Q) $(PURIFY) $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(OUTFLAG)$@ ruby-runner.$(OBJEXT) $(LIBS)
	$(Q) $(POSTLINK)
	$(Q) ./miniruby$(EXEEXT) \
	    -e 'prog, dest = ARGV; dest += "/ruby"' \
	    -e 'unless prog=="ruby"' \
	    -e '  begin File.unlink(dest); rescue Errno::ENOENT; end' \
	    -e '  File.symlink(prog, dest)' \
	    -e 'end' \
	$(@F) $(@D)

exe/.time:
	$(Q) $(MAKEDIRS) $(@D)
	@exit > $@

$(BUILTIN_ENCOBJS) $(BUILTIN_TRANSOBJS): $(ENC_TRANS_D)

$(ENC_TRANS_D):
	$(Q) $(MAKEDIRS) enc/trans $(@D)
	@exit > $@

$(TIMESTAMPDIR)/$(arch)/.time:
	$(Q)$(MAKEDIRS) $(@D) $(EXTOUT)/$(arch)
	@exit > $@

###
CCAN_DIR = ccan

RUBY_H_INCLUDES    = ruby.h config.h defines.h \
		     intern.h missing.h st.h \
		     subst.h

###

acosh.$(OBJEXT): acosh.c
alloca.$(OBJEXT): alloca.c config.h
crypt.$(OBJEXT): crypt.c crypt.h missing/des_tables.c
dup2.$(OBJEXT): dup2.c
erf.$(OBJEXT): erf.c
explicit_bzero.$(OBJEXT): explicit_bzero.c
finite.$(OBJEXT): finite.c
flock.$(OBJEXT): flock.c
memcmp.$(OBJEXT): memcmp.c
memmove.$(OBJEXT): memmove.c
mkdir.$(OBJEXT): mkdir.c
setproctitle.$(OBJEXT): setproctitle.c
strchr.$(OBJEXT): strchr.c
strdup.$(OBJEXT): strdup.c
strerror.$(OBJEXT): strerror.c
strlcat.$(OBJEXT): strlcat.c
strlcpy.$(OBJEXT): strlcpy.c
strstr.$(OBJEXT): strstr.c
nt.$(OBJEXT): nt.c
ia64.$(OBJEXT): ia64.s
	$(CC) $(CFLAGS) -c $<
.coroutine_obj $(COROUTINE_OBJ): \
	$(COROUTINE_H:.h=).$(ASMEXT) \
	$(COROUTINE_H:/Context.h=/.time)
$(COROUTINE_H:/Context.h=/.time):
	$(Q) $(MAKEDIRS) $(@D)
	@exit > $@

###

# dependencies for generated C sources.
parse.$(OBJEXT): parse.c
miniprelude.$(OBJEXT): miniprelude.c
prelude.$(OBJEXT): prelude.c

# dependencies for optional sources.
compile.$(OBJEXT): opt_sc.inc optunifs.inc

win32/win32.$(OBJEXT): win32/win32.c win32/file.h \
  dln.h dln_find.c encindex.h \
  internal.h util.h $(RUBY_H_INCLUDES) \
  vm.h $(PLATFORM_D)
win32/file.$(OBJEXT): win32/file.c win32/file.h \
  $(RUBY_H_INCLUDES) $(PLATFORM_D)

$(NEWLINE_C): $(srcdir)/enc/trans/newline.trans $(srcdir)/tool/transcode-tblgen.rb
	$(Q) $(MAKEDIRS) $(@D)
	$(Q) $(BASERUBY) "$(srcdir)/tool/transcode-tblgen.rb" -vo $@ $(srcdir)/enc/trans/newline.trans
enc/trans/newline.$(OBJEXT): $(NEWLINE_C)

verconf.h: $(srcdir)/template/verconf.h.tmpl $(srcdir)/tool/generic_erb.rb
	$(ECHO) creating $@
	$(Q) $(BOOTSTRAPRUBY) "$(srcdir)/tool/generic_erb.rb" -o $@ $(srcdir)/template/verconf.h.tmpl

ruby-glommed.$(OBJEXT): $(OBJS)

$(OBJS):  config.h missing.h

INSNS2VMOPT = --srcdir="$(srcdir)"

srcs_vpath = 

# TODO: dependencies on tool/ruby_vm scripts.
inc_common_headers = $(srcdir)/tool/ruby_vm/views/_copyright.erb $(srcdir)/tool/ruby_vm/views/_notice.erb
$(srcs_vpath)opt_sc.inc: $(srcdir)/tool/ruby_vm/views/opt_sc.inc.erb $(inc_common_headers)
$(srcs_vpath)optinsn.inc: $(srcdir)/tool/ruby_vm/views/optinsn.inc.erb $(inc_common_headers)
$(srcs_vpath)optunifs.inc: $(srcdir)/tool/ruby_vm/views/optunifs.inc.erb $(inc_common_headers)
$(srcs_vpath)insns.inc: $(srcdir)/tool/ruby_vm/views/insns.inc.erb $(inc_common_headers)
$(srcs_vpath)insns_info.inc: $(srcdir)/tool/ruby_vm/views/insns_info.inc.erb $(inc_common_headers) \
  $(srcdir)/tool/ruby_vm/views/_insn_type_chars.erb $(srcdir)/tool/ruby_vm/views/_insn_name_info.erb \
  $(srcdir)/tool/ruby_vm/views/_insn_len_info.erb $(srcdir)/tool/ruby_vm/views/_insn_operand_info.erb \
  $(srcdir)/tool/ruby_vm/views/_attributes.erb $(srcdir)/tool/ruby_vm/views/_insn_stack_increase.erb
$(srcs_vpath)vmtc.inc: $(srcdir)/tool/ruby_vm/views/vmtc.inc.erb $(inc_common_headers)
$(srcs_vpath)vm.inc: $(srcdir)/tool/ruby_vm/views/vm.inc.erb $(inc_common_headers) \
  $(srcdir)/tool/ruby_vm/views/_insn_entry.erb $(srcdir)/tool/ruby_vm/views/_trace_instruction.erb
$(srcs_vpath)mjit_compile.inc: $(srcdir)/tool/ruby_vm/views/mjit_compile.inc.erb $(inc_common_headers) \
  $(srcdir)/tool/ruby_vm/views/_mjit_compile_insn.erb $(srcdir)/tool/ruby_vm/views/_mjit_compile_send.erb \
  $(srcdir)/tool/ruby_vm/views/_mjit_compile_ivar.erb \
  $(srcdir)/tool/ruby_vm/views/_mjit_compile_insn_body.erb $(srcdir)/tool/ruby_vm/views/_mjit_compile_pc_and_sp.erb

common-srcs: $(srcs_vpath)parse.c $(srcs_vpath)lex.c $(srcs_vpath)enc/trans/newline.c $(srcs_vpath)id.c \
	     srcs-lib srcs-ext incs

missing-srcs: $(srcdir)/missing/des_tables.c

srcs: common-srcs missing-srcs srcs-enc

EXT_SRCS = $(srcdir)/ext/ripper/ripper.c \
	   $(srcdir)/ext/rbconfig/sizeof/sizes.c \
	   $(srcdir)/ext/rbconfig/sizeof/limits.c \
	   $(srcdir)/ext/socket/constdefs.c \
	   $(srcdir)/ext/etc/constdefs.h \
	   # EXT_SRCS

srcs-ext: $(EXT_SRCS)
realclean-srcs-ext::
	$(Q)$(RM) $(EXT_SRCS)

EXTRA_SRCS = $(srcdir)/ext/json/parser/parser.c \
	     $(srcdir)/ext/date/zonetab.h \
	     $(empty)

srcs-extra: $(EXTRA_SRCS)
realclean-srcs-extra::
	$(Q)$(RM) $(EXTRA_SRCS)

LIB_SRCS = $(srcdir)/lib/unicode_normalize/tables.rb

srcs-lib: $(LIB_SRCS)

srcs-enc: $(ENC_MK)
	$(ECHO) making srcs under enc
	$(Q) $(MAKE) $(MAKE_ENC) srcs

all-incs: incs encdb.h transdb.h
incs: $(INSNS) node_name.inc known_errors.inc \
      vm_call_iseq_optimized.inc $(srcdir)/revision.h \
      $(REVISION_H) \
      $(UNICODE_DATA_HEADERS) $(srcdir)/enc/jis/props.h \
      id.h probes.dmyh

insns: $(INSNS)

id.h: $(srcdir)/tool/generic_erb.rb $(srcdir)/template/id.h.tmpl $(srcdir)/defs/id.def
	$(ECHO) generating $@
	$(Q) $(BASERUBY) $(srcdir)/tool/generic_erb.rb --output=$@ \
		$(srcdir)/template/id.h.tmpl

id.c: $(srcdir)/tool/generic_erb.rb $(srcdir)/template/id.c.tmpl $(srcdir)/defs/id.def
	$(ECHO) generating $@
	$(Q) $(BASERUBY) $(srcdir)/tool/generic_erb.rb --output=$@ \
		$(srcdir)/template/id.c.tmpl

node_name.inc: $(srcdir)/tool/node_name.rb $(srcdir)/node.h
	$(ECHO) generating $@
	$(Q) $(BASERUBY) -n $(srcdir)/tool/node_name.rb < $(srcdir)/node.h > $@

encdb.h: $(PREP) $(srcdir)/tool/generic_erb.rb $(srcdir)/template/encdb.h.tmpl
	$(ECHO) generating $@
	$(Q) $(MINIRUBY) $(srcdir)/tool/generic_erb.rb -c -o $@ $(srcdir)/template/encdb.h.tmpl $(srcdir)/enc enc

transdb.h: $(PREP) srcs-enc $(srcdir)/tool/generic_erb.rb $(srcdir)/template/transdb.h.tmpl
	$(ECHO) generating $@
	$(Q) $(MINIRUBY) $(srcdir)/tool/generic_erb.rb -c -o $@ $(srcdir)/template/transdb.h.tmpl $(srcdir)/enc/trans enc/trans

enc/encinit.c: $(ENC_MK) $(srcdir)/enc/encinit.c.erb

known_errors.inc: $(srcdir)/template/known_errors.inc.tmpl $(srcdir)/defs/known_errors.def
	$(ECHO) generating $@
	$(Q) $(BASERUBY) $(srcdir)/tool/generic_erb.rb -c -o $@ $(srcdir)/template/known_errors.inc.tmpl $(srcdir)/defs/known_errors.def

vm_call_iseq_optimized.inc: $(srcdir)/tool/mk_call_iseq_optimized.rb
	$(ECHO) generating $@
	$(Q) $(BASERUBY) $(srcdir)/tool/mk_call_iseq_optimized.rb > $@

$(MINIPRELUDE_C): $(COMPILE_PRELUDE)
	$(ECHO) generating $@
	$(Q) $(BASERUBY) $(srcdir)/tool/generic_erb.rb -I$(srcdir) -o $@ \
		$(srcdir)/template/prelude.c.tmpl

$(PRELUDE_C): $(COMPILE_PRELUDE) \
	   $(PRELUDE_SCRIPTS)
	$(ECHO) generating $@
	$(Q) $(BASERUBY) $(srcdir)/tool/generic_erb.rb -I$(srcdir) -c -o $@ \
		$(srcdir)/template/prelude.c.tmpl $(PRELUDE_SCRIPTS)

$(GOLF_PRELUDE_C): $(COMPILE_PRELUDE) golf_prelude.rb
	$(ECHO) generating $@
	$(Q) $(BASERUBY) $(srcdir)/tool/generic_erb.rb -I$(srcdir) -c -o $@ \
		$(srcdir)/template/prelude.c.tmpl golf_prelude.rb

MAINCPPFLAGS = $(ENABLE_DEBUG_ENV:yes=-DRUBY_DEBUG_ENV=1)

$(MAINOBJ): $(srcdir)/$(MAINSRC)
	$(ECHO) compiling $(srcdir)/$(MAINSRC)
	$(Q) $(CC) $(MAINCPPFLAGS) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$(srcdir)/$(MAINSRC)

probes.dmyh: probes.d $(srcdir)/tool/gen_dummy_probes.rb

probes.dmyh:
	$(BASERUBY) $(srcdir)/tool/gen_dummy_probes.rb $(srcdir)/probes.d > $@

probes.h: probes.$(DTRACE_EXT)

prereq: incs srcs preludes PHONY

preludes: prelude.c
preludes: miniprelude.c
preludes: golf_prelude.c

$(srcdir)/revision.h:
	$(Q)$(gnumake:yes=#) $(RM) $(@F)
	$(Q)$(gnumake:yes=#) exit > $@ || exit > $(@F)

$(REVISION_H): $(srcdir)/version.h $(srcdir)/tool/file2lastrev.rb $(REVISION_FORCE)
	-$(Q) $(BASERUBY) $(srcdir)/tool/file2lastrev.rb -q --revision.h "$(srcdir)" > revision.tmp
	$(Q)$(IFCHANGE) "--timestamp=$@" "$(srcdir)/revision.h" revision.tmp

$(srcdir)/ext/ripper/ripper.c: $(srcdir)/ext/ripper/tools/preproc.rb $(srcdir)/parse.y id.h
	$(ECHO) generating $@
	$(Q) VPATH=$${PWD-`pwd`} && $(CHDIR) $(@D) && \
	sed -e 's/{\$$([^(){}]*)[^{}]*}//g' -e /AUTOGENERATED/q depend | \
	$(exec) $(MAKE) -f - $(mflags) \
		Q=$(Q) ECHO=$(ECHO) RM="$(RM)" top_srcdir=../.. srcdir=. VPATH="$${VPATH}" \
		RUBY="$(BASERUBY)" PATH_SEPARATOR="$(PATH_SEPARATOR)"

$(srcdir)/ext/json/parser/parser.c: $(srcdir)/ext/json/parser/parser.rl
	$(ECHO) generating $@
	$(Q) $(CHDIR) $(@D) && $(exec) $(MAKE) -f prereq.mk $(mflags) \
		Q=$(Q) ECHO=$(ECHO) top_srcdir=../../.. srcdir=. VPATH=../../.. BASERUBY="$(BASERUBY)"

$(srcdir)/ext/date/zonetab.h: $(srcdir)/ext/date/zonetab.list
	$(ECHO) generating $@
	$(Q) $(CHDIR) $(@D) && $(exec) $(MAKE) -f prereq.mk $(mflags) \
		Q=$(Q) ECHO=$(ECHO) top_srcdir=../.. srcdir=. VPATH=../.. BASERUBY="$(BASERUBY)"

$(srcdir)/ext/rbconfig/sizeof/sizes.c: $(srcdir)/ext/rbconfig/sizeof/depend \
		$(srcdir)/tool/generic_erb.rb $(srcdir)/template/sizes.c.tmpl $(srcdir)/configure.ac
	$(ECHO) generating $@
	$(Q) $(CHDIR) $(@D) && \
	sed '/AUTOGENERATED/q' depend | \
	$(exec) $(MAKE) -f - $(mflags) \
		Q=$(Q) ECHO=$(ECHO) top_srcdir=../../.. srcdir=. VPATH=../../.. RUBY="$(BASERUBY)" $(@F)

$(srcdir)/ext/rbconfig/sizeof/limits.c: $(srcdir)/ext/rbconfig/sizeof/depend \
		$(srcdir)/tool/generic_erb.rb $(srcdir)/template/limits.c.tmpl
	$(ECHO) generating $@
	$(Q) $(CHDIR) $(@D) && \
	sed '/AUTOGENERATED/q' depend | \
	$(exec) $(MAKE) -f - $(mflags) \
		Q=$(Q) ECHO=$(ECHO) top_srcdir=../../.. srcdir=. VPATH=../../.. RUBY="$(BASERUBY)" $(@F)

$(srcdir)/ext/socket/constdefs.c: $(srcdir)/ext/socket/depend
	$(Q) $(CHDIR) $(@D) && \
	sed '/AUTOGENERATED/q' depend | \
	$(exec) $(MAKE) -f - $(mflags) \
		Q=$(Q) ECHO=$(ECHO) top_srcdir=../.. srcdir=. VPATH=../.. RUBY="$(BASERUBY)"

$(srcdir)/ext/etc/constdefs.h: $(srcdir)/ext/etc/depend
	$(Q) $(CHDIR) $(@D) && \
	sed '/AUTOGENERATED/q' depend | \
	$(exec) $(MAKE) -f - $(mflags) \
		Q=$(Q) ECHO=$(ECHO) top_srcdir=../.. srcdir=. VPATH=../.. RUBY="$(BASERUBY)"

##

run: fake miniruby$(EXEEXT) PHONY
	$(BTESTRUBY) $(TESTRUN_SCRIPT) $(RUNOPT)

runruby: $(PROGRAM) PHONY
	$(RUNRUBY) $(TESTRUN_SCRIPT)

parse: fake miniruby$(EXEEXT) PHONY
	$(BTESTRUBY) --dump=parsetree_with_comment,insns $(TESTRUN_SCRIPT)

bisect: PHONY
	$(srcdir)/tool/bisect.sh miniruby $(srcdir)

bisect-ruby: PHONY
	$(srcdir)/tool/bisect.sh ruby $(srcdir)

COMPARE_RUBY = $(BASERUBY)
ITEM =
ARGS = $$(find $(srcdir)/benchmark -maxdepth 1 -name '*$(ITEM)*.yml' -o -name '*$(ITEM)*.rb' | sort)
OPTS =

# You can pass several options through OPTS environment variable.
# $ make benchmark ARGS="--help" displays more detail.
# for example,
#  $ make benchmark COMPARE_RUBY="ruby-trunk" OPTS="-e ruby-2.2.2"
# This command compares trunk and built-ruby and 2.2.2
benchmark: miniruby$(EXEEXT) update-benchmark-driver PHONY
	$(BASERUBY) -rrubygems -I$(srcdir)/benchmark/lib $(srcdir)/benchmark/benchmark-driver/exe/benchmark-driver \
	            --executables="compare-ruby::$(COMPARE_RUBY) -I$(EXTOUT)/common --disable-gem" \
	            --executables="built-ruby::$(MINIRUBY) -r$(srcdir)/prelude --disable-gem" \
	            $(ARGS) $(OPTS)

run.gdb:
	echo set breakpoint pending on         > run.gdb
	echo b ruby_debug_breakpoint          >> run.gdb
	echo '# handle SIGINT nostop'         >> run.gdb
	echo '# handle SIGPIPE nostop'        >> run.gdb
	echo '# b rb_longjmp'                 >> run.gdb
	echo source $(srcdir)/breakpoints.gdb >> run.gdb
	echo source $(srcdir)/.gdbinit        >> run.gdb
	echo 'set $$_exitcode = -999'         >> run.gdb
	echo run                              >> run.gdb
	echo 'if $$_exitcode != -999'         >> run.gdb
	echo '  quit'                         >> run.gdb
	echo end                              >> run.gdb


gdb: miniruby$(EXEEXT) run.gdb PHONY
	gdb -x run.gdb --quiet --args $(MINIRUBY) $(TESTRUN_SCRIPT)

gdb-ruby: $(PROGRAM) run.gdb PHONY
	$(Q) $(RUNRUBY_COMMAND) $(RUNRUBY_DEBUGGER) -- $(TESTRUN_SCRIPT)

LLDB_INIT = command script import -r $(srcdir)/misc/lldb_cruby.py

lldb: miniruby$(EXEEXT) PHONY
	lldb -o '$(LLDB_INIT)' miniruby$(EXEEXT) -- $(TESTRUN_SCRIPT)

lldb-ruby: $(PROGRAM) PHONY
	lldb $(enable_shared:yes=-o 'target modules add ${LIBRUBY_SO}') -o '$(LLDB_INIT)' $(PROGRAM) -- $(TESTRUN_SCRIPT)

DISTPKGS = gzip,zip,all
dist:
	$(BASERUBY) $(srcdir)/tool/make-snapshot \
	-srcdir=$(srcdir) -packages=$(DISTPKGS) \
	-unicode-version=$(UNICODE_VERSION) \
	tmp $(RELNAME)

up:: update-remote

up::
	-$(Q)$(MAKE) $(mflags) Q=$(Q) REVISION_FORCE=PHONY "$(REVISION_H)"

up::
	-$(Q)$(MAKE) $(mflags) Q=$(Q) after-update

after-update:: extract-extlibs

update-remote:: update-src update-download
update-download:: update-unicode update-gems download-extlibs

update-mspec:
update-rubyspec:

update-config_files: PHONY
	$(Q) $(BASERUBY) -C "$(srcdir)" tool/downloader.rb -d tool --cache-dir=$(CACHE_DIR) -e gnu \
	    config.guess config.sub

update-gems: PHONY
	$(ECHO) Downloading bundled gem files...
	$(Q) $(BASERUBY) -C "$(srcdir)" \
	    -I./tool -rdownloader -answ \
	    -e 'gem, ver = *$$F' \
	    -e 'old = Dir.glob("gems/#{gem}-*.gem")' \
	    -e 'gem = "#{gem}-#{ver}.gem"' \
	    -e 'Downloader::RubyGems.download(gem, "gems", nil) and' \
	    -e '(old.delete("gems/#{gem}"); !old.empty?) and' \
	    -e 'File.unlink(*old) and' \
	    -e 'FileUtils.rm_rf(old.map{'"|n|"'n.chomp(".gem")})' \
	    gems/bundled_gems

extract-gems: PHONY
	$(ECHO) Extracting bundled gem files...
	$(Q) $(RUNRUBY) -C "$(srcdir)/gems" \
	    -I../tool -rgem-unpack -answ \
	    -e 'gem, ver = *$$F' \
	    -e 'Gem.unpack("#{gem}-#{ver}.gem")' \
	    bundled_gems

update-bundled_gems: PHONY
	$(Q) $(RUNRUBY) -rrubygems \
	    -pla \
	    -e '(gem,src), = Gem::SpecFetcher.fetcher.detect(:latest) {'"|s|" \
	    -e   's.platform=="ruby"&&s.name==$$F[0]' \
	    -e '}' \
	    -e 'gem = src.fetch_spec(gem)' \
	    -e '$$_ = [gem.name, gem.version, gem.metadata["source_code_uri"]||gem.homepage].join(" ")' \
	     "$(srcdir)/gems/bundled_gems" | \
	"$(IFCHANGE)" "$(srcdir)/gems/bundled_gems" -

test-bundled-gems-precheck: $(arch)-fake.rb programs

test-bundled-gems-fetch: $(PREP)
	$(Q) $(BASERUBY) -C $(srcdir)/gems ../tool/fetch-bundled_gems.rb src bundled_gems

test-bundled-gems-prepare: test-bundled-gems-precheck test-bundled-gems-fetch
	$(XRUBY) -C "$(srcdir)" bin/gem install --no-document \
		--install-dir .bundle --conservative "bundler" "minitest:~> 5" 'test-unit' 'rake' 'hoe' 'yard' 'pry' 'packnga'

PREPARE_BUNDLED_GEMS = test-bundled-gems-prepare
test-bundled-gems: $(TEST_RUNNABLE)-test-bundled-gems
yes-test-bundled-gems: test-bundled-gems-run
no-test-bundled-gems:
test-bundled-gems-run: $(PREPARE_BUNDLED_GEMS)

test-bundler-precheck: $(arch)-fake.rb programs

yes-test-bundler-prepare: test-bundler-precheck
	$(XRUBY) -C "$(srcdir)" bin/gem install --no-document \
		--install-dir .bundle --conservative "rspec:~> 3.5"

RSPECOPTS = --format progress
BUNDLER_SPECS =
test-bundler: $(TEST_RUNNABLE)-test-bundler
yes-test-bundler: yes-test-bundler-prepare
	$(gnumake_recursive)$(Q) \
	$(XRUBY) -C $(srcdir) -Ispec/bundler .bundle/bin/rspec \
		--require spec_helper $(RSPECOPTS) spec/bundler/$(BUNDLER_SPECS)
no-test-bundler:

UNICODE_FILES = $(UNICODE_SRC_DATA_DIR)/UnicodeData.txt \
		$(UNICODE_SRC_DATA_DIR)/CompositionExclusions.txt \
		$(UNICODE_SRC_DATA_DIR)/NormalizationTest.txt \
		$(UNICODE_SRC_DATA_DIR)/CaseFolding.txt \
		$(UNICODE_SRC_DATA_DIR)/SpecialCasing.txt \
		$(empty)

UNICODE_PROPERTY_FILES =  \
		$(UNICODE_SRC_DATA_DIR)/Blocks.txt \
		$(UNICODE_SRC_DATA_DIR)/DerivedAge.txt \
		$(UNICODE_SRC_DATA_DIR)/DerivedCoreProperties.txt \
		$(UNICODE_SRC_DATA_DIR)/PropList.txt \
		$(UNICODE_SRC_DATA_DIR)/PropertyAliases.txt \
		$(UNICODE_SRC_DATA_DIR)/PropertyValueAliases.txt \
		$(UNICODE_SRC_DATA_DIR)/Scripts.txt \
		$(empty)

UNICODE_AUXILIARY_FILES =  \
		$(UNICODE_SRC_DATA_DIR)/auxiliary/GraphemeBreakProperty.txt \
		$(UNICODE_SRC_DATA_DIR)/auxiliary/GraphemeBreakTest.txt \
		$(empty)

UNICODE_EMOJI_FILES = \
		$(UNICODE_SRC_EMOJI_DATA_DIR)/emoji-data.txt \
		$(UNICODE_SRC_EMOJI_DATA_DIR)/emoji-sequences.txt \
		$(UNICODE_SRC_EMOJI_DATA_DIR)/emoji-test.txt \
		$(UNICODE_SRC_EMOJI_DATA_DIR)/emoji-variation-sequences.txt \
		$(UNICODE_SRC_EMOJI_DATA_DIR)/emoji-zwj-sequences.txt \
		$(empty)

update-unicode: $(UNICODE_FILES) $(UNICODE_PROPERTY_FILES)

CACHE_DIR = $(srcdir)/.downloaded-cache
UNICODE_DOWNLOAD = \
	$(BASERUBY) $(srcdir)/tool/downloader.rb \
	    --cache-dir=$(CACHE_DIR) \
	    --unicode-beta $(UNICODE_BETA) \
	    -d $(UNICODE_SRC_DATA_DIR) \
	    -p $(UNICODE_VERSION)/ucd \
	    -e $(ALWAYS_UPDATE_UNICODE:yes=-a) unicode
UNICODE_AUXILIARY_DOWNLOAD = \
	$(BASERUBY) $(srcdir)/tool/downloader.rb \
	    --cache-dir=$(CACHE_DIR) \
	    --unicode-beta $(UNICODE_BETA) \
	    -d $(UNICODE_SRC_DATA_DIR)/auxiliary \
	    -p $(UNICODE_VERSION)/ucd/auxiliary \
	    -e $(ALWAYS_UPDATE_UNICODE:yes=-a) unicode
UNICODE_EMOJI_DOWNLOAD = \
	$(BASERUBY) $(srcdir)/tool/downloader.rb \
	    --cache-dir=$(CACHE_DIR) \
	    --unicode-beta $(UNICODE_BETA) \
	    -d $(UNICODE_SRC_EMOJI_DATA_DIR) \
	    -p emoji/$(UNICODE_EMOJI_VERSION) \
	    -e $(ALWAYS_UPDATE_UNICODE:yes=-a) unicode

$(UNICODE_PROPERTY_FILES): update-unicode-property-files
update-unicode-property-files:
	$(ECHO) Downloading Unicode $(UNICODE_VERSION) property files...
	$(Q) $(UNICODE_DOWNLOAD) $(UNICODE_PROPERTY_FILES)
	$(ECHO) Downloading Unicode $(UNICODE_VERSION) auxiliary files...
	$(Q) $(MAKEDIRS) "$(UNICODE_SRC_DATA_DIR)/auxiliary"
	$(Q) $(UNICODE_AUXILIARY_DOWNLOAD) $(UNICODE_AUXILIARY_FILES)
	$(ECHO) Downloading Unicode emoji $(UNICODE_EMOJI_VERSION) files...
	$(Q) $(MAKEDIRS) "$(UNICODE_SRC_EMOJI_DATA_DIR)"
	$(Q) $(UNICODE_EMOJI_DOWNLOAD) $(UNICODE_EMOJI_FILES)

$(UNICODE_FILES): update-unicode-files
update-unicode-files:
	$(ECHO) Downloading Unicode $(UNICODE_VERSION) data files...
	$(Q) $(MAKEDIRS) "$(UNICODE_SRC_DATA_DIR)"
	$(Q) $(UNICODE_DOWNLOAD) $(UNICODE_FILES)

$(srcdir)/$(HAVE_BASERUBY:yes=lib/unicode_normalize/tables.rb): \
	$(UNICODE_SRC_DATA_DIR)/.unicode-tables.time

$(UNICODE_SRC_DATA_DIR)/$(ALWAYS_UPDATE_UNICODE:yes=.unicode-tables.time): \
	$(UNICODE_FILES) $(UNICODE_PROPERTY_FILES)

touch-unicode-files:
	$(MAKEDIRS) $(UNICODE_SRC_DATA_DIR)
	touch $(UNICODE_SRC_DATA_DIR)/.unicode-tables.time $(UNICODE_DATA_HEADERS)

$(UNICODE_SRC_DATA_DIR)/.unicode-tables.time: $(srcdir)/tool/generic_erb.rb \
		$(srcdir)/template/unicode_norm_gen.tmpl \
		$(ALWAYS_UPDATE_UNICODE:yes=update-unicode)
	$(Q) $(MAKE) $(@D)
	$(Q) $(BASERUBY) $(srcdir)/tool/generic_erb.rb \
		-c -t$@ -o $(srcdir)/lib/unicode_normalize/tables.rb \
		-I $(srcdir) \
		$(srcdir)/template/unicode_norm_gen.tmpl \
		$(UNICODE_DATA_DIR) lib/unicode_normalize

$(UNICODE_SRC_DATA_DIR):
	$(Q) $(exec) $(MAKEDIRS) $@ || exit && echo $(MAKE)

$(UNICODE_HDR_DIR)/$(ALWAYS_UPDATE_UNICODE:yes=name2ctype.h): \
		$(srcdir)/tool/enc-unicode.rb \
		$(UNICODE_SRC_DATA_DIR)/UnicodeData.txt \
		$(UNICODE_PROPERTY_FILES)

$(UNICODE_HDR_DIR)/name2ctype.h:
	$(MAKEDIRS) $(@D)
	$(BOOTSTRAPRUBY) $(srcdir)/tool/enc-unicode.rb --header \
		$(UNICODE_SRC_DATA_DIR) $(UNICODE_SRC_EMOJI_DATA_DIR) > $@.new
	$(MV) $@.new $@

# the next non-comment line was:
# $(UNICODE_HDR_DIR)/casefold.h: $(srcdir)/enc/unicode/case-folding.rb \
# but was changed to make sure CI works on systems that don't have gperf
unicode-up: $(UNICODE_DATA_HEADERS)

$(UNICODE_HDR_DIR)/$(ALWAYS_UPDATE_UNICODE:yes=casefold.h): \
		$(srcdir)/enc/unicode/case-folding.rb \
		$(UNICODE_SRC_DATA_DIR)/UnicodeData.txt \
		$(UNICODE_SRC_DATA_DIR)/SpecialCasing.txt \
		$(UNICODE_SRC_DATA_DIR)/CaseFolding.txt

$(UNICODE_HDR_DIR)/casefold.h:
	$(MAKEDIRS) $(@D)
	$(Q) $(BASERUBY) $(srcdir)/enc/unicode/case-folding.rb \
		--output-file=$@ \
		--mapping-data-directory=$(UNICODE_SRC_DATA_DIR)

download-extlibs:
	$(Q) $(BASERUBY) -C $(srcdir) -w tool/extlibs.rb --download ext

extract-extlibs:
	$(Q) $(BASERUBY) -C $(srcdir) -w tool/extlibs.rb --all ext

clean-extlibs:
	$(Q) $(RMALL) $(srcdir)/.downloaded-cache

clean-gems:
	$(Q) $(RM) gems/*.gem

CLEAN_CACHE = clean-extlibs

info: info-program info-libruby_a info-libruby_so info-arch
info-program: PHONY
	@echo PROGRAM=$(PROGRAM)
info-libruby_a: PHONY
	@echo LIBRUBY_A=$(LIBRUBY_A)
info-libruby_so: PHONY
	@echo LIBRUBY_SO=$(LIBRUBY_SO)
info-arch: PHONY
	@echo arch=$(arch)

change: PHONY
	$(BASERUBY) -C "$(srcdir)" ./tool/change_maker.rb $(CHANGES) > change.log

exam: check

love: sudo-precheck up all test exam install
	@echo love is all you need

great: exam

yes-test-all no-test-all: sudo-precheck

sudo-precheck: PHONY
	@$(SUDO) echo > $(NULL)

update-man-date: PHONY
	-$(Q) $(BASERUBY) -I"$(srcdir)/tool" -rvcs -i -p \
	-e 'BEGIN{@vcs=VCS.detect(ARGV.shift)}' \
	-e '$$_.sub!(/^(\.Dd ).*/){$$1+@vcs.modified(ARGF.path).strftime("%B %d, %Y")}' \
	"$(srcdir)" "$(srcdir)"/man/*.1

help: PHONY
	$(MESSAGE_BEGIN) \
	"                Makefile of Ruby" \
	"" \
	"targets:" \
	"  all (default):       builds all of below" \
	"  miniruby:            builds only miniruby" \
	"  encs:                builds encodings" \
	"  exts:                builds extensions" \
	"  main:                builds encodings, extensions and ruby" \
	"  docs:                builds documents" \
	"  install-capi:        builds C API documents" \
	"  run:                 runs test.rb by miniruby" \
	"  runruby:             runs test.rb by ruby you just built" \
	"  gdb:                 runs test.rb by miniruby under gdb" \
	"  gdb-ruby:            runs test.rb by ruby under gdb" \
	"  check:               equals make test test-all test-spec" \
	"  exam:                equals make check" \
	"  test:                ruby core tests" \
	"  test-all:            all ruby tests [TESTOPTS=-j4 TESTS=<test files>]" \
	"  test-spec:           run the Ruby spec suite" \
	"  test-rubyspec:       same as test-spec" \
	"  test-bundler:        run the Bundler spec" \
	"  test-bundled-gems:   run the test suite of bundled gems" \
	"  up:                  update local copy and autogenerated files" \
	"  benchmark:           benchmark this ruby and COMPARE_RUBY." \
	"  gcbench:             gc benchmark [GCBENCH_ITEM=<item_name>]" \
	"  gcbench-rdoc:        gc benchmark with GCBENCH_ITEM=rdoc" \
	"  install:             install all ruby distributions" \
	"  install-nodoc:       install without rdoc" \
	"  install-cross:       install cross compiling stuff" \
	"  clean:               clean for tarball" \
	"  distclean:           clean for repository" \
	"  change:              make change log template" \
	"  golf:                for golfers" \
	"  goruby:              same as golf" \
	"" \
	"see DeveloperHowto for more detail: " \
	"  https://bugs.ruby-lang.org/projects/ruby/wiki/DeveloperHowto" \
	$(MESSAGE_END)

# AUTOGENERATED DEPENDENCIES START
addr2line.$(OBJEXT): addr2line.c
addr2line.$(OBJEXT): addr2line.h
addr2line.$(OBJEXT): config.h
addr2line.$(OBJEXT): defines.h
addr2line.$(OBJEXT): missing.h
array.$(OBJEXT): $(hdrdir)/ruby/ruby.h
array.$(OBJEXT): $(top_srcdir)/include/ruby.h
array.$(OBJEXT): array.c
array.$(OBJEXT): config.h
array.$(OBJEXT): debug_counter.h
array.$(OBJEXT): defines.h
array.$(OBJEXT): encoding.h
array.$(OBJEXT): gc.h
array.$(OBJEXT): id.h
array.$(OBJEXT): intern.h
array.$(OBJEXT): internal.h
array.$(OBJEXT): io.h
array.$(OBJEXT): missing.h
array.$(OBJEXT): onigmo.h
array.$(OBJEXT): oniguruma.h
array.$(OBJEXT): probes.dmyh
array.$(OBJEXT): probes.h
array.$(OBJEXT): ruby_assert.h
array.$(OBJEXT): st.h
array.$(OBJEXT): subst.h
array.$(OBJEXT): transient_heap.h
array.$(OBJEXT): util.h
ast.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
ast.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
ast.$(OBJEXT): $(CCAN_DIR)/list/list.h
ast.$(OBJEXT): $(CCAN_DIR)/str/str.h
ast.$(OBJEXT): $(hdrdir)/ruby/ruby.h
ast.$(OBJEXT): $(top_srcdir)/include/ruby.h
ast.$(OBJEXT): ast.c
ast.$(OBJEXT): config.h
ast.$(OBJEXT): defines.h
ast.$(OBJEXT): encoding.h
ast.$(OBJEXT): id.h
ast.$(OBJEXT): intern.h
ast.$(OBJEXT): internal.h
ast.$(OBJEXT): iseq.h
ast.$(OBJEXT): method.h
ast.$(OBJEXT): missing.h
ast.$(OBJEXT): node.h
ast.$(OBJEXT): onigmo.h
ast.$(OBJEXT): oniguruma.h
ast.$(OBJEXT): ruby_assert.h
ast.$(OBJEXT): ruby_atomic.h
ast.$(OBJEXT): st.h
ast.$(OBJEXT): subst.h
ast.$(OBJEXT): thread_$(THREAD_MODEL).h
ast.$(OBJEXT): thread_native.h
ast.$(OBJEXT): util.h
ast.$(OBJEXT): vm_core.h
ast.$(OBJEXT): vm_opts.h
bignum.$(OBJEXT): $(hdrdir)/ruby/ruby.h
bignum.$(OBJEXT): $(top_srcdir)/include/ruby.h
bignum.$(OBJEXT): bignum.c
bignum.$(OBJEXT): config.h
bignum.$(OBJEXT): defines.h
bignum.$(OBJEXT): encoding.h
bignum.$(OBJEXT): id.h
bignum.$(OBJEXT): intern.h
bignum.$(OBJEXT): internal.h
bignum.$(OBJEXT): io.h
bignum.$(OBJEXT): missing.h
bignum.$(OBJEXT): onigmo.h
bignum.$(OBJEXT): oniguruma.h
bignum.$(OBJEXT): ruby_assert.h
bignum.$(OBJEXT): st.h
bignum.$(OBJEXT): subst.h
bignum.$(OBJEXT): thread.h
bignum.$(OBJEXT): util.h
class.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
class.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
class.$(OBJEXT): $(CCAN_DIR)/list/list.h
class.$(OBJEXT): $(CCAN_DIR)/str/str.h
class.$(OBJEXT): $(hdrdir)/ruby/ruby.h
class.$(OBJEXT): $(top_srcdir)/include/ruby.h
class.$(OBJEXT): class.c
class.$(OBJEXT): config.h
class.$(OBJEXT): constant.h
class.$(OBJEXT): defines.h
class.$(OBJEXT): encoding.h
class.$(OBJEXT): id.h
class.$(OBJEXT): id_table.h
class.$(OBJEXT): intern.h
class.$(OBJEXT): internal.h
class.$(OBJEXT): io.h
class.$(OBJEXT): method.h
class.$(OBJEXT): missing.h
class.$(OBJEXT): node.h
class.$(OBJEXT): onigmo.h
class.$(OBJEXT): oniguruma.h
class.$(OBJEXT): ruby_assert.h
class.$(OBJEXT): ruby_atomic.h
class.$(OBJEXT): st.h
class.$(OBJEXT): subst.h
class.$(OBJEXT): thread_$(THREAD_MODEL).h
class.$(OBJEXT): thread_native.h
class.$(OBJEXT): vm_core.h
class.$(OBJEXT): vm_debug.h
class.$(OBJEXT): vm_opts.h
compar.$(OBJEXT): $(hdrdir)/ruby/ruby.h
compar.$(OBJEXT): compar.c
compar.$(OBJEXT): config.h
compar.$(OBJEXT): defines.h
compar.$(OBJEXT): id.h
compar.$(OBJEXT): intern.h
compar.$(OBJEXT): missing.h
compar.$(OBJEXT): st.h
compar.$(OBJEXT): subst.h
compile.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
compile.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
compile.$(OBJEXT): $(CCAN_DIR)/list/list.h
compile.$(OBJEXT): $(CCAN_DIR)/str/str.h
compile.$(OBJEXT): $(hdrdir)/ruby/ruby.h
compile.$(OBJEXT): $(top_srcdir)/include/ruby.h
compile.$(OBJEXT): compile.c
compile.$(OBJEXT): config.h
compile.$(OBJEXT): defines.h
compile.$(OBJEXT): encindex.h
compile.$(OBJEXT): encoding.h
compile.$(OBJEXT): gc.h
compile.$(OBJEXT): id.h
compile.$(OBJEXT): id_table.h
compile.$(OBJEXT): insns.def
compile.$(OBJEXT): insns.inc
compile.$(OBJEXT): insns_info.inc
compile.$(OBJEXT): intern.h
compile.$(OBJEXT): internal.h
compile.$(OBJEXT): io.h
compile.$(OBJEXT): iseq.h
compile.$(OBJEXT): method.h
compile.$(OBJEXT): missing.h
compile.$(OBJEXT): node.h
compile.$(OBJEXT): onigmo.h
compile.$(OBJEXT): oniguruma.h
compile.$(OBJEXT): opt_sc.inc
compile.$(OBJEXT): optinsn.inc
compile.$(OBJEXT): optunifs.inc
compile.$(OBJEXT): re.h
compile.$(OBJEXT): regex.h
compile.$(OBJEXT): ruby_assert.h
compile.$(OBJEXT): ruby_atomic.h
compile.$(OBJEXT): st.h
compile.$(OBJEXT): subst.h
compile.$(OBJEXT): thread_$(THREAD_MODEL).h
compile.$(OBJEXT): thread_native.h
compile.$(OBJEXT): util.h
compile.$(OBJEXT): vm_core.h
compile.$(OBJEXT): vm_debug.h
compile.$(OBJEXT): vm_opts.h
complex.$(OBJEXT): $(hdrdir)/ruby/ruby.h
complex.$(OBJEXT): $(top_srcdir)/include/ruby.h
complex.$(OBJEXT): complex.c
complex.$(OBJEXT): config.h
complex.$(OBJEXT): defines.h
complex.$(OBJEXT): encoding.h
complex.$(OBJEXT): id.h
complex.$(OBJEXT): intern.h
complex.$(OBJEXT): internal.h
complex.$(OBJEXT): io.h
complex.$(OBJEXT): missing.h
complex.$(OBJEXT): onigmo.h
complex.$(OBJEXT): oniguruma.h
complex.$(OBJEXT): ruby_assert.h
complex.$(OBJEXT): st.h
complex.$(OBJEXT): subst.h
cont.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
cont.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
cont.$(OBJEXT): $(CCAN_DIR)/list/list.h
cont.$(OBJEXT): $(CCAN_DIR)/str/str.h
cont.$(OBJEXT): $(hdrdir)/ruby/ruby.h
cont.$(OBJEXT): $(top_srcdir)/include/ruby.h
cont.$(OBJEXT): $(COROUTINE_H)
cont.$(OBJEXT): config.h
cont.$(OBJEXT): cont.c
cont.$(OBJEXT): defines.h
cont.$(OBJEXT): encoding.h
cont.$(OBJEXT): eval_intern.h
cont.$(OBJEXT): gc.h
cont.$(OBJEXT): id.h
cont.$(OBJEXT): intern.h
cont.$(OBJEXT): internal.h
cont.$(OBJEXT): io.h
cont.$(OBJEXT): method.h
cont.$(OBJEXT): missing.h
cont.$(OBJEXT): mjit.h
cont.$(OBJEXT): node.h
cont.$(OBJEXT): onigmo.h
cont.$(OBJEXT): oniguruma.h
cont.$(OBJEXT): ruby_assert.h
cont.$(OBJEXT): ruby_atomic.h
cont.$(OBJEXT): st.h
cont.$(OBJEXT): subst.h
cont.$(OBJEXT): thread_$(THREAD_MODEL).h
cont.$(OBJEXT): thread_native.h
cont.$(OBJEXT): vm_core.h
cont.$(OBJEXT): vm_debug.h
cont.$(OBJEXT): vm_opts.h
debug.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
debug.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
debug.$(OBJEXT): $(CCAN_DIR)/list/list.h
debug.$(OBJEXT): $(CCAN_DIR)/str/str.h
debug.$(OBJEXT): $(hdrdir)/ruby/ruby.h
debug.$(OBJEXT): $(top_srcdir)/include/ruby.h
debug.$(OBJEXT): config.h
debug.$(OBJEXT): debug.c
debug.$(OBJEXT): defines.h
debug.$(OBJEXT): encoding.h
debug.$(OBJEXT): eval_intern.h
debug.$(OBJEXT): gc.h
debug.$(OBJEXT): id.h
debug.$(OBJEXT): intern.h
debug.$(OBJEXT): internal.h
debug.$(OBJEXT): io.h
debug.$(OBJEXT): method.h
debug.$(OBJEXT): missing.h
debug.$(OBJEXT): node.h
debug.$(OBJEXT): onigmo.h
debug.$(OBJEXT): oniguruma.h
debug.$(OBJEXT): ruby_assert.h
debug.$(OBJEXT): ruby_atomic.h
debug.$(OBJEXT): st.h
debug.$(OBJEXT): subst.h
debug.$(OBJEXT): symbol.h
debug.$(OBJEXT): thread_$(THREAD_MODEL).h
debug.$(OBJEXT): thread_native.h
debug.$(OBJEXT): util.h
debug.$(OBJEXT): vm_core.h
debug.$(OBJEXT): vm_debug.h
debug.$(OBJEXT): vm_opts.h
debug_counter.$(OBJEXT): $(hdrdir)/ruby/ruby.h
debug_counter.$(OBJEXT): $(top_srcdir)/include/ruby.h
debug_counter.$(OBJEXT): config.h
debug_counter.$(OBJEXT): debug_counter.c
debug_counter.$(OBJEXT): debug_counter.h
debug_counter.$(OBJEXT): defines.h
debug_counter.$(OBJEXT): encoding.h
debug_counter.$(OBJEXT): intern.h
debug_counter.$(OBJEXT): internal.h
debug_counter.$(OBJEXT): io.h
debug_counter.$(OBJEXT): missing.h
debug_counter.$(OBJEXT): onigmo.h
debug_counter.$(OBJEXT): oniguruma.h
debug_counter.$(OBJEXT): st.h
debug_counter.$(OBJEXT): subst.h
dir.$(OBJEXT): $(hdrdir)/ruby/ruby.h
dir.$(OBJEXT): $(top_srcdir)/include/ruby.h
dir.$(OBJEXT): config.h
dir.$(OBJEXT): defines.h
dir.$(OBJEXT): dir.c
dir.$(OBJEXT): encindex.h
dir.$(OBJEXT): encoding.h
dir.$(OBJEXT): id.h
dir.$(OBJEXT): intern.h
dir.$(OBJEXT): internal.h
dir.$(OBJEXT): io.h
dir.$(OBJEXT): missing.h
dir.$(OBJEXT): onigmo.h
dir.$(OBJEXT): oniguruma.h
dir.$(OBJEXT): st.h
dir.$(OBJEXT): subst.h
dir.$(OBJEXT): thread.h
dir.$(OBJEXT): util.h
dln.$(OBJEXT): $(hdrdir)/ruby/ruby.h
dln.$(OBJEXT): $(top_srcdir)/include/ruby.h
dln.$(OBJEXT): config.h
dln.$(OBJEXT): defines.h
dln.$(OBJEXT): dln.c
dln.$(OBJEXT): dln.h
dln.$(OBJEXT): intern.h
dln.$(OBJEXT): internal.h
dln.$(OBJEXT): missing.h
dln.$(OBJEXT): st.h
dln.$(OBJEXT): subst.h
dln_find.$(OBJEXT): $(hdrdir)/ruby/ruby.h
dln_find.$(OBJEXT): config.h
dln_find.$(OBJEXT): defines.h
dln_find.$(OBJEXT): dln.h
dln_find.$(OBJEXT): dln_find.c
dln_find.$(OBJEXT): intern.h
dln_find.$(OBJEXT): missing.h
dln_find.$(OBJEXT): st.h
dln_find.$(OBJEXT): subst.h
dmydln.$(OBJEXT): $(hdrdir)/ruby/ruby.h
dmydln.$(OBJEXT): config.h
dmydln.$(OBJEXT): defines.h
dmydln.$(OBJEXT): dmydln.c
dmydln.$(OBJEXT): intern.h
dmydln.$(OBJEXT): missing.h
dmydln.$(OBJEXT): st.h
dmydln.$(OBJEXT): subst.h
dmyenc.$(OBJEXT): dmyenc.c
dmyext.$(OBJEXT): dmyext.c
enc/ascii.$(OBJEXT): config.h
enc/ascii.$(OBJEXT): defines.h
enc/ascii.$(OBJEXT): enc/ascii.c
enc/ascii.$(OBJEXT): encindex.h
enc/ascii.$(OBJEXT): missing.h
enc/ascii.$(OBJEXT): oniguruma.h
enc/ascii.$(OBJEXT): regenc.h
enc/trans/newline.$(OBJEXT): $(hdrdir)/ruby/ruby.h
enc/trans/newline.$(OBJEXT): config.h
enc/trans/newline.$(OBJEXT): defines.h
enc/trans/newline.$(OBJEXT): enc/trans/newline.c
enc/trans/newline.$(OBJEXT): intern.h
enc/trans/newline.$(OBJEXT): missing.h
enc/trans/newline.$(OBJEXT): st.h
enc/trans/newline.$(OBJEXT): subst.h
enc/trans/newline.$(OBJEXT): transcode_data.h
enc/unicode.$(OBJEXT): $(UNICODE_HDR_DIR)/casefold.h
enc/unicode.$(OBJEXT): $(UNICODE_HDR_DIR)/name2ctype.h
enc/unicode.$(OBJEXT): $(hdrdir)/ruby/ruby.h
enc/unicode.$(OBJEXT): config.h
enc/unicode.$(OBJEXT): defines.h
enc/unicode.$(OBJEXT): enc/unicode.c
enc/unicode.$(OBJEXT): intern.h
enc/unicode.$(OBJEXT): missing.h
enc/unicode.$(OBJEXT): onigmo.h
enc/unicode.$(OBJEXT): oniguruma.h
enc/unicode.$(OBJEXT): regenc.h
enc/unicode.$(OBJEXT): regint.h
enc/unicode.$(OBJEXT): st.h
enc/unicode.$(OBJEXT): subst.h
enc/us_ascii.$(OBJEXT): config.h
enc/us_ascii.$(OBJEXT): defines.h
enc/us_ascii.$(OBJEXT): enc/us_ascii.c
enc/us_ascii.$(OBJEXT): encindex.h
enc/us_ascii.$(OBJEXT): missing.h
enc/us_ascii.$(OBJEXT): oniguruma.h
enc/us_ascii.$(OBJEXT): regenc.h
enc/utf_8.$(OBJEXT): config.h
enc/utf_8.$(OBJEXT): defines.h
enc/utf_8.$(OBJEXT): enc/utf_8.c
enc/utf_8.$(OBJEXT): encindex.h
enc/utf_8.$(OBJEXT): missing.h
enc/utf_8.$(OBJEXT): oniguruma.h
enc/utf_8.$(OBJEXT): regenc.h
encoding.$(OBJEXT): $(hdrdir)/ruby/ruby.h
encoding.$(OBJEXT): $(top_srcdir)/include/ruby.h
encoding.$(OBJEXT): config.h
encoding.$(OBJEXT): defines.h
encoding.$(OBJEXT): encindex.h
encoding.$(OBJEXT): encoding.c
encoding.$(OBJEXT): encoding.h
encoding.$(OBJEXT): intern.h
encoding.$(OBJEXT): internal.h
encoding.$(OBJEXT): io.h
encoding.$(OBJEXT): missing.h
encoding.$(OBJEXT): onigmo.h
encoding.$(OBJEXT): oniguruma.h
encoding.$(OBJEXT): regenc.h
encoding.$(OBJEXT): ruby_assert.h
encoding.$(OBJEXT): st.h
encoding.$(OBJEXT): subst.h
encoding.$(OBJEXT): util.h
enum.$(OBJEXT): $(hdrdir)/ruby/ruby.h
enum.$(OBJEXT): $(top_srcdir)/include/ruby.h
enum.$(OBJEXT): config.h
enum.$(OBJEXT): defines.h
enum.$(OBJEXT): encoding.h
enum.$(OBJEXT): enum.c
enum.$(OBJEXT): id.h
enum.$(OBJEXT): intern.h
enum.$(OBJEXT): internal.h
enum.$(OBJEXT): io.h
enum.$(OBJEXT): missing.h
enum.$(OBJEXT): onigmo.h
enum.$(OBJEXT): oniguruma.h
enum.$(OBJEXT): st.h
enum.$(OBJEXT): subst.h
enum.$(OBJEXT): symbol.h
enum.$(OBJEXT): transient_heap.h
enum.$(OBJEXT): util.h
enumerator.$(OBJEXT): $(hdrdir)/ruby/ruby.h
enumerator.$(OBJEXT): $(top_srcdir)/include/ruby.h
enumerator.$(OBJEXT): config.h
enumerator.$(OBJEXT): defines.h
enumerator.$(OBJEXT): encoding.h
enumerator.$(OBJEXT): enumerator.c
enumerator.$(OBJEXT): id.h
enumerator.$(OBJEXT): intern.h
enumerator.$(OBJEXT): internal.h
enumerator.$(OBJEXT): io.h
enumerator.$(OBJEXT): missing.h
enumerator.$(OBJEXT): onigmo.h
enumerator.$(OBJEXT): oniguruma.h
enumerator.$(OBJEXT): st.h
enumerator.$(OBJEXT): subst.h
error.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
error.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
error.$(OBJEXT): $(CCAN_DIR)/list/list.h
error.$(OBJEXT): $(CCAN_DIR)/str/str.h
error.$(OBJEXT): $(hdrdir)/ruby/ruby.h
error.$(OBJEXT): $(top_srcdir)/include/ruby.h
error.$(OBJEXT): config.h
error.$(OBJEXT): defines.h
error.$(OBJEXT): encoding.h
error.$(OBJEXT): error.c
error.$(OBJEXT): id.h
error.$(OBJEXT): intern.h
error.$(OBJEXT): internal.h
error.$(OBJEXT): io.h
error.$(OBJEXT): known_errors.inc
error.$(OBJEXT): method.h
error.$(OBJEXT): missing.h
error.$(OBJEXT): node.h
error.$(OBJEXT): onigmo.h
error.$(OBJEXT): oniguruma.h
error.$(OBJEXT): ruby_assert.h
error.$(OBJEXT): ruby_atomic.h
error.$(OBJEXT): st.h
error.$(OBJEXT): subst.h
error.$(OBJEXT): thread_$(THREAD_MODEL).h
error.$(OBJEXT): thread_native.h
error.$(OBJEXT): vm_core.h
error.$(OBJEXT): vm_debug.h
error.$(OBJEXT): vm_opts.h
eval.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
eval.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
eval.$(OBJEXT): $(CCAN_DIR)/list/list.h
eval.$(OBJEXT): $(CCAN_DIR)/str/str.h
eval.$(OBJEXT): $(hdrdir)/ruby/ruby.h
eval.$(OBJEXT): $(top_srcdir)/include/ruby.h
eval.$(OBJEXT): config.h
eval.$(OBJEXT): defines.h
eval.$(OBJEXT): encoding.h
eval.$(OBJEXT): eval.c
eval.$(OBJEXT): eval_error.c
eval.$(OBJEXT): eval_intern.h
eval.$(OBJEXT): eval_jump.c
eval.$(OBJEXT): gc.h
eval.$(OBJEXT): id.h
eval.$(OBJEXT): intern.h
eval.$(OBJEXT): internal.h
eval.$(OBJEXT): io.h
eval.$(OBJEXT): iseq.h
eval.$(OBJEXT): method.h
eval.$(OBJEXT): missing.h
eval.$(OBJEXT): mjit.h
eval.$(OBJEXT): node.h
eval.$(OBJEXT): onigmo.h
eval.$(OBJEXT): oniguruma.h
eval.$(OBJEXT): probes.dmyh
eval.$(OBJEXT): probes.h
eval.$(OBJEXT): probes_helper.h
eval.$(OBJEXT): ruby_assert.h
eval.$(OBJEXT): ruby_atomic.h
eval.$(OBJEXT): st.h
eval.$(OBJEXT): subst.h
eval.$(OBJEXT): thread_$(THREAD_MODEL).h
eval.$(OBJEXT): thread_native.h
eval.$(OBJEXT): vm.h
eval.$(OBJEXT): vm_core.h
eval.$(OBJEXT): vm_debug.h
eval.$(OBJEXT): vm_opts.h
explicit_bzero.$(OBJEXT): config.h
explicit_bzero.$(OBJEXT): explicit_bzero.c
explicit_bzero.$(OBJEXT): missing.h
file.$(OBJEXT): $(hdrdir)/ruby/ruby.h
file.$(OBJEXT): $(top_srcdir)/include/ruby.h
file.$(OBJEXT): config.h
file.$(OBJEXT): defines.h
file.$(OBJEXT): dln.h
file.$(OBJEXT): encindex.h
file.$(OBJEXT): encoding.h
file.$(OBJEXT): file.c
file.$(OBJEXT): id.h
file.$(OBJEXT): intern.h
file.$(OBJEXT): internal.h
file.$(OBJEXT): io.h
file.$(OBJEXT): missing.h
file.$(OBJEXT): onigmo.h
file.$(OBJEXT): oniguruma.h
file.$(OBJEXT): st.h
file.$(OBJEXT): subst.h
file.$(OBJEXT): thread.h
file.$(OBJEXT): util.h
gc.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
gc.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
gc.$(OBJEXT): $(CCAN_DIR)/list/list.h
gc.$(OBJEXT): $(CCAN_DIR)/str/str.h
gc.$(OBJEXT): $(hdrdir)/ruby/ruby.h
gc.$(OBJEXT): $(top_srcdir)/include/ruby.h
gc.$(OBJEXT): config.h
gc.$(OBJEXT): constant.h
gc.$(OBJEXT): debug.h
gc.$(OBJEXT): debug_counter.h
gc.$(OBJEXT): defines.h
gc.$(OBJEXT): encoding.h
gc.$(OBJEXT): eval_intern.h
gc.$(OBJEXT): gc.c
gc.$(OBJEXT): gc.h
gc.$(OBJEXT): id.h
gc.$(OBJEXT): id_table.h
gc.$(OBJEXT): intern.h
gc.$(OBJEXT): internal.h
gc.$(OBJEXT): io.h
gc.$(OBJEXT): method.h
gc.$(OBJEXT): missing.h
gc.$(OBJEXT): mjit.h
gc.$(OBJEXT): node.h
gc.$(OBJEXT): onigmo.h
gc.$(OBJEXT): oniguruma.h
gc.$(OBJEXT): probes.dmyh
gc.$(OBJEXT): probes.h
gc.$(OBJEXT): re.h
gc.$(OBJEXT): regenc.h
gc.$(OBJEXT): regex.h
gc.$(OBJEXT): regint.h
gc.$(OBJEXT): ruby_assert.h
gc.$(OBJEXT): ruby_atomic.h
gc.$(OBJEXT): st.h
gc.$(OBJEXT): subst.h
gc.$(OBJEXT): thread.h
gc.$(OBJEXT): thread_$(THREAD_MODEL).h
gc.$(OBJEXT): thread_native.h
gc.$(OBJEXT): transient_heap.h
gc.$(OBJEXT): util.h
gc.$(OBJEXT): vm_core.h
gc.$(OBJEXT): vm_debug.h
gc.$(OBJEXT): vm_opts.h
golf_prelude.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
golf_prelude.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
golf_prelude.$(OBJEXT): $(CCAN_DIR)/list/list.h
golf_prelude.$(OBJEXT): $(CCAN_DIR)/str/str.h
golf_prelude.$(OBJEXT): $(hdrdir)/ruby/ruby.h
golf_prelude.$(OBJEXT): $(top_srcdir)/include/ruby.h
golf_prelude.$(OBJEXT): config.h
golf_prelude.$(OBJEXT): defines.h
golf_prelude.$(OBJEXT): encoding.h
golf_prelude.$(OBJEXT): golf_prelude.c
golf_prelude.$(OBJEXT): golf_prelude.rb
golf_prelude.$(OBJEXT): id.h
golf_prelude.$(OBJEXT): intern.h
golf_prelude.$(OBJEXT): internal.h
golf_prelude.$(OBJEXT): io.h
golf_prelude.$(OBJEXT): iseq.h
golf_prelude.$(OBJEXT): method.h
golf_prelude.$(OBJEXT): missing.h
golf_prelude.$(OBJEXT): node.h
golf_prelude.$(OBJEXT): onigmo.h
golf_prelude.$(OBJEXT): oniguruma.h
golf_prelude.$(OBJEXT): ruby_assert.h
golf_prelude.$(OBJEXT): ruby_atomic.h
golf_prelude.$(OBJEXT): st.h
golf_prelude.$(OBJEXT): subst.h
golf_prelude.$(OBJEXT): thread_$(THREAD_MODEL).h
golf_prelude.$(OBJEXT): thread_native.h
golf_prelude.$(OBJEXT): vm_core.h
golf_prelude.$(OBJEXT): vm_debug.h
golf_prelude.$(OBJEXT): vm_opts.h
goruby.$(OBJEXT): $(hdrdir)/ruby/ruby.h
goruby.$(OBJEXT): $(top_srcdir)/include/ruby.h
goruby.$(OBJEXT): backward.h
goruby.$(OBJEXT): config.h
goruby.$(OBJEXT): defines.h
goruby.$(OBJEXT): goruby.c
goruby.$(OBJEXT): intern.h
goruby.$(OBJEXT): main.c
goruby.$(OBJEXT): missing.h
goruby.$(OBJEXT): node.h
goruby.$(OBJEXT): st.h
goruby.$(OBJEXT): subst.h
goruby.$(OBJEXT): vm_debug.h
hash.$(OBJEXT): $(hdrdir)/ruby/ruby.h
hash.$(OBJEXT): $(top_srcdir)/include/ruby.h
hash.$(OBJEXT): config.h
hash.$(OBJEXT): debug_counter.h
hash.$(OBJEXT): defines.h
hash.$(OBJEXT): encoding.h
hash.$(OBJEXT): gc.h
hash.$(OBJEXT): hash.c
hash.$(OBJEXT): id.h
hash.$(OBJEXT): intern.h
hash.$(OBJEXT): internal.h
hash.$(OBJEXT): io.h
hash.$(OBJEXT): missing.h
hash.$(OBJEXT): onigmo.h
hash.$(OBJEXT): oniguruma.h
hash.$(OBJEXT): probes.dmyh
hash.$(OBJEXT): probes.h
hash.$(OBJEXT): ruby_assert.h
hash.$(OBJEXT): st.h
hash.$(OBJEXT): subst.h
hash.$(OBJEXT): symbol.h
hash.$(OBJEXT): transient_heap.h
hash.$(OBJEXT): util.h
inits.$(OBJEXT): $(hdrdir)/ruby/ruby.h
inits.$(OBJEXT): $(top_srcdir)/include/ruby.h
inits.$(OBJEXT): config.h
inits.$(OBJEXT): defines.h
inits.$(OBJEXT): encoding.h
inits.$(OBJEXT): inits.c
inits.$(OBJEXT): intern.h
inits.$(OBJEXT): internal.h
inits.$(OBJEXT): io.h
inits.$(OBJEXT): missing.h
inits.$(OBJEXT): onigmo.h
inits.$(OBJEXT): oniguruma.h
inits.$(OBJEXT): st.h
inits.$(OBJEXT): subst.h
io.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
io.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
io.$(OBJEXT): $(CCAN_DIR)/list/list.h
io.$(OBJEXT): $(CCAN_DIR)/str/str.h
io.$(OBJEXT): $(hdrdir)/ruby/ruby.h
io.$(OBJEXT): $(top_srcdir)/include/ruby.h
io.$(OBJEXT): config.h
io.$(OBJEXT): defines.h
io.$(OBJEXT): dln.h
io.$(OBJEXT): encindex.h
io.$(OBJEXT): encoding.h
io.$(OBJEXT): id.h
io.$(OBJEXT): intern.h
io.$(OBJEXT): internal.h
io.$(OBJEXT): io.c
io.$(OBJEXT): io.h
io.$(OBJEXT): method.h
io.$(OBJEXT): missing.h
io.$(OBJEXT): node.h
io.$(OBJEXT): onigmo.h
io.$(OBJEXT): oniguruma.h
io.$(OBJEXT): ruby_assert.h
io.$(OBJEXT): ruby_atomic.h
io.$(OBJEXT): st.h
io.$(OBJEXT): subst.h
io.$(OBJEXT): thread.h
io.$(OBJEXT): thread_$(THREAD_MODEL).h
io.$(OBJEXT): thread_native.h
io.$(OBJEXT): util.h
io.$(OBJEXT): vm_core.h
io.$(OBJEXT): vm_opts.h
iseq.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
iseq.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
iseq.$(OBJEXT): $(CCAN_DIR)/list/list.h
iseq.$(OBJEXT): $(CCAN_DIR)/str/str.h
iseq.$(OBJEXT): $(hdrdir)/ruby/ruby.h
iseq.$(OBJEXT): $(top_srcdir)/include/ruby.h
iseq.$(OBJEXT): config.h
iseq.$(OBJEXT): defines.h
iseq.$(OBJEXT): encoding.h
iseq.$(OBJEXT): eval_intern.h
iseq.$(OBJEXT): gc.h
iseq.$(OBJEXT): id.h
iseq.$(OBJEXT): id_table.h
iseq.$(OBJEXT): insns.def
iseq.$(OBJEXT): insns.inc
iseq.$(OBJEXT): insns_info.inc
iseq.$(OBJEXT): intern.h
iseq.$(OBJEXT): internal.h
iseq.$(OBJEXT): io.h
iseq.$(OBJEXT): iseq.c
iseq.$(OBJEXT): iseq.h
iseq.$(OBJEXT): method.h
iseq.$(OBJEXT): missing.h
iseq.$(OBJEXT): mjit.h
iseq.$(OBJEXT): node.h
iseq.$(OBJEXT): node_name.inc
iseq.$(OBJEXT): onigmo.h
iseq.$(OBJEXT): oniguruma.h
iseq.$(OBJEXT): ruby_assert.h
iseq.$(OBJEXT): ruby_atomic.h
iseq.$(OBJEXT): st.h
iseq.$(OBJEXT): subst.h
iseq.$(OBJEXT): thread_$(THREAD_MODEL).h
iseq.$(OBJEXT): thread_native.h
iseq.$(OBJEXT): util.h
iseq.$(OBJEXT): vm_core.h
iseq.$(OBJEXT): vm_debug.h
iseq.$(OBJEXT): vm_opts.h
load.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
load.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
load.$(OBJEXT): $(CCAN_DIR)/list/list.h
load.$(OBJEXT): $(CCAN_DIR)/str/str.h
load.$(OBJEXT): $(hdrdir)/ruby/ruby.h
load.$(OBJEXT): $(top_srcdir)/include/ruby.h
load.$(OBJEXT): config.h
load.$(OBJEXT): defines.h
load.$(OBJEXT): dln.h
load.$(OBJEXT): encoding.h
load.$(OBJEXT): eval_intern.h
load.$(OBJEXT): id.h
load.$(OBJEXT): intern.h
load.$(OBJEXT): internal.h
load.$(OBJEXT): io.h
load.$(OBJEXT): load.c
load.$(OBJEXT): method.h
load.$(OBJEXT): missing.h
load.$(OBJEXT): node.h
load.$(OBJEXT): onigmo.h
load.$(OBJEXT): oniguruma.h
load.$(OBJEXT): probes.dmyh
load.$(OBJEXT): probes.h
load.$(OBJEXT): ruby_assert.h
load.$(OBJEXT): ruby_atomic.h
load.$(OBJEXT): st.h
load.$(OBJEXT): subst.h
load.$(OBJEXT): thread_$(THREAD_MODEL).h
load.$(OBJEXT): thread_native.h
load.$(OBJEXT): util.h
load.$(OBJEXT): vm_core.h
load.$(OBJEXT): vm_debug.h
load.$(OBJEXT): vm_opts.h
loadpath.$(OBJEXT): $(hdrdir)/ruby/ruby.h
loadpath.$(OBJEXT): $(hdrdir)/ruby/version.h
loadpath.$(OBJEXT): $(top_srcdir)/version.h
loadpath.$(OBJEXT): config.h
loadpath.$(OBJEXT): defines.h
loadpath.$(OBJEXT): intern.h
loadpath.$(OBJEXT): loadpath.c
loadpath.$(OBJEXT): missing.h
loadpath.$(OBJEXT): st.h
loadpath.$(OBJEXT): subst.h
loadpath.$(OBJEXT): verconf.h
localeinit.$(OBJEXT): $(hdrdir)/ruby/ruby.h
localeinit.$(OBJEXT): $(top_srcdir)/include/ruby.h
localeinit.$(OBJEXT): config.h
localeinit.$(OBJEXT): defines.h
localeinit.$(OBJEXT): encindex.h
localeinit.$(OBJEXT): encoding.h
localeinit.$(OBJEXT): intern.h
localeinit.$(OBJEXT): internal.h
localeinit.$(OBJEXT): io.h
localeinit.$(OBJEXT): localeinit.c
localeinit.$(OBJEXT): missing.h
localeinit.$(OBJEXT): onigmo.h
localeinit.$(OBJEXT): oniguruma.h
localeinit.$(OBJEXT): st.h
localeinit.$(OBJEXT): subst.h
main.$(OBJEXT): $(hdrdir)/ruby/ruby.h
main.$(OBJEXT): $(top_srcdir)/include/ruby.h
main.$(OBJEXT): backward.h
main.$(OBJEXT): config.h
main.$(OBJEXT): defines.h
main.$(OBJEXT): intern.h
main.$(OBJEXT): main.c
main.$(OBJEXT): missing.h
main.$(OBJEXT): node.h
main.$(OBJEXT): st.h
main.$(OBJEXT): subst.h
main.$(OBJEXT): vm_debug.h
marshal.$(OBJEXT): $(hdrdir)/ruby/ruby.h
marshal.$(OBJEXT): $(top_srcdir)/include/ruby.h
marshal.$(OBJEXT): config.h
marshal.$(OBJEXT): defines.h
marshal.$(OBJEXT): encindex.h
marshal.$(OBJEXT): encoding.h
marshal.$(OBJEXT): id_table.h
marshal.$(OBJEXT): intern.h
marshal.$(OBJEXT): internal.h
marshal.$(OBJEXT): io.h
marshal.$(OBJEXT): marshal.c
marshal.$(OBJEXT): missing.h
marshal.$(OBJEXT): onigmo.h
marshal.$(OBJEXT): oniguruma.h
marshal.$(OBJEXT): st.h
marshal.$(OBJEXT): subst.h
marshal.$(OBJEXT): util.h
math.$(OBJEXT): $(hdrdir)/ruby/ruby.h
math.$(OBJEXT): $(top_srcdir)/include/ruby.h
math.$(OBJEXT): config.h
math.$(OBJEXT): defines.h
math.$(OBJEXT): encoding.h
math.$(OBJEXT): intern.h
math.$(OBJEXT): internal.h
math.$(OBJEXT): io.h
math.$(OBJEXT): math.c
math.$(OBJEXT): missing.h
math.$(OBJEXT): onigmo.h
math.$(OBJEXT): oniguruma.h
math.$(OBJEXT): st.h
math.$(OBJEXT): subst.h
miniinit.$(OBJEXT): $(hdrdir)/ruby/ruby.h
miniinit.$(OBJEXT): config.h
miniinit.$(OBJEXT): defines.h
miniinit.$(OBJEXT): encoding.h
miniinit.$(OBJEXT): intern.h
miniinit.$(OBJEXT): miniinit.c
miniinit.$(OBJEXT): missing.h
miniinit.$(OBJEXT): onigmo.h
miniinit.$(OBJEXT): oniguruma.h
miniinit.$(OBJEXT): st.h
miniinit.$(OBJEXT): subst.h
miniprelude.$(OBJEXT): iseq.h
miniprelude.$(OBJEXT): miniprelude.c
mjit.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
mjit.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
mjit.$(OBJEXT): $(CCAN_DIR)/list/list.h
mjit.$(OBJEXT): $(CCAN_DIR)/str/str.h
mjit.$(OBJEXT): $(hdrdir)/ruby/ruby.h
mjit.$(OBJEXT): $(top_srcdir)/include/ruby.h
mjit.$(OBJEXT): config.h
mjit.$(OBJEXT): constant.h
mjit.$(OBJEXT): debug.h
mjit.$(OBJEXT): defines.h
mjit.$(OBJEXT): dln.h
mjit.$(OBJEXT): gc.h
mjit.$(OBJEXT): id.h
mjit.$(OBJEXT): id_table.h
mjit.$(OBJEXT): intern.h
mjit.$(OBJEXT): internal.h
mjit.$(OBJEXT): method.h
mjit.$(OBJEXT): missing.h
mjit.$(OBJEXT): mjit.c
mjit.$(OBJEXT): mjit.h
mjit.$(OBJEXT): mjit_config.h
mjit.$(OBJEXT): mjit_worker.c
mjit.$(OBJEXT): node.h
mjit.$(OBJEXT): ruby_assert.h
mjit.$(OBJEXT): ruby_atomic.h
mjit.$(OBJEXT): st.h
mjit.$(OBJEXT): subst.h
mjit.$(OBJEXT): thread.h
mjit.$(OBJEXT): thread_$(THREAD_MODEL).h
mjit.$(OBJEXT): thread_native.h
mjit.$(OBJEXT): util.h
mjit.$(OBJEXT): vm_core.h
mjit.$(OBJEXT): vm_opts.h
mjit_compile.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
mjit_compile.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
mjit_compile.$(OBJEXT): $(CCAN_DIR)/list/list.h
mjit_compile.$(OBJEXT): $(CCAN_DIR)/str/str.h
mjit_compile.$(OBJEXT): $(hdrdir)/ruby/ruby.h
mjit_compile.$(OBJEXT): $(top_srcdir)/include/ruby.h
mjit_compile.$(OBJEXT): config.h
mjit_compile.$(OBJEXT): defines.h
mjit_compile.$(OBJEXT): id.h
mjit_compile.$(OBJEXT): insns.def
mjit_compile.$(OBJEXT): insns.inc
mjit_compile.$(OBJEXT): insns_info.inc
mjit_compile.$(OBJEXT): intern.h
mjit_compile.$(OBJEXT): internal.h
mjit_compile.$(OBJEXT): iseq.h
mjit_compile.$(OBJEXT): method.h
mjit_compile.$(OBJEXT): missing.h
mjit_compile.$(OBJEXT): mjit.h
mjit_compile.$(OBJEXT): mjit_compile.c
mjit_compile.$(OBJEXT): mjit_compile.inc
mjit_compile.$(OBJEXT): node.h
mjit_compile.$(OBJEXT): ruby_assert.h
mjit_compile.$(OBJEXT): ruby_atomic.h
mjit_compile.$(OBJEXT): st.h
mjit_compile.$(OBJEXT): subst.h
mjit_compile.$(OBJEXT): thread_$(THREAD_MODEL).h
mjit_compile.$(OBJEXT): thread_native.h
mjit_compile.$(OBJEXT): vm_core.h
mjit_compile.$(OBJEXT): vm_exec.h
mjit_compile.$(OBJEXT): vm_insnhelper.h
mjit_compile.$(OBJEXT): vm_opts.h
node.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
node.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
node.$(OBJEXT): $(CCAN_DIR)/list/list.h
node.$(OBJEXT): $(CCAN_DIR)/str/str.h
node.$(OBJEXT): $(hdrdir)/ruby/ruby.h
node.$(OBJEXT): $(top_srcdir)/include/ruby.h
node.$(OBJEXT): config.h
node.$(OBJEXT): defines.h
node.$(OBJEXT): encoding.h
node.$(OBJEXT): id.h
node.$(OBJEXT): intern.h
node.$(OBJEXT): internal.h
node.$(OBJEXT): io.h
node.$(OBJEXT): method.h
node.$(OBJEXT): missing.h
node.$(OBJEXT): node.c
node.$(OBJEXT): node.h
node.$(OBJEXT): onigmo.h
node.$(OBJEXT): oniguruma.h
node.$(OBJEXT): ruby_assert.h
node.$(OBJEXT): ruby_atomic.h
node.$(OBJEXT): st.h
node.$(OBJEXT): subst.h
node.$(OBJEXT): thread_$(THREAD_MODEL).h
node.$(OBJEXT): thread_native.h
node.$(OBJEXT): vm_core.h
node.$(OBJEXT): vm_debug.h
node.$(OBJEXT): vm_opts.h
numeric.$(OBJEXT): $(hdrdir)/ruby/ruby.h
numeric.$(OBJEXT): $(top_srcdir)/include/ruby.h
numeric.$(OBJEXT): config.h
numeric.$(OBJEXT): defines.h
numeric.$(OBJEXT): encoding.h
numeric.$(OBJEXT): id.h
numeric.$(OBJEXT): intern.h
numeric.$(OBJEXT): internal.h
numeric.$(OBJEXT): io.h
numeric.$(OBJEXT): missing.h
numeric.$(OBJEXT): numeric.c
numeric.$(OBJEXT): onigmo.h
numeric.$(OBJEXT): oniguruma.h
numeric.$(OBJEXT): st.h
numeric.$(OBJEXT): subst.h
numeric.$(OBJEXT): util.h
object.$(OBJEXT): $(hdrdir)/ruby/ruby.h
object.$(OBJEXT): $(top_srcdir)/include/ruby.h
object.$(OBJEXT): config.h
object.$(OBJEXT): constant.h
object.$(OBJEXT): defines.h
object.$(OBJEXT): encoding.h
object.$(OBJEXT): id.h
object.$(OBJEXT): intern.h
object.$(OBJEXT): internal.h
object.$(OBJEXT): io.h
object.$(OBJEXT): missing.h
object.$(OBJEXT): object.c
object.$(OBJEXT): onigmo.h
object.$(OBJEXT): oniguruma.h
object.$(OBJEXT): probes.dmyh
object.$(OBJEXT): probes.h
object.$(OBJEXT): st.h
object.$(OBJEXT): subst.h
object.$(OBJEXT): util.h
pack.$(OBJEXT): $(hdrdir)/ruby/ruby.h
pack.$(OBJEXT): $(top_srcdir)/include/ruby.h
pack.$(OBJEXT): config.h
pack.$(OBJEXT): defines.h
pack.$(OBJEXT): encoding.h
pack.$(OBJEXT): intern.h
pack.$(OBJEXT): internal.h
pack.$(OBJEXT): io.h
pack.$(OBJEXT): missing.h
pack.$(OBJEXT): onigmo.h
pack.$(OBJEXT): oniguruma.h
pack.$(OBJEXT): pack.c
pack.$(OBJEXT): st.h
pack.$(OBJEXT): subst.h
parse.$(OBJEXT): $(hdrdir)/ruby/ruby.h
parse.$(OBJEXT): $(top_srcdir)/include/ruby.h
parse.$(OBJEXT): config.h
parse.$(OBJEXT): defines.h
parse.$(OBJEXT): defs/keywords
parse.$(OBJEXT): encoding.h
parse.$(OBJEXT): id.h
parse.$(OBJEXT): intern.h
parse.$(OBJEXT): internal.h
parse.$(OBJEXT): io.h
parse.$(OBJEXT): lex.c
parse.$(OBJEXT): missing.h
parse.$(OBJEXT): node.h
parse.$(OBJEXT): onigmo.h
parse.$(OBJEXT): oniguruma.h
parse.$(OBJEXT): parse.c
parse.$(OBJEXT): parse.h
parse.$(OBJEXT): parse.y
parse.$(OBJEXT): probes.dmyh
parse.$(OBJEXT): probes.h
parse.$(OBJEXT): regenc.h
parse.$(OBJEXT): regex.h
parse.$(OBJEXT): st.h
parse.$(OBJEXT): subst.h
parse.$(OBJEXT): symbol.h
parse.$(OBJEXT): util.h
prelude.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
prelude.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
prelude.$(OBJEXT): $(CCAN_DIR)/list/list.h
prelude.$(OBJEXT): $(CCAN_DIR)/str/str.h
prelude.$(OBJEXT): $(hdrdir)/ruby/ruby.h
prelude.$(OBJEXT): $(top_srcdir)/include/ruby.h
prelude.$(OBJEXT): config.h
prelude.$(OBJEXT): defines.h
prelude.$(OBJEXT): encoding.h
prelude.$(OBJEXT): gem_prelude.rb
prelude.$(OBJEXT): id.h
prelude.$(OBJEXT): intern.h
prelude.$(OBJEXT): internal.h
prelude.$(OBJEXT): io.h
prelude.$(OBJEXT): iseq.h
prelude.$(OBJEXT): method.h
prelude.$(OBJEXT): missing.h
prelude.$(OBJEXT): node.h
prelude.$(OBJEXT): onigmo.h
prelude.$(OBJEXT): oniguruma.h
prelude.$(OBJEXT): prelude.c
prelude.$(OBJEXT): prelude.rb
prelude.$(OBJEXT): ruby_assert.h
prelude.$(OBJEXT): ruby_atomic.h
prelude.$(OBJEXT): st.h
prelude.$(OBJEXT): subst.h
prelude.$(OBJEXT): thread_$(THREAD_MODEL).h
prelude.$(OBJEXT): thread_native.h
prelude.$(OBJEXT): vm_core.h
prelude.$(OBJEXT): vm_debug.h
prelude.$(OBJEXT): vm_opts.h
proc.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
proc.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
proc.$(OBJEXT): $(CCAN_DIR)/list/list.h
proc.$(OBJEXT): $(CCAN_DIR)/str/str.h
proc.$(OBJEXT): $(hdrdir)/ruby/ruby.h
proc.$(OBJEXT): $(top_srcdir)/include/ruby.h
proc.$(OBJEXT): config.h
proc.$(OBJEXT): defines.h
proc.$(OBJEXT): encoding.h
proc.$(OBJEXT): eval_intern.h
proc.$(OBJEXT): gc.h
proc.$(OBJEXT): id.h
proc.$(OBJEXT): intern.h
proc.$(OBJEXT): internal.h
proc.$(OBJEXT): io.h
proc.$(OBJEXT): iseq.h
proc.$(OBJEXT): method.h
proc.$(OBJEXT): missing.h
proc.$(OBJEXT): node.h
proc.$(OBJEXT): onigmo.h
proc.$(OBJEXT): oniguruma.h
proc.$(OBJEXT): proc.c
proc.$(OBJEXT): ruby_assert.h
proc.$(OBJEXT): ruby_atomic.h
proc.$(OBJEXT): st.h
proc.$(OBJEXT): subst.h
proc.$(OBJEXT): thread_$(THREAD_MODEL).h
proc.$(OBJEXT): thread_native.h
proc.$(OBJEXT): vm_core.h
proc.$(OBJEXT): vm_debug.h
proc.$(OBJEXT): vm_opts.h
process.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
process.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
process.$(OBJEXT): $(CCAN_DIR)/list/list.h
process.$(OBJEXT): $(CCAN_DIR)/str/str.h
process.$(OBJEXT): $(hdrdir)/ruby/ruby.h
process.$(OBJEXT): $(top_srcdir)/include/ruby.h
process.$(OBJEXT): config.h
process.$(OBJEXT): defines.h
process.$(OBJEXT): dln.h
process.$(OBJEXT): encoding.h
process.$(OBJEXT): hrtime.h
process.$(OBJEXT): id.h
process.$(OBJEXT): intern.h
process.$(OBJEXT): internal.h
process.$(OBJEXT): io.h
process.$(OBJEXT): method.h
process.$(OBJEXT): missing.h
process.$(OBJEXT): node.h
process.$(OBJEXT): onigmo.h
process.$(OBJEXT): oniguruma.h
process.$(OBJEXT): process.c
process.$(OBJEXT): ruby_assert.h
process.$(OBJEXT): ruby_atomic.h
process.$(OBJEXT): st.h
process.$(OBJEXT): subst.h
process.$(OBJEXT): thread.h
process.$(OBJEXT): thread_$(THREAD_MODEL).h
process.$(OBJEXT): thread_native.h
process.$(OBJEXT): util.h
process.$(OBJEXT): vm_core.h
process.$(OBJEXT): vm_debug.h
process.$(OBJEXT): vm_opts.h
random.$(OBJEXT): $(hdrdir)/ruby/ruby.h
random.$(OBJEXT): $(top_srcdir)/include/ruby.h
random.$(OBJEXT): config.h
random.$(OBJEXT): defines.h
random.$(OBJEXT): encoding.h
random.$(OBJEXT): intern.h
random.$(OBJEXT): internal.h
random.$(OBJEXT): io.h
random.$(OBJEXT): missing.h
random.$(OBJEXT): onigmo.h
random.$(OBJEXT): oniguruma.h
random.$(OBJEXT): random.c
random.$(OBJEXT): ruby_atomic.h
random.$(OBJEXT): siphash.c
random.$(OBJEXT): siphash.h
random.$(OBJEXT): st.h
random.$(OBJEXT): subst.h
range.$(OBJEXT): $(hdrdir)/ruby/ruby.h
range.$(OBJEXT): $(top_srcdir)/include/ruby.h
range.$(OBJEXT): config.h
range.$(OBJEXT): defines.h
range.$(OBJEXT): encoding.h
range.$(OBJEXT): id.h
range.$(OBJEXT): intern.h
range.$(OBJEXT): internal.h
range.$(OBJEXT): io.h
range.$(OBJEXT): missing.h
range.$(OBJEXT): onigmo.h
range.$(OBJEXT): oniguruma.h
range.$(OBJEXT): range.c
range.$(OBJEXT): st.h
range.$(OBJEXT): subst.h
rational.$(OBJEXT): $(hdrdir)/ruby/ruby.h
rational.$(OBJEXT): $(top_srcdir)/include/ruby.h
rational.$(OBJEXT): config.h
rational.$(OBJEXT): defines.h
rational.$(OBJEXT): encoding.h
rational.$(OBJEXT): id.h
rational.$(OBJEXT): intern.h
rational.$(OBJEXT): internal.h
rational.$(OBJEXT): io.h
rational.$(OBJEXT): missing.h
rational.$(OBJEXT): onigmo.h
rational.$(OBJEXT): oniguruma.h
rational.$(OBJEXT): rational.c
rational.$(OBJEXT): ruby_assert.h
rational.$(OBJEXT): st.h
rational.$(OBJEXT): subst.h
re.$(OBJEXT): $(hdrdir)/ruby/ruby.h
re.$(OBJEXT): $(top_srcdir)/include/ruby.h
re.$(OBJEXT): config.h
re.$(OBJEXT): defines.h
re.$(OBJEXT): encindex.h
re.$(OBJEXT): encoding.h
re.$(OBJEXT): intern.h
re.$(OBJEXT): internal.h
re.$(OBJEXT): io.h
re.$(OBJEXT): missing.h
re.$(OBJEXT): onigmo.h
re.$(OBJEXT): oniguruma.h
re.$(OBJEXT): re.c
re.$(OBJEXT): re.h
re.$(OBJEXT): regenc.h
re.$(OBJEXT): regex.h
re.$(OBJEXT): regint.h
re.$(OBJEXT): st.h
re.$(OBJEXT): subst.h
re.$(OBJEXT): util.h
regcomp.$(OBJEXT): $(hdrdir)/ruby/ruby.h
regcomp.$(OBJEXT): config.h
regcomp.$(OBJEXT): defines.h
regcomp.$(OBJEXT): intern.h
regcomp.$(OBJEXT): missing.h
regcomp.$(OBJEXT): onigmo.h
regcomp.$(OBJEXT): oniguruma.h
regcomp.$(OBJEXT): regcomp.c
regcomp.$(OBJEXT): regenc.h
regcomp.$(OBJEXT): regint.h
regcomp.$(OBJEXT): regparse.h
regcomp.$(OBJEXT): st.h
regcomp.$(OBJEXT): subst.h
regenc.$(OBJEXT): $(hdrdir)/ruby/ruby.h
regenc.$(OBJEXT): config.h
regenc.$(OBJEXT): defines.h
regenc.$(OBJEXT): intern.h
regenc.$(OBJEXT): missing.h
regenc.$(OBJEXT): onigmo.h
regenc.$(OBJEXT): oniguruma.h
regenc.$(OBJEXT): regenc.c
regenc.$(OBJEXT): regenc.h
regenc.$(OBJEXT): regint.h
regenc.$(OBJEXT): st.h
regenc.$(OBJEXT): subst.h
regerror.$(OBJEXT): $(hdrdir)/ruby/ruby.h
regerror.$(OBJEXT): config.h
regerror.$(OBJEXT): defines.h
regerror.$(OBJEXT): intern.h
regerror.$(OBJEXT): missing.h
regerror.$(OBJEXT): onigmo.h
regerror.$(OBJEXT): oniguruma.h
regerror.$(OBJEXT): regenc.h
regerror.$(OBJEXT): regerror.c
regerror.$(OBJEXT): regint.h
regerror.$(OBJEXT): st.h
regerror.$(OBJEXT): subst.h
regexec.$(OBJEXT): $(hdrdir)/ruby/ruby.h
regexec.$(OBJEXT): config.h
regexec.$(OBJEXT): defines.h
regexec.$(OBJEXT): intern.h
regexec.$(OBJEXT): missing.h
regexec.$(OBJEXT): onigmo.h
regexec.$(OBJEXT): oniguruma.h
regexec.$(OBJEXT): regenc.h
regexec.$(OBJEXT): regexec.c
regexec.$(OBJEXT): regint.h
regexec.$(OBJEXT): st.h
regexec.$(OBJEXT): subst.h
regparse.$(OBJEXT): $(hdrdir)/ruby/ruby.h
regparse.$(OBJEXT): config.h
regparse.$(OBJEXT): defines.h
regparse.$(OBJEXT): intern.h
regparse.$(OBJEXT): missing.h
regparse.$(OBJEXT): onigmo.h
regparse.$(OBJEXT): oniguruma.h
regparse.$(OBJEXT): regenc.h
regparse.$(OBJEXT): regint.h
regparse.$(OBJEXT): regparse.c
regparse.$(OBJEXT): regparse.h
regparse.$(OBJEXT): st.h
regparse.$(OBJEXT): subst.h
regsyntax.$(OBJEXT): $(hdrdir)/ruby/ruby.h
regsyntax.$(OBJEXT): config.h
regsyntax.$(OBJEXT): defines.h
regsyntax.$(OBJEXT): intern.h
regsyntax.$(OBJEXT): missing.h
regsyntax.$(OBJEXT): onigmo.h
regsyntax.$(OBJEXT): oniguruma.h
regsyntax.$(OBJEXT): regenc.h
regsyntax.$(OBJEXT): regint.h
regsyntax.$(OBJEXT): regsyntax.c
regsyntax.$(OBJEXT): st.h
regsyntax.$(OBJEXT): subst.h
ruby-runner.$(OBJEXT): config.h
ruby-runner.$(OBJEXT): ruby-runner.c
ruby-runner.$(OBJEXT): ruby-runner.h
ruby.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
ruby.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
ruby.$(OBJEXT): $(CCAN_DIR)/list/list.h
ruby.$(OBJEXT): $(CCAN_DIR)/str/str.h
ruby.$(OBJEXT): $(hdrdir)/ruby/ruby.h
ruby.$(OBJEXT): $(hdrdir)/ruby/version.h
ruby.$(OBJEXT): $(top_srcdir)/include/ruby.h
ruby.$(OBJEXT): config.h
ruby.$(OBJEXT): defines.h
ruby.$(OBJEXT): dln.h
ruby.$(OBJEXT): encoding.h
ruby.$(OBJEXT): eval_intern.h
ruby.$(OBJEXT): id.h
ruby.$(OBJEXT): intern.h
ruby.$(OBJEXT): internal.h
ruby.$(OBJEXT): io.h
ruby.$(OBJEXT): method.h
ruby.$(OBJEXT): missing.h
ruby.$(OBJEXT): mjit.h
ruby.$(OBJEXT): node.h
ruby.$(OBJEXT): onigmo.h
ruby.$(OBJEXT): oniguruma.h
ruby.$(OBJEXT): ruby.c
ruby.$(OBJEXT): ruby_assert.h
ruby.$(OBJEXT): ruby_atomic.h
ruby.$(OBJEXT): st.h
ruby.$(OBJEXT): subst.h
ruby.$(OBJEXT): thread.h
ruby.$(OBJEXT): thread_$(THREAD_MODEL).h
ruby.$(OBJEXT): thread_native.h
ruby.$(OBJEXT): util.h
ruby.$(OBJEXT): vm_core.h
ruby.$(OBJEXT): vm_debug.h
ruby.$(OBJEXT): vm_opts.h
safe.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
safe.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
safe.$(OBJEXT): $(CCAN_DIR)/list/list.h
safe.$(OBJEXT): $(CCAN_DIR)/str/str.h
safe.$(OBJEXT): $(hdrdir)/ruby/ruby.h
safe.$(OBJEXT): $(top_srcdir)/include/ruby.h
safe.$(OBJEXT): config.h
safe.$(OBJEXT): defines.h
safe.$(OBJEXT): encoding.h
safe.$(OBJEXT): id.h
safe.$(OBJEXT): intern.h
safe.$(OBJEXT): internal.h
safe.$(OBJEXT): io.h
safe.$(OBJEXT): method.h
safe.$(OBJEXT): missing.h
safe.$(OBJEXT): node.h
safe.$(OBJEXT): onigmo.h
safe.$(OBJEXT): oniguruma.h
safe.$(OBJEXT): ruby_assert.h
safe.$(OBJEXT): ruby_atomic.h
safe.$(OBJEXT): safe.c
safe.$(OBJEXT): st.h
safe.$(OBJEXT): subst.h
safe.$(OBJEXT): thread_$(THREAD_MODEL).h
safe.$(OBJEXT): thread_native.h
safe.$(OBJEXT): vm_core.h
safe.$(OBJEXT): vm_debug.h
safe.$(OBJEXT): vm_opts.h
setproctitle.$(OBJEXT): $(hdrdir)/ruby/ruby.h
setproctitle.$(OBJEXT): $(top_srcdir)/include/ruby.h
setproctitle.$(OBJEXT): config.h
setproctitle.$(OBJEXT): defines.h
setproctitle.$(OBJEXT): intern.h
setproctitle.$(OBJEXT): missing.h
setproctitle.$(OBJEXT): setproctitle.c
setproctitle.$(OBJEXT): st.h
setproctitle.$(OBJEXT): subst.h
setproctitle.$(OBJEXT): util.h
signal.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
signal.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
signal.$(OBJEXT): $(CCAN_DIR)/list/list.h
signal.$(OBJEXT): $(CCAN_DIR)/str/str.h
signal.$(OBJEXT): $(hdrdir)/ruby/ruby.h
signal.$(OBJEXT): $(top_srcdir)/include/ruby.h
signal.$(OBJEXT): config.h
signal.$(OBJEXT): debug_counter.h
signal.$(OBJEXT): defines.h
signal.$(OBJEXT): encoding.h
signal.$(OBJEXT): eval_intern.h
signal.$(OBJEXT): id.h
signal.$(OBJEXT): intern.h
signal.$(OBJEXT): internal.h
signal.$(OBJEXT): io.h
signal.$(OBJEXT): method.h
signal.$(OBJEXT): missing.h
signal.$(OBJEXT): node.h
signal.$(OBJEXT): onigmo.h
signal.$(OBJEXT): oniguruma.h
signal.$(OBJEXT): ruby_assert.h
signal.$(OBJEXT): ruby_atomic.h
signal.$(OBJEXT): signal.c
signal.$(OBJEXT): st.h
signal.$(OBJEXT): subst.h
signal.$(OBJEXT): thread_$(THREAD_MODEL).h
signal.$(OBJEXT): thread_native.h
signal.$(OBJEXT): vm_core.h
signal.$(OBJEXT): vm_debug.h
signal.$(OBJEXT): vm_opts.h
sprintf.$(OBJEXT): $(hdrdir)/ruby/ruby.h
sprintf.$(OBJEXT): $(top_srcdir)/include/ruby.h
sprintf.$(OBJEXT): config.h
sprintf.$(OBJEXT): defines.h
sprintf.$(OBJEXT): encoding.h
sprintf.$(OBJEXT): id.h
sprintf.$(OBJEXT): intern.h
sprintf.$(OBJEXT): internal.h
sprintf.$(OBJEXT): io.h
sprintf.$(OBJEXT): missing.h
sprintf.$(OBJEXT): onigmo.h
sprintf.$(OBJEXT): oniguruma.h
sprintf.$(OBJEXT): re.h
sprintf.$(OBJEXT): regex.h
sprintf.$(OBJEXT): sprintf.c
sprintf.$(OBJEXT): st.h
sprintf.$(OBJEXT): subst.h
sprintf.$(OBJEXT): vsnprintf.c
st.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
st.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
st.$(OBJEXT): $(CCAN_DIR)/list/list.h
st.$(OBJEXT): $(CCAN_DIR)/str/str.h
st.$(OBJEXT): $(hdrdir)/ruby/ruby.h
st.$(OBJEXT): $(top_srcdir)/include/ruby.h
st.$(OBJEXT): config.h
st.$(OBJEXT): defines.h
st.$(OBJEXT): encoding.h
st.$(OBJEXT): intern.h
st.$(OBJEXT): internal.h
st.$(OBJEXT): io.h
st.$(OBJEXT): missing.h
st.$(OBJEXT): onigmo.h
st.$(OBJEXT): oniguruma.h
st.$(OBJEXT): st.c
st.$(OBJEXT): st.h
st.$(OBJEXT): subst.h
strftime.$(OBJEXT): $(hdrdir)/ruby/ruby.h
strftime.$(OBJEXT): $(top_srcdir)/include/ruby.h
strftime.$(OBJEXT): config.h
strftime.$(OBJEXT): defines.h
strftime.$(OBJEXT): encoding.h
strftime.$(OBJEXT): intern.h
strftime.$(OBJEXT): internal.h
strftime.$(OBJEXT): io.h
strftime.$(OBJEXT): missing.h
strftime.$(OBJEXT): onigmo.h
strftime.$(OBJEXT): oniguruma.h
strftime.$(OBJEXT): st.h
strftime.$(OBJEXT): strftime.c
strftime.$(OBJEXT): subst.h
strftime.$(OBJEXT): timev.h
string.$(OBJEXT): $(hdrdir)/ruby/ruby.h
string.$(OBJEXT): $(top_srcdir)/include/ruby.h
string.$(OBJEXT): config.h
string.$(OBJEXT): crypt.h
string.$(OBJEXT): debug_counter.h
string.$(OBJEXT): defines.h
string.$(OBJEXT): encindex.h
string.$(OBJEXT): encoding.h
string.$(OBJEXT): gc.h
string.$(OBJEXT): id.h
string.$(OBJEXT): intern.h
string.$(OBJEXT): internal.h
string.$(OBJEXT): io.h
string.$(OBJEXT): missing.h
string.$(OBJEXT): onigmo.h
string.$(OBJEXT): oniguruma.h
string.$(OBJEXT): probes.dmyh
string.$(OBJEXT): probes.h
string.$(OBJEXT): re.h
string.$(OBJEXT): regex.h
string.$(OBJEXT): ruby_assert.h
string.$(OBJEXT): st.h
string.$(OBJEXT): string.c
string.$(OBJEXT): subst.h
string.$(OBJEXT): util.h
strlcat.$(OBJEXT): config.h
strlcat.$(OBJEXT): missing.h
strlcat.$(OBJEXT): strlcat.c
strlcpy.$(OBJEXT): config.h
strlcpy.$(OBJEXT): missing.h
strlcpy.$(OBJEXT): strlcpy.c
struct.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
struct.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
struct.$(OBJEXT): $(CCAN_DIR)/list/list.h
struct.$(OBJEXT): $(CCAN_DIR)/str/str.h
struct.$(OBJEXT): $(hdrdir)/ruby/ruby.h
struct.$(OBJEXT): $(top_srcdir)/include/ruby.h
struct.$(OBJEXT): config.h
struct.$(OBJEXT): defines.h
struct.$(OBJEXT): encoding.h
struct.$(OBJEXT): id.h
struct.$(OBJEXT): intern.h
struct.$(OBJEXT): internal.h
struct.$(OBJEXT): io.h
struct.$(OBJEXT): method.h
struct.$(OBJEXT): missing.h
struct.$(OBJEXT): node.h
struct.$(OBJEXT): onigmo.h
struct.$(OBJEXT): oniguruma.h
struct.$(OBJEXT): ruby_assert.h
struct.$(OBJEXT): ruby_atomic.h
struct.$(OBJEXT): st.h
struct.$(OBJEXT): struct.c
struct.$(OBJEXT): subst.h
struct.$(OBJEXT): thread_$(THREAD_MODEL).h
struct.$(OBJEXT): thread_native.h
struct.$(OBJEXT): transient_heap.h
struct.$(OBJEXT): vm_core.h
struct.$(OBJEXT): vm_debug.h
struct.$(OBJEXT): vm_opts.h
symbol.$(OBJEXT): $(hdrdir)/ruby/ruby.h
symbol.$(OBJEXT): $(top_srcdir)/include/ruby.h
symbol.$(OBJEXT): config.h
symbol.$(OBJEXT): defines.h
symbol.$(OBJEXT): encoding.h
symbol.$(OBJEXT): gc.h
symbol.$(OBJEXT): id.c
symbol.$(OBJEXT): id.h
symbol.$(OBJEXT): id_table.c
symbol.$(OBJEXT): id_table.h
symbol.$(OBJEXT): intern.h
symbol.$(OBJEXT): internal.h
symbol.$(OBJEXT): io.h
symbol.$(OBJEXT): missing.h
symbol.$(OBJEXT): onigmo.h
symbol.$(OBJEXT): oniguruma.h
symbol.$(OBJEXT): probes.dmyh
symbol.$(OBJEXT): probes.h
symbol.$(OBJEXT): ruby_assert.h
symbol.$(OBJEXT): st.h
symbol.$(OBJEXT): subst.h
symbol.$(OBJEXT): symbol.c
symbol.$(OBJEXT): symbol.h
thread.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
thread.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
thread.$(OBJEXT): $(CCAN_DIR)/list/list.h
thread.$(OBJEXT): $(CCAN_DIR)/str/str.h
thread.$(OBJEXT): $(hdrdir)/ruby/ruby.h
thread.$(OBJEXT): $(top_srcdir)/include/ruby.h
thread.$(OBJEXT): config.h
thread.$(OBJEXT): debug.h
thread.$(OBJEXT): defines.h
thread.$(OBJEXT): encoding.h
thread.$(OBJEXT): eval_intern.h
thread.$(OBJEXT): gc.h
thread.$(OBJEXT): hrtime.h
thread.$(OBJEXT): id.h
thread.$(OBJEXT): intern.h
thread.$(OBJEXT): internal.h
thread.$(OBJEXT): io.h
thread.$(OBJEXT): iseq.h
thread.$(OBJEXT): method.h
thread.$(OBJEXT): missing.h
thread.$(OBJEXT): mjit.h
thread.$(OBJEXT): node.h
thread.$(OBJEXT): onigmo.h
thread.$(OBJEXT): oniguruma.h
thread.$(OBJEXT): ruby_assert.h
thread.$(OBJEXT): ruby_atomic.h
thread.$(OBJEXT): st.h
thread.$(OBJEXT): subst.h
thread.$(OBJEXT): thread.c
thread.$(OBJEXT): thread.h
thread.$(OBJEXT): thread_$(THREAD_MODEL).c
thread.$(OBJEXT): thread_$(THREAD_MODEL).h
thread.$(OBJEXT): thread_native.h
thread.$(OBJEXT): thread_sync.c
thread.$(OBJEXT): timev.h
thread.$(OBJEXT): vm_core.h
thread.$(OBJEXT): vm_debug.h
thread.$(OBJEXT): vm_opts.h
time.$(OBJEXT): $(hdrdir)/ruby/ruby.h
time.$(OBJEXT): $(top_srcdir)/include/ruby.h
time.$(OBJEXT): config.h
time.$(OBJEXT): defines.h
time.$(OBJEXT): encoding.h
time.$(OBJEXT): id.h
time.$(OBJEXT): intern.h
time.$(OBJEXT): internal.h
time.$(OBJEXT): io.h
time.$(OBJEXT): missing.h
time.$(OBJEXT): onigmo.h
time.$(OBJEXT): oniguruma.h
time.$(OBJEXT): st.h
time.$(OBJEXT): subst.h
time.$(OBJEXT): time.c
time.$(OBJEXT): timev.h
transcode.$(OBJEXT): $(hdrdir)/ruby/ruby.h
transcode.$(OBJEXT): $(top_srcdir)/include/ruby.h
transcode.$(OBJEXT): config.h
transcode.$(OBJEXT): defines.h
transcode.$(OBJEXT): encoding.h
transcode.$(OBJEXT): intern.h
transcode.$(OBJEXT): internal.h
transcode.$(OBJEXT): io.h
transcode.$(OBJEXT): missing.h
transcode.$(OBJEXT): onigmo.h
transcode.$(OBJEXT): oniguruma.h
transcode.$(OBJEXT): st.h
transcode.$(OBJEXT): subst.h
transcode.$(OBJEXT): transcode.c
transcode.$(OBJEXT): transcode_data.h
transient_heap.$(OBJEXT): $(hdrdir)/ruby/ruby.h
transient_heap.$(OBJEXT): $(top_srcdir)/include/ruby.h
transient_heap.$(OBJEXT): config.h
transient_heap.$(OBJEXT): debug.h
transient_heap.$(OBJEXT): debug_counter.h
transient_heap.$(OBJEXT): defines.h
transient_heap.$(OBJEXT): gc.h
transient_heap.$(OBJEXT): intern.h
transient_heap.$(OBJEXT): internal.h
transient_heap.$(OBJEXT): missing.h
transient_heap.$(OBJEXT): node.h
transient_heap.$(OBJEXT): ruby_assert.h
transient_heap.$(OBJEXT): st.h
transient_heap.$(OBJEXT): subst.h
transient_heap.$(OBJEXT): transient_heap.c
transient_heap.$(OBJEXT): transient_heap.h
transient_heap.$(OBJEXT): vm_debug.h
util.$(OBJEXT): $(hdrdir)/ruby/ruby.h
util.$(OBJEXT): $(top_srcdir)/include/ruby.h
util.$(OBJEXT): config.h
util.$(OBJEXT): defines.h
util.$(OBJEXT): encoding.h
util.$(OBJEXT): intern.h
util.$(OBJEXT): internal.h
util.$(OBJEXT): io.h
util.$(OBJEXT): missing.h
util.$(OBJEXT): onigmo.h
util.$(OBJEXT): oniguruma.h
util.$(OBJEXT): st.h
util.$(OBJEXT): subst.h
util.$(OBJEXT): util.c
util.$(OBJEXT): util.h
variable.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
variable.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
variable.$(OBJEXT): $(CCAN_DIR)/list/list.h
variable.$(OBJEXT): $(CCAN_DIR)/str/str.h
variable.$(OBJEXT): $(hdrdir)/ruby/ruby.h
variable.$(OBJEXT): $(top_srcdir)/include/ruby.h
variable.$(OBJEXT): config.h
variable.$(OBJEXT): constant.h
variable.$(OBJEXT): debug_counter.h
variable.$(OBJEXT): defines.h
variable.$(OBJEXT): encoding.h
variable.$(OBJEXT): id.h
variable.$(OBJEXT): id_table.h
variable.$(OBJEXT): intern.h
variable.$(OBJEXT): internal.h
variable.$(OBJEXT): io.h
variable.$(OBJEXT): method.h
variable.$(OBJEXT): missing.h
variable.$(OBJEXT): node.h
variable.$(OBJEXT): onigmo.h
variable.$(OBJEXT): oniguruma.h
variable.$(OBJEXT): ruby_assert.h
variable.$(OBJEXT): ruby_atomic.h
variable.$(OBJEXT): st.h
variable.$(OBJEXT): subst.h
variable.$(OBJEXT): thread_$(THREAD_MODEL).h
variable.$(OBJEXT): thread_native.h
variable.$(OBJEXT): transient_heap.h
variable.$(OBJEXT): util.h
variable.$(OBJEXT): variable.c
variable.$(OBJEXT): vm_core.h
variable.$(OBJEXT): vm_opts.h
version.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
version.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
version.$(OBJEXT): $(CCAN_DIR)/list/list.h
version.$(OBJEXT): $(CCAN_DIR)/str/str.h
version.$(OBJEXT): $(hdrdir)/ruby/ruby.h
version.$(OBJEXT): $(hdrdir)/ruby/version.h
version.$(OBJEXT): $(top_srcdir)/include/ruby.h
version.$(OBJEXT): $(top_srcdir)/revision.h
version.$(OBJEXT): $(top_srcdir)/version.h
version.$(OBJEXT): config.h
version.$(OBJEXT): defines.h
version.$(OBJEXT): id.h
version.$(OBJEXT): intern.h
version.$(OBJEXT): internal.h
version.$(OBJEXT): method.h
version.$(OBJEXT): missing.h
version.$(OBJEXT): mjit.h
version.$(OBJEXT): node.h
version.$(OBJEXT): ruby_assert.h
version.$(OBJEXT): ruby_atomic.h
version.$(OBJEXT): st.h
version.$(OBJEXT): subst.h
version.$(OBJEXT): thread_$(THREAD_MODEL).h
version.$(OBJEXT): thread_native.h
version.$(OBJEXT): version.c
version.$(OBJEXT): vm_core.h
version.$(OBJEXT): vm_opts.h
vm.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
vm.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
vm.$(OBJEXT): $(CCAN_DIR)/list/list.h
vm.$(OBJEXT): $(CCAN_DIR)/str/str.h
vm.$(OBJEXT): $(hdrdir)/ruby/ruby.h
vm.$(OBJEXT): $(top_srcdir)/include/ruby.h
vm.$(OBJEXT): config.h
vm.$(OBJEXT): constant.h
vm.$(OBJEXT): debug_counter.h
vm.$(OBJEXT): defines.h
vm.$(OBJEXT): defs/opt_operand.def
vm.$(OBJEXT): encoding.h
vm.$(OBJEXT): eval_intern.h
vm.$(OBJEXT): gc.h
vm.$(OBJEXT): id.h
vm.$(OBJEXT): id_table.h
vm.$(OBJEXT): insns.def
vm.$(OBJEXT): insns.inc
vm.$(OBJEXT): insns_info.inc
vm.$(OBJEXT): intern.h
vm.$(OBJEXT): internal.h
vm.$(OBJEXT): io.h
vm.$(OBJEXT): iseq.h
vm.$(OBJEXT): method.h
vm.$(OBJEXT): missing.h
vm.$(OBJEXT): mjit.h
vm.$(OBJEXT): node.h
vm.$(OBJEXT): onigmo.h
vm.$(OBJEXT): oniguruma.h
vm.$(OBJEXT): probes.dmyh
vm.$(OBJEXT): probes.h
vm.$(OBJEXT): probes_helper.h
vm.$(OBJEXT): ruby_assert.h
vm.$(OBJEXT): ruby_atomic.h
vm.$(OBJEXT): st.h
vm.$(OBJEXT): subst.h
vm.$(OBJEXT): thread_$(THREAD_MODEL).h
vm.$(OBJEXT): thread_native.h
vm.$(OBJEXT): vm.c
vm.$(OBJEXT): vm.h
vm.$(OBJEXT): vm.inc
vm.$(OBJEXT): vm_args.c
vm.$(OBJEXT): vm_call_iseq_optimized.inc
vm.$(OBJEXT): vm_core.h
vm.$(OBJEXT): vm_debug.h
vm.$(OBJEXT): vm_eval.c
vm.$(OBJEXT): vm_exec.c
vm.$(OBJEXT): vm_exec.h
vm.$(OBJEXT): vm_insnhelper.c
vm.$(OBJEXT): vm_insnhelper.h
vm.$(OBJEXT): vm_method.c
vm.$(OBJEXT): vm_opts.h
vm.$(OBJEXT): vmtc.inc
vm_backtrace.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
vm_backtrace.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
vm_backtrace.$(OBJEXT): $(CCAN_DIR)/list/list.h
vm_backtrace.$(OBJEXT): $(CCAN_DIR)/str/str.h
vm_backtrace.$(OBJEXT): $(hdrdir)/ruby/ruby.h
vm_backtrace.$(OBJEXT): $(top_srcdir)/include/ruby.h
vm_backtrace.$(OBJEXT): config.h
vm_backtrace.$(OBJEXT): debug.h
vm_backtrace.$(OBJEXT): defines.h
vm_backtrace.$(OBJEXT): encoding.h
vm_backtrace.$(OBJEXT): eval_intern.h
vm_backtrace.$(OBJEXT): id.h
vm_backtrace.$(OBJEXT): intern.h
vm_backtrace.$(OBJEXT): internal.h
vm_backtrace.$(OBJEXT): io.h
vm_backtrace.$(OBJEXT): iseq.h
vm_backtrace.$(OBJEXT): method.h
vm_backtrace.$(OBJEXT): missing.h
vm_backtrace.$(OBJEXT): node.h
vm_backtrace.$(OBJEXT): onigmo.h
vm_backtrace.$(OBJEXT): oniguruma.h
vm_backtrace.$(OBJEXT): ruby_assert.h
vm_backtrace.$(OBJEXT): ruby_atomic.h
vm_backtrace.$(OBJEXT): st.h
vm_backtrace.$(OBJEXT): subst.h
vm_backtrace.$(OBJEXT): thread_$(THREAD_MODEL).h
vm_backtrace.$(OBJEXT): thread_native.h
vm_backtrace.$(OBJEXT): vm_backtrace.c
vm_backtrace.$(OBJEXT): vm_core.h
vm_backtrace.$(OBJEXT): vm_debug.h
vm_backtrace.$(OBJEXT): vm_opts.h
vm_dump.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
vm_dump.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
vm_dump.$(OBJEXT): $(CCAN_DIR)/list/list.h
vm_dump.$(OBJEXT): $(CCAN_DIR)/str/str.h
vm_dump.$(OBJEXT): $(hdrdir)/ruby/ruby.h
vm_dump.$(OBJEXT): $(top_srcdir)/include/ruby.h
vm_dump.$(OBJEXT): addr2line.h
vm_dump.$(OBJEXT): config.h
vm_dump.$(OBJEXT): defines.h
vm_dump.$(OBJEXT): encoding.h
vm_dump.$(OBJEXT): id.h
vm_dump.$(OBJEXT): intern.h
vm_dump.$(OBJEXT): internal.h
vm_dump.$(OBJEXT): io.h
vm_dump.$(OBJEXT): iseq.h
vm_dump.$(OBJEXT): method.h
vm_dump.$(OBJEXT): missing.h
vm_dump.$(OBJEXT): node.h
vm_dump.$(OBJEXT): onigmo.h
vm_dump.$(OBJEXT): oniguruma.h
vm_dump.$(OBJEXT): ruby_assert.h
vm_dump.$(OBJEXT): ruby_atomic.h
vm_dump.$(OBJEXT): st.h
vm_dump.$(OBJEXT): subst.h
vm_dump.$(OBJEXT): thread_$(THREAD_MODEL).h
vm_dump.$(OBJEXT): thread_native.h
vm_dump.$(OBJEXT): vm_core.h
vm_dump.$(OBJEXT): vm_debug.h
vm_dump.$(OBJEXT): vm_dump.c
vm_dump.$(OBJEXT): vm_opts.h
vm_trace.$(OBJEXT): $(CCAN_DIR)/check_type/check_type.h
vm_trace.$(OBJEXT): $(CCAN_DIR)/container_of/container_of.h
vm_trace.$(OBJEXT): $(CCAN_DIR)/list/list.h
vm_trace.$(OBJEXT): $(CCAN_DIR)/str/str.h
vm_trace.$(OBJEXT): $(hdrdir)/ruby/ruby.h
vm_trace.$(OBJEXT): $(top_srcdir)/include/ruby.h
vm_trace.$(OBJEXT): config.h
vm_trace.$(OBJEXT): debug.h
vm_trace.$(OBJEXT): defines.h
vm_trace.$(OBJEXT): encoding.h
vm_trace.$(OBJEXT): eval_intern.h
vm_trace.$(OBJEXT): id.h
vm_trace.$(OBJEXT): intern.h
vm_trace.$(OBJEXT): internal.h
vm_trace.$(OBJEXT): io.h
vm_trace.$(OBJEXT): iseq.h
vm_trace.$(OBJEXT): method.h
vm_trace.$(OBJEXT): missing.h
vm_trace.$(OBJEXT): mjit.h
vm_trace.$(OBJEXT): node.h
vm_trace.$(OBJEXT): onigmo.h
vm_trace.$(OBJEXT): oniguruma.h
vm_trace.$(OBJEXT): ruby_assert.h
vm_trace.$(OBJEXT): ruby_atomic.h
vm_trace.$(OBJEXT): st.h
vm_trace.$(OBJEXT): subst.h
vm_trace.$(OBJEXT): thread_$(THREAD_MODEL).h
vm_trace.$(OBJEXT): thread_native.h
vm_trace.$(OBJEXT): vm_core.h
vm_trace.$(OBJEXT): vm_debug.h
vm_trace.$(OBJEXT): vm_opts.h
vm_trace.$(OBJEXT): vm_trace.c
# AUTOGENERATED DEPENDENCIES END
