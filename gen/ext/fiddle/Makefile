
SHELL = /bin/sh

# V=0 quiet, V=1 verbose.  other values don't work.
V = 0
Q1 = $(V:1=)
Q = $(Q1:0=@)
ECHO1 = $(V:1=@ :)
ECHO = $(ECHO1:0=@ echo)
NULLCMD = :

#### Start of system configuration section. ####
top_srcdir = $(topdir)/../ruby
srcdir = $(top_srcdir)/ext/fiddle
topdir = ../..
hdrdir = $(top_srcdir)/include
arch_hdrdir = $(extout)/include/$(arch)
PATH_SEPARATOR = :
VPATH = $(srcdir):$(arch_hdrdir)/ruby:$(hdrdir)/ruby
RUBYLIB =
RUBYOPT = -
prefix = $(DESTDIR)/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr
rubysitearchprefix = $(rubylibprefix)/$(sitearch)
rubyarchprefix = $(rubylibprefix)/$(arch)
rubylibprefix = $(libdir)/$(RUBY_BASE_NAME)
exec_prefix = $(prefix)
vendorarchhdrdir = $(vendorhdrdir)/$(sitearch)
sitearchhdrdir = $(sitehdrdir)/$(sitearch)
rubyarchhdrdir = $(rubyhdrdir)/$(arch)
vendorhdrdir = $(rubyhdrdir)/vendor_ruby
sitehdrdir = $(rubyhdrdir)/site_ruby
rubyhdrdir = $(includedir)/$(RUBY_VERSION_NAME)
vendorarchdir = $(vendorlibdir)/$(sitearch)
vendorlibdir = $(vendordir)/$(ruby_version)
vendordir = $(rubylibprefix)/vendor_ruby
sitearchdir = $(sitelibdir)/$(sitearch)
sitelibdir = $(sitedir)/$(ruby_version)
sitedir = $(DESTDIR)/Library/Ruby/Site
rubyarchdir = $(rubylibdir)/$(arch)
rubylibdir = $(rubylibprefix)/$(ruby_version)
sitearchincludedir = $(includedir)/$(sitearch)
archincludedir = $(includedir)/$(arch)
sitearchlibdir = $(libdir)/$(sitearch)
archlibdir = $(libdir)/$(arch)
ridir = $(datarootdir)/$(RI_BASE_NAME)
mandir = $(datarootdir)/man
localedir = $(datarootdir)/locale
libdir = $(exec_prefix)/lib
psdir = $(docdir)
pdfdir = $(docdir)
dvidir = $(docdir)
htmldir = $(docdir)
infodir = $(datarootdir)/info
docdir = $(datarootdir)/doc/$(PACKAGE)
oldincludedir = $(DESTDIR)/usr/include
includedir = $(DESTDIR)/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk$(prefix)/include
localstatedir = $(prefix)/var
sharedstatedir = $(prefix)/com
sysconfdir = $(DESTDIR)/Library/Ruby/Site
datadir = $(datarootdir)
datarootdir = $(prefix)/share
libexecdir = $(exec_prefix)/libexec
sbindir = $(exec_prefix)/sbin
bindir = $(exec_prefix)/bin
archdir = $(rubyarchdir)


CC_WRAPPER = 
CC = /Users/ariel/private-bin/clang
CXX = /Users/ariel/private-bin/clang++
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static -framework Security -framework Foundation $(MAINLIBS)
empty =
OUTFLAG = -o $(empty)
COUTFLAG = -o $(empty)
CSRCFLAG = $(empty)

RUBY_EXTCONF_H = extconf.h
cflags   = $(optflags) $(debugflags) $(warnflags)
cxxflags = $(optflags) $(debugflags) $(warnflags)
optflags = 
debugflags = -g
warnflags = 
cppflags = 
CCDLFLAGS = 
CFLAGS   = $(CCDLFLAGS) -Wno-nullability-completeness -O0 -glldb -pipe  $(ARCH_FLAG)
INCFLAGS = -I. -I$(arch_hdrdir) -I$(hdrdir) -I$(srcdir) -I/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include/ffi -I$(top_srcdir)
DEFS     = 
CPPFLAGS = -DRUBY_EXTCONF_H=\"$(RUBY_EXTCONF_H)\" -isystem/Users/ariel/git/darling/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include -isystem/Users/ariel/arch/build/darling/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include -isystem/Users/ariel/git/darling/framework-include -DHAVE_GCC_ATOMIC_BUILTINS -DDARLING -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE -D_DARWIN_UNLIMITED_SELECT -D_REENTRANT $(DEFS) $(cppflags)
CXXFLAGS = $(CCDLFLAGS) $(cxxflags)  $(ARCH_FLAG)
ldflags  = -L. -L/usr/local/lib 
dldflags = -undefined dynamic_lookup -multiply_defined suppress 
ARCH_FLAG =  -arch x86_64 -arch i386
DLDFLAGS = $(ldflags) $(dldflags) $(ARCH_FLAG)
LDSHARED = $(CC) -dynamic -bundle
LDSHAREDXX = $(CXX) -dynamic -bundle
AR = libtool -static
EXEEXT = 

RUBY_INSTALL_NAME = $(RUBY_BASE_NAME)
RUBY_SO_NAME = ruby.2.6
RUBYW_INSTALL_NAME = 
RUBY_VERSION_NAME = $(RUBY_BASE_NAME)-$(ruby_version)
RUBYW_BASE_NAME = rubyw
RUBY_BASE_NAME = ruby

arch = universal-darwin19
sitearch = $(arch)
ruby_version = 2.6.0
ruby = $(topdir)/miniruby -I'$(topdir)' -I'$(top_srcdir)/lib' -I'$(extout)/$(arch)' -I'$(extout)/common'
RUBY = $(ruby)
ruby_headers = $(hdrdir)/ruby.h $(hdrdir)/ruby/backward.h $(hdrdir)/ruby/ruby.h $(hdrdir)/ruby/defines.h $(hdrdir)/ruby/missing.h $(hdrdir)/ruby/intern.h $(hdrdir)/ruby/st.h $(hdrdir)/ruby/subst.h $(arch_hdrdir)/ruby/config.h $(RUBY_EXTCONF_H)

RM = rm -f
RM_RF = $(RUBY) -run -e rm -- -rf
RMDIRS = rmdir -p
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp
TOUCH = exit >

#### End of system configuration section. ####

preload = 
EXTSO = 
libpath = . $(topdir)
LIBPATH =  -L. -L$(topdir)
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 
DISTCLEANDIRS = 

extout = $(topdir)/.ext
extout_prefix = $(extout)$(target_prefix)/
target_prefix = 
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED) -ldl -lffi  -lffi  
ORIG_SRCS = closure.c conversions.c fiddle.c function.c handle.c pointer.c
SRCS = $(ORIG_SRCS) 
OBJS = closure.o conversions.o fiddle.o function.o handle.o pointer.o
HDRS = $(srcdir)/fiddle.h $(srcdir)/conversions.h $(srcdir)/closure.h $(srcdir)/function.h
LOCAL_HDRS = 
TARGET = fiddle
TARGET_NAME = fiddle
TARGET_ENTRY = Init_$(TARGET_NAME)
DLLIB = $(TARGET).bundle
EXTSTATIC = 
STATIC_LIB = 

TIMESTAMP_DIR = $(extout)/.timestamp
BINDIR        = $(extout)/bin
RUBYCOMMONDIR = $(extout)/common
RUBYLIBDIR    = $(RUBYCOMMONDIR)$(target_prefix)
RUBYARCHDIR   = $(extout)/$(arch)$(target_prefix)
HDRDIR        = $(extout)/include/ruby$(target_prefix)
ARCHHDRDIR    = $(extout)/include/$(arch)/ruby$(target_prefix)
TARGET_SO_DIR = $(RUBYARCHDIR)/
TARGET_SO     = $(TARGET_SO_DIR)$(DLLIB)
CLEANLIBS     = $(TARGET_SO) 
CLEANOBJS     = *.o  *.bak
LIBFFI_CLEAN = none

all:    install
static: all
.PHONY: all install static install-so install-rb
.PHONY: clean clean-so clean-static clean-rb

clean-static::
clean-rb-default::
clean-rb::
clean-so::
clean: clean-so clean-static clean-rb-default clean-rb
		-$(Q)$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES) .*.time

distclean-rb-default::
distclean-rb::
distclean-so::
distclean-static::
distclean: clean distclean-so distclean-static distclean-rb-default distclean-rb
		-$(Q)$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		-$(Q)$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)
		-$(Q)$(RMDIRS) $(DISTCLEANDIRS) 2> /dev/null || true

realclean: distclean
install: install-so install-rb

install-so: $(TARGET_SO)
clean-so::
	-$(Q)$(RM) $(TARGET_SO) $(TIMESTAMP_DIR)/$(arch)/.time
	-$(Q)$(RMDIRS) $(TARGET_SO_DIR) 2> /dev/null || true
clean-static::
	-$(Q)$(RM) $(STATIC_LIB)
install-rb: pre-install-rb do-install-rb install-rb-default
install-rb-default: pre-install-rb-default do-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
do-install-rb:
do-install-rb-default:
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time
do-install-rb-default: $(RUBYLIBDIR)/fiddle/struct.rb
$(RUBYLIBDIR)/fiddle/struct.rb: $(srcdir)/lib/fiddle/struct.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time
	$(Q) $(COPY) $(srcdir)/lib/fiddle/struct.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/fiddle/struct.rb
do-install-rb-default: $(RUBYLIBDIR)/fiddle/closure.rb
$(RUBYLIBDIR)/fiddle/closure.rb: $(srcdir)/lib/fiddle/closure.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time
	$(Q) $(COPY) $(srcdir)/lib/fiddle/closure.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/fiddle/closure.rb
do-install-rb-default: $(RUBYLIBDIR)/fiddle/function.rb
$(RUBYLIBDIR)/fiddle/function.rb: $(srcdir)/lib/fiddle/function.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time
	$(Q) $(COPY) $(srcdir)/lib/fiddle/function.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/fiddle/function.rb
do-install-rb-default: $(RUBYLIBDIR)/fiddle/value.rb
$(RUBYLIBDIR)/fiddle/value.rb: $(srcdir)/lib/fiddle/value.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time
	$(Q) $(COPY) $(srcdir)/lib/fiddle/value.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/fiddle/value.rb
do-install-rb-default: $(RUBYLIBDIR)/fiddle/cparser.rb
$(RUBYLIBDIR)/fiddle/cparser.rb: $(srcdir)/lib/fiddle/cparser.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time
	$(Q) $(COPY) $(srcdir)/lib/fiddle/cparser.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/fiddle/cparser.rb
do-install-rb-default: $(RUBYLIBDIR)/fiddle/types.rb
$(RUBYLIBDIR)/fiddle/types.rb: $(srcdir)/lib/fiddle/types.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time
	$(Q) $(COPY) $(srcdir)/lib/fiddle/types.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/fiddle/types.rb
do-install-rb-default: $(RUBYLIBDIR)/fiddle/import.rb
$(RUBYLIBDIR)/fiddle/import.rb: $(srcdir)/lib/fiddle/import.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time
	$(Q) $(COPY) $(srcdir)/lib/fiddle/import.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/fiddle/import.rb
do-install-rb-default: $(RUBYLIBDIR)/fiddle/pack.rb
$(RUBYLIBDIR)/fiddle/pack.rb: $(srcdir)/lib/fiddle/pack.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time
	$(Q) $(COPY) $(srcdir)/lib/fiddle/pack.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/fiddle/pack.rb
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
do-install-rb-default: $(RUBYLIBDIR)/fiddle.rb
$(RUBYLIBDIR)/fiddle.rb: $(srcdir)/lib/fiddle.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
	$(Q) $(COPY) $(srcdir)/lib/fiddle.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/fiddle.rb
pre-install-rb-default:
	$(Q1:0=@$(MAKE) -q do-install-rb-default || )$(ECHO1:0=echo) installing default fiddle libraries
clean-rb-default::
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR)/fiddle 2> /dev/null || true
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR) 2> /dev/null || true
$(TIMESTAMP_DIR)/$(arch)/.time:
	$(Q) $(MAKEDIRS) $(@D) $(TARGET_SO_DIR)
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.fiddle.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)/fiddle
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)
	$(Q) $(TOUCH) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .mm .cxx .cpp .o .S

.cc.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.cc.S:
	$(ECHO) translating $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

.mm.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.mm.S:
	$(ECHO) translating $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

.cxx.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.cxx.S:
	$(ECHO) translating $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

.cpp.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.cpp.S:
	$(ECHO) translating $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

.c.o:
	$(ECHO) compiling $(<)
	$(Q) $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.c.S:
	$(ECHO) translating $(<)
	$(Q) $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

.m.o:
	$(ECHO) compiling $(<)
	$(Q) $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.m.S:
	$(ECHO) translating $(<)
	$(Q) $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

$(TARGET_SO): $(OBJS) Makefile $(TIMESTAMP_DIR)/$(arch)/.time
	$(ECHO) linking shared-object $(DLLIB)
	-$(Q)$(RM) $(@)
	$(Q) $(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)
	$(Q) $(POSTLINK)



###
$(OBJS): $(RUBY_EXTCONF_H)

PWD =

CONFIGURE_LIBFFI = \
	$(LIBFFI_CONFIGURE) --disable-shared \
		--host=$(LIBFFI_ARCH) --enable-builddir=$(arch) \
		CC="$(CC)" CFLAGS="$(LIBFFI_CFLAGS)" \
		LD="$(LD)" LDFLAGS="$(LIBFFI_LDFLAGS)"

$(STATIC_LIB) $(RUBYARCHDIR)/$(DLLIB) $(DLLIB): $(LIBFFI_A)

$(OBJS): $(FFI_H)

.PHONY: .FORCE hdr

.FORCE:

hdr: $(FFI_H)

configure-libffi build-libffi: .FORCE
configure-libffi \
$(LIBFFI_DIR)/include/ffi.h \
$(LIBFFI_DIR)/include/ffitarget.h \
$(LIBFFI_DIR)/fficonfig.h \
$(LIBFFI_DIR)/Makefile:
	$(Q) $(MAKEDIRS) $(LIBFFI_DIR)
	$(Q) $(CONFIGURE_LIBFFI)

build-libffi $(LIBFFI_A):
	$(Q) $(SUBMAKE_PRE) $(MAKE) $(SUBMAKE_ARG)

clean-none:
clean-libffi:
	$(Q) $(SUBMAKE_PRE) $(MAKE) $(SUBMAKE_ARG) clean

distclean-none:
distclean-libffi:
	$(Q) $(SUBMAKE_PRE) $(MAKE) $(SUBMAKE_ARG) distclean
	$(Q) $(RM) $(LIBFFI_DIR)/local.exp
	$(Q) $(RUBY) -rfileutils -e "FileUtils.rmdir(Dir.glob(ARGV[0]+'/**/{,.*/}'), :parents=>true)" $(LIBFFI_DIR)

realclean-none:
realclean-libffi:
	$(Q) $(RMALL) $(LIBFFI_DIR)

.PHONY: clean-libffi distclean-libffi realclean-libffi
.PHONY: clean-none distclean-none realclean-none

clean: clean-$(LIBFFI_CLEAN)
distclean: distclean-$(LIBFFI_CLEAN)
realclean: realclean-$(LIBFFI_CLEAN)

.PHONY: configure configure-libffi

# AUTOGENERATED DEPENDENCIES START
closure.o: $(RUBY_EXTCONF_H)
closure.o: $(arch_hdrdir)/ruby/config.h
closure.o: $(hdrdir)/ruby/backward.h
closure.o: $(hdrdir)/ruby/defines.h
closure.o: $(hdrdir)/ruby/encoding.h
closure.o: $(hdrdir)/ruby/intern.h
closure.o: $(hdrdir)/ruby/io.h
closure.o: $(hdrdir)/ruby/missing.h
closure.o: $(hdrdir)/ruby/onigmo.h
closure.o: $(hdrdir)/ruby/oniguruma.h
closure.o: $(hdrdir)/ruby/ruby.h
closure.o: $(hdrdir)/ruby/st.h
closure.o: $(hdrdir)/ruby/subst.h
closure.o: $(hdrdir)/ruby/thread.h
closure.o: $(top_srcdir)/include/ruby.h
closure.o: $(top_srcdir)/internal.h
closure.o: closure.c
closure.o: closure.h
closure.o: conversions.h
closure.o: fiddle.h
closure.o: function.h
conversions.o: $(RUBY_EXTCONF_H)
conversions.o: $(arch_hdrdir)/ruby/config.h
conversions.o: $(hdrdir)/ruby/backward.h
conversions.o: $(hdrdir)/ruby/defines.h
conversions.o: $(hdrdir)/ruby/intern.h
conversions.o: $(hdrdir)/ruby/missing.h
conversions.o: $(hdrdir)/ruby/ruby.h
conversions.o: $(hdrdir)/ruby/st.h
conversions.o: $(hdrdir)/ruby/subst.h
conversions.o: $(top_srcdir)/include/ruby.h
conversions.o: closure.h
conversions.o: conversions.c
conversions.o: conversions.h
conversions.o: fiddle.h
conversions.o: function.h
fiddle.o: $(RUBY_EXTCONF_H)
fiddle.o: $(arch_hdrdir)/ruby/config.h
fiddle.o: $(hdrdir)/ruby/backward.h
fiddle.o: $(hdrdir)/ruby/defines.h
fiddle.o: $(hdrdir)/ruby/intern.h
fiddle.o: $(hdrdir)/ruby/missing.h
fiddle.o: $(hdrdir)/ruby/ruby.h
fiddle.o: $(hdrdir)/ruby/st.h
fiddle.o: $(hdrdir)/ruby/subst.h
fiddle.o: $(top_srcdir)/include/ruby.h
fiddle.o: closure.h
fiddle.o: conversions.h
fiddle.o: fiddle.c
fiddle.o: fiddle.h
fiddle.o: function.h
function.o: $(RUBY_EXTCONF_H)
function.o: $(arch_hdrdir)/ruby/config.h
function.o: $(hdrdir)/ruby/backward.h
function.o: $(hdrdir)/ruby/defines.h
function.o: $(hdrdir)/ruby/intern.h
function.o: $(hdrdir)/ruby/missing.h
function.o: $(hdrdir)/ruby/ruby.h
function.o: $(hdrdir)/ruby/st.h
function.o: $(hdrdir)/ruby/subst.h
function.o: $(hdrdir)/ruby/thread.h
function.o: $(top_srcdir)/include/ruby.h
function.o: closure.h
function.o: conversions.h
function.o: fiddle.h
function.o: function.c
function.o: function.h
handle.o: $(RUBY_EXTCONF_H)
handle.o: $(arch_hdrdir)/ruby/config.h
handle.o: $(hdrdir)/ruby/backward.h
handle.o: $(hdrdir)/ruby/defines.h
handle.o: $(hdrdir)/ruby/intern.h
handle.o: $(hdrdir)/ruby/missing.h
handle.o: $(hdrdir)/ruby/ruby.h
handle.o: $(hdrdir)/ruby/st.h
handle.o: $(hdrdir)/ruby/subst.h
handle.o: $(top_srcdir)/include/ruby.h
handle.o: closure.h
handle.o: conversions.h
handle.o: fiddle.h
handle.o: function.h
handle.o: handle.c
pointer.o: $(RUBY_EXTCONF_H)
pointer.o: $(arch_hdrdir)/ruby/config.h
pointer.o: $(hdrdir)/ruby/backward.h
pointer.o: $(hdrdir)/ruby/defines.h
pointer.o: $(hdrdir)/ruby/encoding.h
pointer.o: $(hdrdir)/ruby/intern.h
pointer.o: $(hdrdir)/ruby/io.h
pointer.o: $(hdrdir)/ruby/missing.h
pointer.o: $(hdrdir)/ruby/onigmo.h
pointer.o: $(hdrdir)/ruby/oniguruma.h
pointer.o: $(hdrdir)/ruby/ruby.h
pointer.o: $(hdrdir)/ruby/st.h
pointer.o: $(hdrdir)/ruby/subst.h
pointer.o: $(top_srcdir)/include/ruby.h
pointer.o: closure.h
pointer.o: conversions.h
pointer.o: fiddle.h
pointer.o: function.h
pointer.o: pointer.c
# AUTOGENERATED DEPENDENCIES END
