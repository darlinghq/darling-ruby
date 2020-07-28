
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
srcdir = $(top_srcdir)/ext/psych
topdir = ../..
hdrdir = $(top_srcdir)/include
arch_hdrdir = $(extout)/include/$(arch)
PATH_SEPARATOR = :
VPATH = $(srcdir):$(arch_hdrdir)/ruby:$(hdrdir)/ruby:$(srcdir)/yaml
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
CFLAGS   = $(CCDLFLAGS) -Wno-nullability-completeness -O0 -glldb -pipe $(ARCH_FLAG)
INCFLAGS = -I. -I$(arch_hdrdir) -I$(hdrdir) -I$(srcdir) -I$(srcdir)/yaml
DEFS     = 
CPPFLAGS = -DRUBY_EXTCONF_H=\"$(RUBY_EXTCONF_H)\" -isystem/Users/ariel/git/darling/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include -isystem/Users/ariel/arch/build/darling/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include -isystem/Users/ariel/git/darling/framework-include -DHAVE_GCC_ATOMIC_BUILTINS -DDARLING -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE -D_DARWIN_UNLIMITED_SELECT -D_REENTRANT $(DEFS) $(cppflags)
CXXFLAGS = $(CCDLFLAGS) $(cxxflags) $(ARCH_FLAG)
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
LIBS = $(LIBRUBYARG_SHARED)   
ORIG_SRCS = psych.c psych_emitter.c psych_parser.c psych_to_ruby.c psych_yaml_tree.c
SRCS = $(ORIG_SRCS) psych_to_ruby.c psych_yaml_tree.c psych_emitter.c psych.c psych_parser.c loader.c scanner.c api.c writer.c dumper.c reader.c emitter.c parser.c
OBJS = psych_to_ruby.o psych_yaml_tree.o psych_emitter.o psych.o psych_parser.o loader.o scanner.o api.o writer.o dumper.o reader.o emitter.o parser.o
HDRS = $(srcdir)/psych.h $(srcdir)/psych_parser.h $(srcdir)/psych_to_ruby.h $(srcdir)/psych_emitter.h $(srcdir)/psych_yaml_tree.h
LOCAL_HDRS = 
TARGET = psych
TARGET_NAME = psych
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
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
do-install-rb-default: $(RUBYLIBDIR)/psych.rb
$(RUBYLIBDIR)/psych.rb: $(srcdir)/lib/psych.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
	$(Q) $(COPY) $(srcdir)/lib/psych.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych.rb
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
do-install-rb-default: $(RUBYLIBDIR)/psych/core_ext.rb
$(RUBYLIBDIR)/psych/core_ext.rb: $(srcdir)/lib/psych/core_ext.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/core_ext.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/core_ext.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/scalar_scanner.rb
$(RUBYLIBDIR)/psych/scalar_scanner.rb: $(srcdir)/lib/psych/scalar_scanner.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/scalar_scanner.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/scalar_scanner.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/versions.rb
$(RUBYLIBDIR)/psych/versions.rb: $(srcdir)/lib/psych/versions.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/versions.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/versions.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/omap.rb
$(RUBYLIBDIR)/psych/omap.rb: $(srcdir)/lib/psych/omap.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/omap.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/omap.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/set.rb
$(RUBYLIBDIR)/psych/set.rb: $(srcdir)/lib/psych/set.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/set.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/set.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/nodes.rb
$(RUBYLIBDIR)/psych/nodes.rb: $(srcdir)/lib/psych/nodes.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/nodes.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/nodes.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/streaming.rb
$(RUBYLIBDIR)/psych/streaming.rb: $(srcdir)/lib/psych/streaming.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/streaming.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/streaming.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/parser.rb
$(RUBYLIBDIR)/psych/parser.rb: $(srcdir)/lib/psych/parser.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/parser.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/parser.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/class_loader.rb
$(RUBYLIBDIR)/psych/class_loader.rb: $(srcdir)/lib/psych/class_loader.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/class_loader.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/class_loader.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/tree_builder.rb
$(RUBYLIBDIR)/psych/tree_builder.rb: $(srcdir)/lib/psych/tree_builder.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/tree_builder.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/tree_builder.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/coder.rb
$(RUBYLIBDIR)/psych/coder.rb: $(srcdir)/lib/psych/coder.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/coder.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/coder.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/stream.rb
$(RUBYLIBDIR)/psych/stream.rb: $(srcdir)/lib/psych/stream.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/stream.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/stream.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/syntax_error.rb
$(RUBYLIBDIR)/psych/syntax_error.rb: $(srcdir)/lib/psych/syntax_error.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/syntax_error.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/syntax_error.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/y.rb
$(RUBYLIBDIR)/psych/y.rb: $(srcdir)/lib/psych/y.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/y.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/y.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/visitors.rb
$(RUBYLIBDIR)/psych/visitors.rb: $(srcdir)/lib/psych/visitors.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/visitors.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/visitors.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/handler.rb
$(RUBYLIBDIR)/psych/handler.rb: $(srcdir)/lib/psych/handler.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/handler.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/handler.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/exception.rb
$(RUBYLIBDIR)/psych/exception.rb: $(srcdir)/lib/psych/exception.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	$(Q) $(COPY) $(srcdir)/lib/psych/exception.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/exception.rb
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.visitors.time
do-install-rb-default: $(RUBYLIBDIR)/psych/visitors/depth_first.rb
$(RUBYLIBDIR)/psych/visitors/depth_first.rb: $(srcdir)/lib/psych/visitors/depth_first.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.visitors.time
	$(Q) $(COPY) $(srcdir)/lib/psych/visitors/depth_first.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/visitors/depth_first.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/visitors/json_tree.rb
$(RUBYLIBDIR)/psych/visitors/json_tree.rb: $(srcdir)/lib/psych/visitors/json_tree.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.visitors.time
	$(Q) $(COPY) $(srcdir)/lib/psych/visitors/json_tree.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/visitors/json_tree.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/visitors/emitter.rb
$(RUBYLIBDIR)/psych/visitors/emitter.rb: $(srcdir)/lib/psych/visitors/emitter.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.visitors.time
	$(Q) $(COPY) $(srcdir)/lib/psych/visitors/emitter.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/visitors/emitter.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/visitors/visitor.rb
$(RUBYLIBDIR)/psych/visitors/visitor.rb: $(srcdir)/lib/psych/visitors/visitor.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.visitors.time
	$(Q) $(COPY) $(srcdir)/lib/psych/visitors/visitor.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/visitors/visitor.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/visitors/yaml_tree.rb
$(RUBYLIBDIR)/psych/visitors/yaml_tree.rb: $(srcdir)/lib/psych/visitors/yaml_tree.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.visitors.time
	$(Q) $(COPY) $(srcdir)/lib/psych/visitors/yaml_tree.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/visitors/yaml_tree.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/visitors/to_ruby.rb
$(RUBYLIBDIR)/psych/visitors/to_ruby.rb: $(srcdir)/lib/psych/visitors/to_ruby.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.visitors.time
	$(Q) $(COPY) $(srcdir)/lib/psych/visitors/to_ruby.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/visitors/to_ruby.rb
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.nodes.time
do-install-rb-default: $(RUBYLIBDIR)/psych/nodes/node.rb
$(RUBYLIBDIR)/psych/nodes/node.rb: $(srcdir)/lib/psych/nodes/node.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.nodes.time
	$(Q) $(COPY) $(srcdir)/lib/psych/nodes/node.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/nodes/node.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/nodes/mapping.rb
$(RUBYLIBDIR)/psych/nodes/mapping.rb: $(srcdir)/lib/psych/nodes/mapping.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.nodes.time
	$(Q) $(COPY) $(srcdir)/lib/psych/nodes/mapping.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/nodes/mapping.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/nodes/document.rb
$(RUBYLIBDIR)/psych/nodes/document.rb: $(srcdir)/lib/psych/nodes/document.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.nodes.time
	$(Q) $(COPY) $(srcdir)/lib/psych/nodes/document.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/nodes/document.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/nodes/stream.rb
$(RUBYLIBDIR)/psych/nodes/stream.rb: $(srcdir)/lib/psych/nodes/stream.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.nodes.time
	$(Q) $(COPY) $(srcdir)/lib/psych/nodes/stream.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/nodes/stream.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/nodes/sequence.rb
$(RUBYLIBDIR)/psych/nodes/sequence.rb: $(srcdir)/lib/psych/nodes/sequence.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.nodes.time
	$(Q) $(COPY) $(srcdir)/lib/psych/nodes/sequence.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/nodes/sequence.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/nodes/scalar.rb
$(RUBYLIBDIR)/psych/nodes/scalar.rb: $(srcdir)/lib/psych/nodes/scalar.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.nodes.time
	$(Q) $(COPY) $(srcdir)/lib/psych/nodes/scalar.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/nodes/scalar.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/nodes/alias.rb
$(RUBYLIBDIR)/psych/nodes/alias.rb: $(srcdir)/lib/psych/nodes/alias.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.nodes.time
	$(Q) $(COPY) $(srcdir)/lib/psych/nodes/alias.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/nodes/alias.rb
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.json.time
do-install-rb-default: $(RUBYLIBDIR)/psych/json/ruby_events.rb
$(RUBYLIBDIR)/psych/json/ruby_events.rb: $(srcdir)/lib/psych/json/ruby_events.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.json.time
	$(Q) $(COPY) $(srcdir)/lib/psych/json/ruby_events.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/json/ruby_events.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/json/tree_builder.rb
$(RUBYLIBDIR)/psych/json/tree_builder.rb: $(srcdir)/lib/psych/json/tree_builder.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.json.time
	$(Q) $(COPY) $(srcdir)/lib/psych/json/tree_builder.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/json/tree_builder.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/json/stream.rb
$(RUBYLIBDIR)/psych/json/stream.rb: $(srcdir)/lib/psych/json/stream.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.json.time
	$(Q) $(COPY) $(srcdir)/lib/psych/json/stream.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/json/stream.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/json/yaml_events.rb
$(RUBYLIBDIR)/psych/json/yaml_events.rb: $(srcdir)/lib/psych/json/yaml_events.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.json.time
	$(Q) $(COPY) $(srcdir)/lib/psych/json/yaml_events.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/json/yaml_events.rb
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.handlers.time
do-install-rb-default: $(RUBYLIBDIR)/psych/handlers/recorder.rb
$(RUBYLIBDIR)/psych/handlers/recorder.rb: $(srcdir)/lib/psych/handlers/recorder.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.handlers.time
	$(Q) $(COPY) $(srcdir)/lib/psych/handlers/recorder.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/handlers/recorder.rb
do-install-rb-default: $(RUBYLIBDIR)/psych/handlers/document_stream.rb
$(RUBYLIBDIR)/psych/handlers/document_stream.rb: $(srcdir)/lib/psych/handlers/document_stream.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.handlers.time
	$(Q) $(COPY) $(srcdir)/lib/psych/handlers/document_stream.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/psych/handlers/document_stream.rb
pre-install-rb-default:
	$(Q1:0=@$(MAKE) -q do-install-rb-default || )$(ECHO1:0=echo) installing default psych libraries
clean-rb-default::
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.visitors.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR)/psych/visitors 2> /dev/null || true
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.nodes.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR)/psych/nodes 2> /dev/null || true
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.json.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR)/psych/json 2> /dev/null || true
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.handlers.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR)/psych/handlers 2> /dev/null || true
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR)/psych 2> /dev/null || true
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR) 2> /dev/null || true
$(TIMESTAMP_DIR)/$(arch)/.time:
	$(Q) $(MAKEDIRS) $(@D) $(TARGET_SO_DIR)
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)/psych
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.visitors.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)/psych/visitors
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.nodes.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)/psych/nodes
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.json.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)/psych/json
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.psych.-.handlers.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)/psych/handlers
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

# AUTOGENERATED DEPENDENCIES START
psych.o: $(RUBY_EXTCONF_H)
psych.o: $(arch_hdrdir)/ruby/config.h
psych.o: $(hdrdir)/ruby/backward.h
psych.o: $(hdrdir)/ruby/defines.h
psych.o: $(hdrdir)/ruby/encoding.h
psych.o: $(hdrdir)/ruby/intern.h
psych.o: $(hdrdir)/ruby/missing.h
psych.o: $(hdrdir)/ruby/onigmo.h
psych.o: $(hdrdir)/ruby/oniguruma.h
psych.o: $(hdrdir)/ruby/ruby.h
psych.o: $(hdrdir)/ruby/st.h
psych.o: $(hdrdir)/ruby/subst.h
psych.o: $(top_srcdir)/include/ruby.h
psych.o: psych.c
psych.o: psych.h
psych.o: psych_emitter.h
psych.o: psych_parser.h
psych.o: psych_to_ruby.h
psych.o: psych_yaml_tree.h
psych_emitter.o: $(RUBY_EXTCONF_H)
psych_emitter.o: $(arch_hdrdir)/ruby/config.h
psych_emitter.o: $(hdrdir)/ruby/backward.h
psych_emitter.o: $(hdrdir)/ruby/defines.h
psych_emitter.o: $(hdrdir)/ruby/encoding.h
psych_emitter.o: $(hdrdir)/ruby/intern.h
psych_emitter.o: $(hdrdir)/ruby/missing.h
psych_emitter.o: $(hdrdir)/ruby/onigmo.h
psych_emitter.o: $(hdrdir)/ruby/oniguruma.h
psych_emitter.o: $(hdrdir)/ruby/ruby.h
psych_emitter.o: $(hdrdir)/ruby/st.h
psych_emitter.o: $(hdrdir)/ruby/subst.h
psych_emitter.o: $(top_srcdir)/include/ruby.h
psych_emitter.o: psych.h
psych_emitter.o: psych_emitter.c
psych_emitter.o: psych_emitter.h
psych_emitter.o: psych_parser.h
psych_emitter.o: psych_to_ruby.h
psych_emitter.o: psych_yaml_tree.h
psych_parser.o: $(RUBY_EXTCONF_H)
psych_parser.o: $(arch_hdrdir)/ruby/config.h
psych_parser.o: $(hdrdir)/ruby/backward.h
psych_parser.o: $(hdrdir)/ruby/defines.h
psych_parser.o: $(hdrdir)/ruby/encoding.h
psych_parser.o: $(hdrdir)/ruby/intern.h
psych_parser.o: $(hdrdir)/ruby/missing.h
psych_parser.o: $(hdrdir)/ruby/onigmo.h
psych_parser.o: $(hdrdir)/ruby/oniguruma.h
psych_parser.o: $(hdrdir)/ruby/ruby.h
psych_parser.o: $(hdrdir)/ruby/st.h
psych_parser.o: $(hdrdir)/ruby/subst.h
psych_parser.o: $(top_srcdir)/include/ruby.h
psych_parser.o: psych.h
psych_parser.o: psych_emitter.h
psych_parser.o: psych_parser.c
psych_parser.o: psych_parser.h
psych_parser.o: psych_to_ruby.h
psych_parser.o: psych_yaml_tree.h
psych_to_ruby.o: $(RUBY_EXTCONF_H)
psych_to_ruby.o: $(arch_hdrdir)/ruby/config.h
psych_to_ruby.o: $(hdrdir)/ruby/backward.h
psych_to_ruby.o: $(hdrdir)/ruby/defines.h
psych_to_ruby.o: $(hdrdir)/ruby/encoding.h
psych_to_ruby.o: $(hdrdir)/ruby/intern.h
psych_to_ruby.o: $(hdrdir)/ruby/missing.h
psych_to_ruby.o: $(hdrdir)/ruby/onigmo.h
psych_to_ruby.o: $(hdrdir)/ruby/oniguruma.h
psych_to_ruby.o: $(hdrdir)/ruby/ruby.h
psych_to_ruby.o: $(hdrdir)/ruby/st.h
psych_to_ruby.o: $(hdrdir)/ruby/subst.h
psych_to_ruby.o: $(top_srcdir)/include/ruby.h
psych_to_ruby.o: psych.h
psych_to_ruby.o: psych_emitter.h
psych_to_ruby.o: psych_parser.h
psych_to_ruby.o: psych_to_ruby.c
psych_to_ruby.o: psych_to_ruby.h
psych_to_ruby.o: psych_yaml_tree.h
psych_yaml_tree.o: $(RUBY_EXTCONF_H)
psych_yaml_tree.o: $(arch_hdrdir)/ruby/config.h
psych_yaml_tree.o: $(hdrdir)/ruby/backward.h
psych_yaml_tree.o: $(hdrdir)/ruby/defines.h
psych_yaml_tree.o: $(hdrdir)/ruby/encoding.h
psych_yaml_tree.o: $(hdrdir)/ruby/intern.h
psych_yaml_tree.o: $(hdrdir)/ruby/missing.h
psych_yaml_tree.o: $(hdrdir)/ruby/onigmo.h
psych_yaml_tree.o: $(hdrdir)/ruby/oniguruma.h
psych_yaml_tree.o: $(hdrdir)/ruby/ruby.h
psych_yaml_tree.o: $(hdrdir)/ruby/st.h
psych_yaml_tree.o: $(hdrdir)/ruby/subst.h
psych_yaml_tree.o: $(top_srcdir)/include/ruby.h
psych_yaml_tree.o: psych.h
psych_yaml_tree.o: psych_emitter.h
psych_yaml_tree.o: psych_parser.h
psych_yaml_tree.o: psych_to_ruby.h
psych_yaml_tree.o: psych_yaml_tree.c
psych_yaml_tree.o: psych_yaml_tree.h
# AUTOGENERATED DEPENDENCIES END
