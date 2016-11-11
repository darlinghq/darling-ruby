V = 0
Q1 = $(V:1=)
Q = $(Q1:0=@)
ECHO1 = $(V:1=@:)
ECHO = $(ECHO1:0=@echo)

extensions = ext/-test-/array/resize/. ext/-test-/bug-3571/. \
	     ext/-test-/bug-3662/. ext/-test-/bug-5832/. \
	     ext/-test-/debug/. ext/-test-/exception/. \
	     ext/-test-/fatal/. ext/-test-/funcall/. ext/-test-/iter/. \
	     ext/-test-/load/dot.dot/. ext/-test-/marshal/compat/. \
	     ext/-test-/marshal/usr/. ext/-test-/method/. \
	     ext/-test-/num2int/. ext/-test-/old_thread_select/. \
	     ext/-test-/path_to_class/. ext/-test-/printf/. \
	     ext/-test-/st/numhash/. ext/-test-/st/update/. \
	     ext/-test-/string/. ext/-test-/struct/. \
	     ext/-test-/symbol/. ext/-test-/typeddata/. \
	     ext/-test-/wait_for_single_fd/. ext/-test-/win32/dln/. \
	     ext/-test-/win32/fd_setsize/. ext/bigdecimal/. \
	     ext/continuation/. ext/coverage/. ext/curses/. ext/date/. \
	     ext/dbm/. ext/digest/. ext/digest/bubblebabble/. \
	     ext/digest/md5/. ext/digest/rmd160/. ext/digest/sha1/. \
	     ext/digest/sha2/. ext/dl/. ext/dl/callback/. \
	     ext/dl/win32/. ext/etc/. ext/fcntl/. ext/fiber/. \
	     ext/fiddle/. ext/fiddle/win32/. ext/gdbm/. \
	     ext/io/console/. ext/io/nonblock/. ext/io/wait/. \
	     ext/json/. ext/json/generator/. ext/json/parser/. \
	     ext/mathn/complex/. ext/mathn/rational/. ext/nkf/. \
	     ext/objspace/. ext/openssl/. ext/pathname/. ext/psych/. \
	     ext/pty/. ext/racc/cparse/. ext/readline/. ext/ripper/. \
	     ext/sdbm/. ext/socket/. ext/stringio/. ext/strscan/. \
	     ext/syslog/. ext/tk/. ext/tk/tkutil/. ext/win32ole/. \
	     ext/zlib/.
EXTOBJS = dmyext.o
EXTLIBS =
EXTLDFLAGS =

all: $(extensions:/.=/all)
install: $(extensions:/.=/install)
static: $(extensions:/.=/static)
install-so: $(extensions:/.=/install-so)
install-rb: $(extensions:/.=/install-rb)
clean: $(extensions:/.=/clean)
distclean: $(extensions:/.=/distclean)
realclean: $(extensions:/.=/realclean)

clean:
	-$(Q)$(RM) ext/extinit.o
distclean:
	-$(Q)$(RM) ext/extinit.c

ruby: $(extensions:/.=/all)
all static:
	$(Q)$(MAKE) $(MFLAGS) EXTOBJS="$(EXTOBJS) $(ENCOBJS)" EXTLIBS="$(EXTLIBS)" EXTLDFLAGS="$(EXTLDFLAGS)" ruby
ruby:
	$(Q)$(MAKE) $(MFLAGS) EXTOBJS="$(EXTOBJS) $(ENCOBJS)" EXTLIBS="$(EXTLIBS)" EXTLDFLAGS="$(EXTLDFLAGS)" $@

ext/-test-/array/resize/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3571/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3662/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-5832/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/debug/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/exception/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/fatal/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/funcall/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/iter/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/load/dot.dot/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/compat/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/usr/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/method/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/num2int/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/old_thread_select/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/path_to_class/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/printf/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/numhash/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/update/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/string/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/struct/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/symbol/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/typeddata/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/wait_for_single_fd/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/dln/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/fd_setsize/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/bigdecimal/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/continuation/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/coverage/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/curses/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/date/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dbm/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/callback/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/win32/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/etc/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fcntl/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiber/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/win32/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/gdbm/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/console/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/generator/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/parser/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/complex/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/rational/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/nkf/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/objspace/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/openssl/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pathname/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/psych/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pty/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/racc/cparse/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/readline/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/ripper/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/sdbm/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/socket/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/stringio/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/strscan/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/syslog/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/tkutil/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/win32ole/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/zlib/all:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/array/resize/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3571/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3662/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-5832/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/debug/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/exception/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/fatal/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/funcall/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/iter/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/load/dot.dot/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/compat/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/usr/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/method/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/num2int/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/old_thread_select/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/path_to_class/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/printf/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/numhash/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/update/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/string/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/struct/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/symbol/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/typeddata/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/wait_for_single_fd/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/dln/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/fd_setsize/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/bigdecimal/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/continuation/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/coverage/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/curses/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/date/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dbm/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/callback/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/win32/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/etc/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fcntl/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiber/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/win32/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/gdbm/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/console/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/generator/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/parser/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/complex/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/rational/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/nkf/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/objspace/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/openssl/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pathname/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/psych/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pty/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/racc/cparse/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/readline/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/ripper/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/sdbm/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/socket/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/stringio/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/strscan/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/syslog/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/tkutil/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/win32ole/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/zlib/install:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/array/resize/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3571/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3662/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-5832/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/debug/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/exception/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/fatal/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/funcall/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/iter/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/load/dot.dot/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/compat/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/usr/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/method/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/num2int/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/old_thread_select/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/path_to_class/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/printf/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/numhash/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/update/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/string/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/struct/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/symbol/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/typeddata/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/wait_for_single_fd/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/dln/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/fd_setsize/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/bigdecimal/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/continuation/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/coverage/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/curses/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/date/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dbm/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/callback/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/win32/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/etc/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fcntl/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiber/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/win32/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/gdbm/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/console/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/generator/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/parser/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/complex/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/rational/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/nkf/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/objspace/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/openssl/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pathname/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/psych/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pty/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/racc/cparse/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/readline/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/ripper/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/sdbm/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/socket/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/stringio/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/strscan/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/syslog/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/tkutil/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/win32ole/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/zlib/static:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/array/resize/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3571/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3662/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-5832/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/debug/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/exception/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/fatal/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/funcall/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/iter/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/load/dot.dot/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/compat/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/usr/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/method/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/num2int/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/old_thread_select/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/path_to_class/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/printf/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/numhash/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/update/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/string/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/struct/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/symbol/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/typeddata/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/wait_for_single_fd/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/dln/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/fd_setsize/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/bigdecimal/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/continuation/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/coverage/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/curses/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/date/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dbm/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/callback/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/win32/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/etc/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fcntl/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiber/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/win32/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/gdbm/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/console/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/generator/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/parser/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/complex/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/rational/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/nkf/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/objspace/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/openssl/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pathname/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/psych/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pty/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/racc/cparse/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/readline/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/ripper/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/sdbm/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/socket/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/stringio/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/strscan/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/syslog/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/tkutil/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/win32ole/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/zlib/install-so:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/array/resize/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3571/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3662/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-5832/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/debug/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/exception/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/fatal/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/funcall/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/iter/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/load/dot.dot/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/compat/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/usr/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/method/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/num2int/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/old_thread_select/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/path_to_class/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/printf/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/numhash/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/update/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/string/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/struct/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/symbol/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/typeddata/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/wait_for_single_fd/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/dln/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/fd_setsize/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/bigdecimal/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/continuation/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/coverage/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/curses/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/date/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dbm/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/callback/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/win32/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/etc/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fcntl/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiber/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/win32/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/gdbm/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/console/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/generator/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/parser/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/complex/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/rational/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/nkf/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/objspace/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/openssl/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pathname/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/psych/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pty/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/racc/cparse/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/readline/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/ripper/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/sdbm/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/socket/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/stringio/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/strscan/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/syslog/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/tkutil/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/win32ole/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/zlib/install-rb:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/array/resize/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3571/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3662/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-5832/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/debug/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/exception/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/fatal/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/funcall/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/iter/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/load/dot.dot/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/compat/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/usr/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/method/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/num2int/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/old_thread_select/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/path_to_class/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/printf/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/numhash/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/update/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/string/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/struct/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/symbol/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/typeddata/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/wait_for_single_fd/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/dln/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/fd_setsize/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/bigdecimal/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/continuation/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/coverage/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/curses/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/date/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dbm/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/callback/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/win32/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/etc/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fcntl/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiber/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/win32/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/gdbm/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/console/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/generator/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/parser/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/complex/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/rational/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/nkf/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/objspace/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/openssl/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pathname/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/psych/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pty/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/racc/cparse/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/readline/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/ripper/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/sdbm/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/socket/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/stringio/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/strscan/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/syslog/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/tkutil/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/win32ole/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/zlib/clean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/array/resize/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3571/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3662/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-5832/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/debug/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/exception/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/fatal/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/funcall/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/iter/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/load/dot.dot/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/compat/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/usr/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/method/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/num2int/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/old_thread_select/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/path_to_class/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/printf/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/numhash/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/update/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/string/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/struct/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/symbol/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/typeddata/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/wait_for_single_fd/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/dln/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/fd_setsize/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/bigdecimal/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/continuation/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/coverage/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/curses/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/date/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dbm/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/callback/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/win32/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/etc/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fcntl/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiber/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/win32/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/gdbm/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/console/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/generator/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/parser/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/complex/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/rational/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/nkf/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/objspace/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/openssl/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pathname/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/psych/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pty/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/racc/cparse/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/readline/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/ripper/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/sdbm/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/socket/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/stringio/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/strscan/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/syslog/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/tkutil/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/win32ole/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/zlib/distclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/array/resize/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3571/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-3662/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/bug-5832/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/debug/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/exception/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/fatal/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/funcall/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/iter/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/load/dot.dot/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/compat/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/marshal/usr/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/method/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/num2int/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/old_thread_select/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/path_to_class/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/printf/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/numhash/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/st/update/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/string/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/struct/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/symbol/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/typeddata/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/wait_for_single_fd/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/dln/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/-test-/win32/fd_setsize/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/bigdecimal/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/continuation/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/coverage/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/curses/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/date/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dbm/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/bubblebabble/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/md5/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/rmd160/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha1/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/digest/sha2/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/callback/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/dl/win32/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/etc/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fcntl/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiber/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/fiddle/win32/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/gdbm/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/console/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/nonblock/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/io/wait/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/generator/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/json/parser/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/complex/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/mathn/rational/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/nkf/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/objspace/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/openssl/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pathname/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/psych/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/pty/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/racc/cparse/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/readline/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/ripper/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/sdbm/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/socket/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/stringio/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/strscan/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/syslog/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/tk/tkutil/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/win32ole/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
ext/zlib/realclean:
	$(Q)cd $(@D) && exec $(MAKE) $(MFLAGS) V=$(V) $(@F)
