
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
srcdir = $(top_srcdir)/ext/openssl
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
warnflags =  -Werror=deprecated-declarations
cppflags = 
CCDLFLAGS = 
CFLAGS   = $(CCDLFLAGS) -Wno-nullability-completeness -O0 -glldb -pipe $(ARCH_FLAG)
INCFLAGS = -I. -I$(arch_hdrdir) -I$(hdrdir) -I$(srcdir)
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
LIBS = $(LIBRUBYARG_SHARED) -lssl -lcrypto   
ORIG_SRCS = openssl_missing.c ossl.c ossl_asn1.c ossl_bio.c ossl_bn.c ossl_cipher.c ossl_config.c ossl_digest.c ossl_engine.c ossl_hmac.c ossl_kdf.c ossl_ns_spki.c ossl_ocsp.c ossl_pkcs12.c ossl_pkcs7.c ossl_pkey.c ossl_pkey_dh.c ossl_pkey_dsa.c ossl_pkey_ec.c ossl_pkey_rsa.c ossl_rand.c ossl_ssl.c ossl_ssl_session.c ossl_x509.c ossl_x509attr.c ossl_x509cert.c ossl_x509crl.c ossl_x509ext.c ossl_x509name.c ossl_x509req.c ossl_x509revoked.c ossl_x509store.c
SRCS = $(ORIG_SRCS) 
OBJS = openssl_missing.o ossl.o ossl_asn1.o ossl_bio.o ossl_bn.o ossl_cipher.o ossl_config.o ossl_digest.o ossl_engine.o ossl_hmac.o ossl_kdf.o ossl_ns_spki.o ossl_ocsp.o ossl_pkcs12.o ossl_pkcs7.o ossl_pkey.o ossl_pkey_dh.o ossl_pkey_dsa.o ossl_pkey_ec.o ossl_pkey_rsa.o ossl_rand.o ossl_ssl.o ossl_ssl_session.o ossl_x509.o ossl_x509attr.o ossl_x509cert.o ossl_x509crl.o ossl_x509ext.o ossl_x509name.o ossl_x509req.o ossl_x509revoked.o ossl_x509store.o
HDRS = $(srcdir)/ossl_pkcs12.h $(srcdir)/ossl_bn.h $(srcdir)/ossl_cipher.h $(srcdir)/openssl_missing.h $(srcdir)/ossl_x509.h $(srcdir)/ossl_pkey.h $(srcdir)/ossl_asn1.h $(srcdir)/ossl_digest.h $(srcdir)/ruby_missing.h $(srcdir)/ossl_config.h $(srcdir)/ossl_ssl.h $(srcdir)/ossl_engine.h $(srcdir)/ossl_version.h $(srcdir)/ossl_ns_spki.h $(srcdir)/ossl_pkcs7.h $(srcdir)/ossl_hmac.h $(srcdir)/ossl.h $(srcdir)/ossl_ocsp.h $(srcdir)/ossl_rand.h $(srcdir)/ossl_kdf.h $(srcdir)/ossl_bio.h
LOCAL_HDRS = 
TARGET = openssl
TARGET_NAME = openssl
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
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
do-install-rb-default: $(RUBYLIBDIR)/openssl/buffering.rb
$(RUBYLIBDIR)/openssl/buffering.rb: $(srcdir)/lib/openssl/buffering.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
	$(Q) $(COPY) $(srcdir)/lib/openssl/buffering.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/openssl/buffering.rb
do-install-rb-default: $(RUBYLIBDIR)/openssl/ssl.rb
$(RUBYLIBDIR)/openssl/ssl.rb: $(srcdir)/lib/openssl/ssl.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
	$(Q) $(COPY) $(srcdir)/lib/openssl/ssl.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/openssl/ssl.rb
do-install-rb-default: $(RUBYLIBDIR)/openssl/bn.rb
$(RUBYLIBDIR)/openssl/bn.rb: $(srcdir)/lib/openssl/bn.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
	$(Q) $(COPY) $(srcdir)/lib/openssl/bn.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/openssl/bn.rb
do-install-rb-default: $(RUBYLIBDIR)/openssl/cipher.rb
$(RUBYLIBDIR)/openssl/cipher.rb: $(srcdir)/lib/openssl/cipher.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
	$(Q) $(COPY) $(srcdir)/lib/openssl/cipher.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/openssl/cipher.rb
do-install-rb-default: $(RUBYLIBDIR)/openssl/pkcs5.rb
$(RUBYLIBDIR)/openssl/pkcs5.rb: $(srcdir)/lib/openssl/pkcs5.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
	$(Q) $(COPY) $(srcdir)/lib/openssl/pkcs5.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/openssl/pkcs5.rb
do-install-rb-default: $(RUBYLIBDIR)/openssl/config.rb
$(RUBYLIBDIR)/openssl/config.rb: $(srcdir)/lib/openssl/config.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
	$(Q) $(COPY) $(srcdir)/lib/openssl/config.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/openssl/config.rb
do-install-rb-default: $(RUBYLIBDIR)/openssl/pkey.rb
$(RUBYLIBDIR)/openssl/pkey.rb: $(srcdir)/lib/openssl/pkey.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
	$(Q) $(COPY) $(srcdir)/lib/openssl/pkey.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/openssl/pkey.rb
do-install-rb-default: $(RUBYLIBDIR)/openssl/x509.rb
$(RUBYLIBDIR)/openssl/x509.rb: $(srcdir)/lib/openssl/x509.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
	$(Q) $(COPY) $(srcdir)/lib/openssl/x509.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/openssl/x509.rb
do-install-rb-default: $(RUBYLIBDIR)/openssl/digest.rb
$(RUBYLIBDIR)/openssl/digest.rb: $(srcdir)/lib/openssl/digest.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
	$(Q) $(COPY) $(srcdir)/lib/openssl/digest.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/openssl/digest.rb
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
do-install-rb-default: $(RUBYLIBDIR)/openssl.rb
$(RUBYLIBDIR)/openssl.rb: $(srcdir)/lib/openssl.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
	$(Q) $(COPY) $(srcdir)/lib/openssl.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/openssl.rb
pre-install-rb-default:
	$(Q1:0=@$(MAKE) -q do-install-rb-default || )$(ECHO1:0=echo) installing default openssl libraries
clean-rb-default::
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR)/openssl 2> /dev/null || true
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR) 2> /dev/null || true
$(TIMESTAMP_DIR)/$(arch)/.time:
	$(Q) $(MAKEDIRS) $(@D) $(TARGET_SO_DIR)
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.openssl.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)/openssl
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

# AUTOGENERATED DEPENDENCIES START
openssl_missing.o: $(RUBY_EXTCONF_H)
openssl_missing.o: $(arch_hdrdir)/ruby/config.h
openssl_missing.o: openssl_missing.c
openssl_missing.o: openssl_missing.h
ossl.o: $(RUBY_EXTCONF_H)
ossl.o: $(arch_hdrdir)/ruby/config.h
ossl.o: $(hdrdir)/ruby/backward.h
ossl.o: $(hdrdir)/ruby/defines.h
ossl.o: $(hdrdir)/ruby/encoding.h
ossl.o: $(hdrdir)/ruby/intern.h
ossl.o: $(hdrdir)/ruby/io.h
ossl.o: $(hdrdir)/ruby/missing.h
ossl.o: $(hdrdir)/ruby/onigmo.h
ossl.o: $(hdrdir)/ruby/oniguruma.h
ossl.o: $(hdrdir)/ruby/ruby.h
ossl.o: $(hdrdir)/ruby/st.h
ossl.o: $(hdrdir)/ruby/subst.h
ossl.o: $(hdrdir)/ruby/thread.h
ossl.o: $(hdrdir)/ruby/thread_native.h
ossl.o: $(top_srcdir)/include/ruby.h
ossl.o: openssl_missing.h
ossl.o: ossl.c
ossl.o: ossl.h
ossl.o: ossl_asn1.h
ossl.o: ossl_bio.h
ossl.o: ossl_bn.h
ossl.o: ossl_cipher.h
ossl.o: ossl_config.h
ossl.o: ossl_digest.h
ossl.o: ossl_engine.h
ossl.o: ossl_hmac.h
ossl.o: ossl_kdf.h
ossl.o: ossl_ns_spki.h
ossl.o: ossl_ocsp.h
ossl.o: ossl_pkcs12.h
ossl.o: ossl_pkcs7.h
ossl.o: ossl_pkey.h
ossl.o: ossl_rand.h
ossl.o: ossl_ssl.h
ossl.o: ossl_version.h
ossl.o: ossl_x509.h
ossl.o: ruby_missing.h
ossl_asn1.o: $(RUBY_EXTCONF_H)
ossl_asn1.o: $(arch_hdrdir)/ruby/config.h
ossl_asn1.o: $(hdrdir)/ruby/backward.h
ossl_asn1.o: $(hdrdir)/ruby/defines.h
ossl_asn1.o: $(hdrdir)/ruby/encoding.h
ossl_asn1.o: $(hdrdir)/ruby/intern.h
ossl_asn1.o: $(hdrdir)/ruby/io.h
ossl_asn1.o: $(hdrdir)/ruby/missing.h
ossl_asn1.o: $(hdrdir)/ruby/onigmo.h
ossl_asn1.o: $(hdrdir)/ruby/oniguruma.h
ossl_asn1.o: $(hdrdir)/ruby/ruby.h
ossl_asn1.o: $(hdrdir)/ruby/st.h
ossl_asn1.o: $(hdrdir)/ruby/subst.h
ossl_asn1.o: $(hdrdir)/ruby/thread.h
ossl_asn1.o: $(top_srcdir)/include/ruby.h
ossl_asn1.o: openssl_missing.h
ossl_asn1.o: ossl.h
ossl_asn1.o: ossl_asn1.c
ossl_asn1.o: ossl_asn1.h
ossl_asn1.o: ossl_bio.h
ossl_asn1.o: ossl_bn.h
ossl_asn1.o: ossl_cipher.h
ossl_asn1.o: ossl_config.h
ossl_asn1.o: ossl_digest.h
ossl_asn1.o: ossl_engine.h
ossl_asn1.o: ossl_hmac.h
ossl_asn1.o: ossl_kdf.h
ossl_asn1.o: ossl_ns_spki.h
ossl_asn1.o: ossl_ocsp.h
ossl_asn1.o: ossl_pkcs12.h
ossl_asn1.o: ossl_pkcs7.h
ossl_asn1.o: ossl_pkey.h
ossl_asn1.o: ossl_rand.h
ossl_asn1.o: ossl_ssl.h
ossl_asn1.o: ossl_version.h
ossl_asn1.o: ossl_x509.h
ossl_asn1.o: ruby_missing.h
ossl_bio.o: $(RUBY_EXTCONF_H)
ossl_bio.o: $(arch_hdrdir)/ruby/config.h
ossl_bio.o: $(hdrdir)/ruby/backward.h
ossl_bio.o: $(hdrdir)/ruby/defines.h
ossl_bio.o: $(hdrdir)/ruby/encoding.h
ossl_bio.o: $(hdrdir)/ruby/intern.h
ossl_bio.o: $(hdrdir)/ruby/io.h
ossl_bio.o: $(hdrdir)/ruby/missing.h
ossl_bio.o: $(hdrdir)/ruby/onigmo.h
ossl_bio.o: $(hdrdir)/ruby/oniguruma.h
ossl_bio.o: $(hdrdir)/ruby/ruby.h
ossl_bio.o: $(hdrdir)/ruby/st.h
ossl_bio.o: $(hdrdir)/ruby/subst.h
ossl_bio.o: $(hdrdir)/ruby/thread.h
ossl_bio.o: $(top_srcdir)/include/ruby.h
ossl_bio.o: openssl_missing.h
ossl_bio.o: ossl.h
ossl_bio.o: ossl_asn1.h
ossl_bio.o: ossl_bio.c
ossl_bio.o: ossl_bio.h
ossl_bio.o: ossl_bn.h
ossl_bio.o: ossl_cipher.h
ossl_bio.o: ossl_config.h
ossl_bio.o: ossl_digest.h
ossl_bio.o: ossl_engine.h
ossl_bio.o: ossl_hmac.h
ossl_bio.o: ossl_kdf.h
ossl_bio.o: ossl_ns_spki.h
ossl_bio.o: ossl_ocsp.h
ossl_bio.o: ossl_pkcs12.h
ossl_bio.o: ossl_pkcs7.h
ossl_bio.o: ossl_pkey.h
ossl_bio.o: ossl_rand.h
ossl_bio.o: ossl_ssl.h
ossl_bio.o: ossl_version.h
ossl_bio.o: ossl_x509.h
ossl_bio.o: ruby_missing.h
ossl_bn.o: $(RUBY_EXTCONF_H)
ossl_bn.o: $(arch_hdrdir)/ruby/config.h
ossl_bn.o: $(hdrdir)/ruby/backward.h
ossl_bn.o: $(hdrdir)/ruby/defines.h
ossl_bn.o: $(hdrdir)/ruby/encoding.h
ossl_bn.o: $(hdrdir)/ruby/intern.h
ossl_bn.o: $(hdrdir)/ruby/io.h
ossl_bn.o: $(hdrdir)/ruby/missing.h
ossl_bn.o: $(hdrdir)/ruby/onigmo.h
ossl_bn.o: $(hdrdir)/ruby/oniguruma.h
ossl_bn.o: $(hdrdir)/ruby/ruby.h
ossl_bn.o: $(hdrdir)/ruby/st.h
ossl_bn.o: $(hdrdir)/ruby/subst.h
ossl_bn.o: $(hdrdir)/ruby/thread.h
ossl_bn.o: $(top_srcdir)/include/ruby.h
ossl_bn.o: openssl_missing.h
ossl_bn.o: ossl.h
ossl_bn.o: ossl_asn1.h
ossl_bn.o: ossl_bio.h
ossl_bn.o: ossl_bn.c
ossl_bn.o: ossl_bn.h
ossl_bn.o: ossl_cipher.h
ossl_bn.o: ossl_config.h
ossl_bn.o: ossl_digest.h
ossl_bn.o: ossl_engine.h
ossl_bn.o: ossl_hmac.h
ossl_bn.o: ossl_kdf.h
ossl_bn.o: ossl_ns_spki.h
ossl_bn.o: ossl_ocsp.h
ossl_bn.o: ossl_pkcs12.h
ossl_bn.o: ossl_pkcs7.h
ossl_bn.o: ossl_pkey.h
ossl_bn.o: ossl_rand.h
ossl_bn.o: ossl_ssl.h
ossl_bn.o: ossl_version.h
ossl_bn.o: ossl_x509.h
ossl_bn.o: ruby_missing.h
ossl_cipher.o: $(RUBY_EXTCONF_H)
ossl_cipher.o: $(arch_hdrdir)/ruby/config.h
ossl_cipher.o: $(hdrdir)/ruby/backward.h
ossl_cipher.o: $(hdrdir)/ruby/defines.h
ossl_cipher.o: $(hdrdir)/ruby/encoding.h
ossl_cipher.o: $(hdrdir)/ruby/intern.h
ossl_cipher.o: $(hdrdir)/ruby/io.h
ossl_cipher.o: $(hdrdir)/ruby/missing.h
ossl_cipher.o: $(hdrdir)/ruby/onigmo.h
ossl_cipher.o: $(hdrdir)/ruby/oniguruma.h
ossl_cipher.o: $(hdrdir)/ruby/ruby.h
ossl_cipher.o: $(hdrdir)/ruby/st.h
ossl_cipher.o: $(hdrdir)/ruby/subst.h
ossl_cipher.o: $(hdrdir)/ruby/thread.h
ossl_cipher.o: $(top_srcdir)/include/ruby.h
ossl_cipher.o: openssl_missing.h
ossl_cipher.o: ossl.h
ossl_cipher.o: ossl_asn1.h
ossl_cipher.o: ossl_bio.h
ossl_cipher.o: ossl_bn.h
ossl_cipher.o: ossl_cipher.c
ossl_cipher.o: ossl_cipher.h
ossl_cipher.o: ossl_config.h
ossl_cipher.o: ossl_digest.h
ossl_cipher.o: ossl_engine.h
ossl_cipher.o: ossl_hmac.h
ossl_cipher.o: ossl_kdf.h
ossl_cipher.o: ossl_ns_spki.h
ossl_cipher.o: ossl_ocsp.h
ossl_cipher.o: ossl_pkcs12.h
ossl_cipher.o: ossl_pkcs7.h
ossl_cipher.o: ossl_pkey.h
ossl_cipher.o: ossl_rand.h
ossl_cipher.o: ossl_ssl.h
ossl_cipher.o: ossl_version.h
ossl_cipher.o: ossl_x509.h
ossl_cipher.o: ruby_missing.h
ossl_config.o: $(RUBY_EXTCONF_H)
ossl_config.o: $(arch_hdrdir)/ruby/config.h
ossl_config.o: $(hdrdir)/ruby/backward.h
ossl_config.o: $(hdrdir)/ruby/defines.h
ossl_config.o: $(hdrdir)/ruby/encoding.h
ossl_config.o: $(hdrdir)/ruby/intern.h
ossl_config.o: $(hdrdir)/ruby/io.h
ossl_config.o: $(hdrdir)/ruby/missing.h
ossl_config.o: $(hdrdir)/ruby/onigmo.h
ossl_config.o: $(hdrdir)/ruby/oniguruma.h
ossl_config.o: $(hdrdir)/ruby/ruby.h
ossl_config.o: $(hdrdir)/ruby/st.h
ossl_config.o: $(hdrdir)/ruby/subst.h
ossl_config.o: $(hdrdir)/ruby/thread.h
ossl_config.o: $(top_srcdir)/include/ruby.h
ossl_config.o: openssl_missing.h
ossl_config.o: ossl.h
ossl_config.o: ossl_asn1.h
ossl_config.o: ossl_bio.h
ossl_config.o: ossl_bn.h
ossl_config.o: ossl_cipher.h
ossl_config.o: ossl_config.c
ossl_config.o: ossl_config.h
ossl_config.o: ossl_digest.h
ossl_config.o: ossl_engine.h
ossl_config.o: ossl_hmac.h
ossl_config.o: ossl_kdf.h
ossl_config.o: ossl_ns_spki.h
ossl_config.o: ossl_ocsp.h
ossl_config.o: ossl_pkcs12.h
ossl_config.o: ossl_pkcs7.h
ossl_config.o: ossl_pkey.h
ossl_config.o: ossl_rand.h
ossl_config.o: ossl_ssl.h
ossl_config.o: ossl_version.h
ossl_config.o: ossl_x509.h
ossl_config.o: ruby_missing.h
ossl_digest.o: $(RUBY_EXTCONF_H)
ossl_digest.o: $(arch_hdrdir)/ruby/config.h
ossl_digest.o: $(hdrdir)/ruby/backward.h
ossl_digest.o: $(hdrdir)/ruby/defines.h
ossl_digest.o: $(hdrdir)/ruby/encoding.h
ossl_digest.o: $(hdrdir)/ruby/intern.h
ossl_digest.o: $(hdrdir)/ruby/io.h
ossl_digest.o: $(hdrdir)/ruby/missing.h
ossl_digest.o: $(hdrdir)/ruby/onigmo.h
ossl_digest.o: $(hdrdir)/ruby/oniguruma.h
ossl_digest.o: $(hdrdir)/ruby/ruby.h
ossl_digest.o: $(hdrdir)/ruby/st.h
ossl_digest.o: $(hdrdir)/ruby/subst.h
ossl_digest.o: $(hdrdir)/ruby/thread.h
ossl_digest.o: $(top_srcdir)/include/ruby.h
ossl_digest.o: openssl_missing.h
ossl_digest.o: ossl.h
ossl_digest.o: ossl_asn1.h
ossl_digest.o: ossl_bio.h
ossl_digest.o: ossl_bn.h
ossl_digest.o: ossl_cipher.h
ossl_digest.o: ossl_config.h
ossl_digest.o: ossl_digest.c
ossl_digest.o: ossl_digest.h
ossl_digest.o: ossl_engine.h
ossl_digest.o: ossl_hmac.h
ossl_digest.o: ossl_kdf.h
ossl_digest.o: ossl_ns_spki.h
ossl_digest.o: ossl_ocsp.h
ossl_digest.o: ossl_pkcs12.h
ossl_digest.o: ossl_pkcs7.h
ossl_digest.o: ossl_pkey.h
ossl_digest.o: ossl_rand.h
ossl_digest.o: ossl_ssl.h
ossl_digest.o: ossl_version.h
ossl_digest.o: ossl_x509.h
ossl_digest.o: ruby_missing.h
ossl_engine.o: $(RUBY_EXTCONF_H)
ossl_engine.o: $(arch_hdrdir)/ruby/config.h
ossl_engine.o: $(hdrdir)/ruby/backward.h
ossl_engine.o: $(hdrdir)/ruby/defines.h
ossl_engine.o: $(hdrdir)/ruby/encoding.h
ossl_engine.o: $(hdrdir)/ruby/intern.h
ossl_engine.o: $(hdrdir)/ruby/io.h
ossl_engine.o: $(hdrdir)/ruby/missing.h
ossl_engine.o: $(hdrdir)/ruby/onigmo.h
ossl_engine.o: $(hdrdir)/ruby/oniguruma.h
ossl_engine.o: $(hdrdir)/ruby/ruby.h
ossl_engine.o: $(hdrdir)/ruby/st.h
ossl_engine.o: $(hdrdir)/ruby/subst.h
ossl_engine.o: $(hdrdir)/ruby/thread.h
ossl_engine.o: $(top_srcdir)/include/ruby.h
ossl_engine.o: openssl_missing.h
ossl_engine.o: ossl.h
ossl_engine.o: ossl_asn1.h
ossl_engine.o: ossl_bio.h
ossl_engine.o: ossl_bn.h
ossl_engine.o: ossl_cipher.h
ossl_engine.o: ossl_config.h
ossl_engine.o: ossl_digest.h
ossl_engine.o: ossl_engine.c
ossl_engine.o: ossl_engine.h
ossl_engine.o: ossl_hmac.h
ossl_engine.o: ossl_kdf.h
ossl_engine.o: ossl_ns_spki.h
ossl_engine.o: ossl_ocsp.h
ossl_engine.o: ossl_pkcs12.h
ossl_engine.o: ossl_pkcs7.h
ossl_engine.o: ossl_pkey.h
ossl_engine.o: ossl_rand.h
ossl_engine.o: ossl_ssl.h
ossl_engine.o: ossl_version.h
ossl_engine.o: ossl_x509.h
ossl_engine.o: ruby_missing.h
ossl_hmac.o: $(RUBY_EXTCONF_H)
ossl_hmac.o: $(arch_hdrdir)/ruby/config.h
ossl_hmac.o: $(hdrdir)/ruby/backward.h
ossl_hmac.o: $(hdrdir)/ruby/defines.h
ossl_hmac.o: $(hdrdir)/ruby/encoding.h
ossl_hmac.o: $(hdrdir)/ruby/intern.h
ossl_hmac.o: $(hdrdir)/ruby/io.h
ossl_hmac.o: $(hdrdir)/ruby/missing.h
ossl_hmac.o: $(hdrdir)/ruby/onigmo.h
ossl_hmac.o: $(hdrdir)/ruby/oniguruma.h
ossl_hmac.o: $(hdrdir)/ruby/ruby.h
ossl_hmac.o: $(hdrdir)/ruby/st.h
ossl_hmac.o: $(hdrdir)/ruby/subst.h
ossl_hmac.o: $(hdrdir)/ruby/thread.h
ossl_hmac.o: $(top_srcdir)/include/ruby.h
ossl_hmac.o: openssl_missing.h
ossl_hmac.o: ossl.h
ossl_hmac.o: ossl_asn1.h
ossl_hmac.o: ossl_bio.h
ossl_hmac.o: ossl_bn.h
ossl_hmac.o: ossl_cipher.h
ossl_hmac.o: ossl_config.h
ossl_hmac.o: ossl_digest.h
ossl_hmac.o: ossl_engine.h
ossl_hmac.o: ossl_hmac.c
ossl_hmac.o: ossl_hmac.h
ossl_hmac.o: ossl_kdf.h
ossl_hmac.o: ossl_ns_spki.h
ossl_hmac.o: ossl_ocsp.h
ossl_hmac.o: ossl_pkcs12.h
ossl_hmac.o: ossl_pkcs7.h
ossl_hmac.o: ossl_pkey.h
ossl_hmac.o: ossl_rand.h
ossl_hmac.o: ossl_ssl.h
ossl_hmac.o: ossl_version.h
ossl_hmac.o: ossl_x509.h
ossl_hmac.o: ruby_missing.h
ossl_kdf.o: $(RUBY_EXTCONF_H)
ossl_kdf.o: $(arch_hdrdir)/ruby/config.h
ossl_kdf.o: $(hdrdir)/ruby/backward.h
ossl_kdf.o: $(hdrdir)/ruby/defines.h
ossl_kdf.o: $(hdrdir)/ruby/encoding.h
ossl_kdf.o: $(hdrdir)/ruby/intern.h
ossl_kdf.o: $(hdrdir)/ruby/io.h
ossl_kdf.o: $(hdrdir)/ruby/missing.h
ossl_kdf.o: $(hdrdir)/ruby/onigmo.h
ossl_kdf.o: $(hdrdir)/ruby/oniguruma.h
ossl_kdf.o: $(hdrdir)/ruby/ruby.h
ossl_kdf.o: $(hdrdir)/ruby/st.h
ossl_kdf.o: $(hdrdir)/ruby/subst.h
ossl_kdf.o: $(hdrdir)/ruby/thread.h
ossl_kdf.o: $(top_srcdir)/include/ruby.h
ossl_kdf.o: openssl_missing.h
ossl_kdf.o: ossl.h
ossl_kdf.o: ossl_asn1.h
ossl_kdf.o: ossl_bio.h
ossl_kdf.o: ossl_bn.h
ossl_kdf.o: ossl_cipher.h
ossl_kdf.o: ossl_config.h
ossl_kdf.o: ossl_digest.h
ossl_kdf.o: ossl_engine.h
ossl_kdf.o: ossl_hmac.h
ossl_kdf.o: ossl_kdf.c
ossl_kdf.o: ossl_kdf.h
ossl_kdf.o: ossl_ns_spki.h
ossl_kdf.o: ossl_ocsp.h
ossl_kdf.o: ossl_pkcs12.h
ossl_kdf.o: ossl_pkcs7.h
ossl_kdf.o: ossl_pkey.h
ossl_kdf.o: ossl_rand.h
ossl_kdf.o: ossl_ssl.h
ossl_kdf.o: ossl_version.h
ossl_kdf.o: ossl_x509.h
ossl_kdf.o: ruby_missing.h
ossl_ns_spki.o: $(RUBY_EXTCONF_H)
ossl_ns_spki.o: $(arch_hdrdir)/ruby/config.h
ossl_ns_spki.o: $(hdrdir)/ruby/backward.h
ossl_ns_spki.o: $(hdrdir)/ruby/defines.h
ossl_ns_spki.o: $(hdrdir)/ruby/encoding.h
ossl_ns_spki.o: $(hdrdir)/ruby/intern.h
ossl_ns_spki.o: $(hdrdir)/ruby/io.h
ossl_ns_spki.o: $(hdrdir)/ruby/missing.h
ossl_ns_spki.o: $(hdrdir)/ruby/onigmo.h
ossl_ns_spki.o: $(hdrdir)/ruby/oniguruma.h
ossl_ns_spki.o: $(hdrdir)/ruby/ruby.h
ossl_ns_spki.o: $(hdrdir)/ruby/st.h
ossl_ns_spki.o: $(hdrdir)/ruby/subst.h
ossl_ns_spki.o: $(hdrdir)/ruby/thread.h
ossl_ns_spki.o: $(top_srcdir)/include/ruby.h
ossl_ns_spki.o: openssl_missing.h
ossl_ns_spki.o: ossl.h
ossl_ns_spki.o: ossl_asn1.h
ossl_ns_spki.o: ossl_bio.h
ossl_ns_spki.o: ossl_bn.h
ossl_ns_spki.o: ossl_cipher.h
ossl_ns_spki.o: ossl_config.h
ossl_ns_spki.o: ossl_digest.h
ossl_ns_spki.o: ossl_engine.h
ossl_ns_spki.o: ossl_hmac.h
ossl_ns_spki.o: ossl_kdf.h
ossl_ns_spki.o: ossl_ns_spki.c
ossl_ns_spki.o: ossl_ns_spki.h
ossl_ns_spki.o: ossl_ocsp.h
ossl_ns_spki.o: ossl_pkcs12.h
ossl_ns_spki.o: ossl_pkcs7.h
ossl_ns_spki.o: ossl_pkey.h
ossl_ns_spki.o: ossl_rand.h
ossl_ns_spki.o: ossl_ssl.h
ossl_ns_spki.o: ossl_version.h
ossl_ns_spki.o: ossl_x509.h
ossl_ns_spki.o: ruby_missing.h
ossl_ocsp.o: $(RUBY_EXTCONF_H)
ossl_ocsp.o: $(arch_hdrdir)/ruby/config.h
ossl_ocsp.o: $(hdrdir)/ruby/backward.h
ossl_ocsp.o: $(hdrdir)/ruby/defines.h
ossl_ocsp.o: $(hdrdir)/ruby/encoding.h
ossl_ocsp.o: $(hdrdir)/ruby/intern.h
ossl_ocsp.o: $(hdrdir)/ruby/io.h
ossl_ocsp.o: $(hdrdir)/ruby/missing.h
ossl_ocsp.o: $(hdrdir)/ruby/onigmo.h
ossl_ocsp.o: $(hdrdir)/ruby/oniguruma.h
ossl_ocsp.o: $(hdrdir)/ruby/ruby.h
ossl_ocsp.o: $(hdrdir)/ruby/st.h
ossl_ocsp.o: $(hdrdir)/ruby/subst.h
ossl_ocsp.o: $(hdrdir)/ruby/thread.h
ossl_ocsp.o: $(top_srcdir)/include/ruby.h
ossl_ocsp.o: openssl_missing.h
ossl_ocsp.o: ossl.h
ossl_ocsp.o: ossl_asn1.h
ossl_ocsp.o: ossl_bio.h
ossl_ocsp.o: ossl_bn.h
ossl_ocsp.o: ossl_cipher.h
ossl_ocsp.o: ossl_config.h
ossl_ocsp.o: ossl_digest.h
ossl_ocsp.o: ossl_engine.h
ossl_ocsp.o: ossl_hmac.h
ossl_ocsp.o: ossl_kdf.h
ossl_ocsp.o: ossl_ns_spki.h
ossl_ocsp.o: ossl_ocsp.c
ossl_ocsp.o: ossl_ocsp.h
ossl_ocsp.o: ossl_pkcs12.h
ossl_ocsp.o: ossl_pkcs7.h
ossl_ocsp.o: ossl_pkey.h
ossl_ocsp.o: ossl_rand.h
ossl_ocsp.o: ossl_ssl.h
ossl_ocsp.o: ossl_version.h
ossl_ocsp.o: ossl_x509.h
ossl_ocsp.o: ruby_missing.h
ossl_pkcs12.o: $(RUBY_EXTCONF_H)
ossl_pkcs12.o: $(arch_hdrdir)/ruby/config.h
ossl_pkcs12.o: $(hdrdir)/ruby/backward.h
ossl_pkcs12.o: $(hdrdir)/ruby/defines.h
ossl_pkcs12.o: $(hdrdir)/ruby/encoding.h
ossl_pkcs12.o: $(hdrdir)/ruby/intern.h
ossl_pkcs12.o: $(hdrdir)/ruby/io.h
ossl_pkcs12.o: $(hdrdir)/ruby/missing.h
ossl_pkcs12.o: $(hdrdir)/ruby/onigmo.h
ossl_pkcs12.o: $(hdrdir)/ruby/oniguruma.h
ossl_pkcs12.o: $(hdrdir)/ruby/ruby.h
ossl_pkcs12.o: $(hdrdir)/ruby/st.h
ossl_pkcs12.o: $(hdrdir)/ruby/subst.h
ossl_pkcs12.o: $(hdrdir)/ruby/thread.h
ossl_pkcs12.o: $(top_srcdir)/include/ruby.h
ossl_pkcs12.o: openssl_missing.h
ossl_pkcs12.o: ossl.h
ossl_pkcs12.o: ossl_asn1.h
ossl_pkcs12.o: ossl_bio.h
ossl_pkcs12.o: ossl_bn.h
ossl_pkcs12.o: ossl_cipher.h
ossl_pkcs12.o: ossl_config.h
ossl_pkcs12.o: ossl_digest.h
ossl_pkcs12.o: ossl_engine.h
ossl_pkcs12.o: ossl_hmac.h
ossl_pkcs12.o: ossl_kdf.h
ossl_pkcs12.o: ossl_ns_spki.h
ossl_pkcs12.o: ossl_ocsp.h
ossl_pkcs12.o: ossl_pkcs12.c
ossl_pkcs12.o: ossl_pkcs12.h
ossl_pkcs12.o: ossl_pkcs7.h
ossl_pkcs12.o: ossl_pkey.h
ossl_pkcs12.o: ossl_rand.h
ossl_pkcs12.o: ossl_ssl.h
ossl_pkcs12.o: ossl_version.h
ossl_pkcs12.o: ossl_x509.h
ossl_pkcs12.o: ruby_missing.h
ossl_pkcs7.o: $(RUBY_EXTCONF_H)
ossl_pkcs7.o: $(arch_hdrdir)/ruby/config.h
ossl_pkcs7.o: $(hdrdir)/ruby/backward.h
ossl_pkcs7.o: $(hdrdir)/ruby/defines.h
ossl_pkcs7.o: $(hdrdir)/ruby/encoding.h
ossl_pkcs7.o: $(hdrdir)/ruby/intern.h
ossl_pkcs7.o: $(hdrdir)/ruby/io.h
ossl_pkcs7.o: $(hdrdir)/ruby/missing.h
ossl_pkcs7.o: $(hdrdir)/ruby/onigmo.h
ossl_pkcs7.o: $(hdrdir)/ruby/oniguruma.h
ossl_pkcs7.o: $(hdrdir)/ruby/ruby.h
ossl_pkcs7.o: $(hdrdir)/ruby/st.h
ossl_pkcs7.o: $(hdrdir)/ruby/subst.h
ossl_pkcs7.o: $(hdrdir)/ruby/thread.h
ossl_pkcs7.o: $(top_srcdir)/include/ruby.h
ossl_pkcs7.o: openssl_missing.h
ossl_pkcs7.o: ossl.h
ossl_pkcs7.o: ossl_asn1.h
ossl_pkcs7.o: ossl_bio.h
ossl_pkcs7.o: ossl_bn.h
ossl_pkcs7.o: ossl_cipher.h
ossl_pkcs7.o: ossl_config.h
ossl_pkcs7.o: ossl_digest.h
ossl_pkcs7.o: ossl_engine.h
ossl_pkcs7.o: ossl_hmac.h
ossl_pkcs7.o: ossl_kdf.h
ossl_pkcs7.o: ossl_ns_spki.h
ossl_pkcs7.o: ossl_ocsp.h
ossl_pkcs7.o: ossl_pkcs12.h
ossl_pkcs7.o: ossl_pkcs7.c
ossl_pkcs7.o: ossl_pkcs7.h
ossl_pkcs7.o: ossl_pkey.h
ossl_pkcs7.o: ossl_rand.h
ossl_pkcs7.o: ossl_ssl.h
ossl_pkcs7.o: ossl_version.h
ossl_pkcs7.o: ossl_x509.h
ossl_pkcs7.o: ruby_missing.h
ossl_pkey.o: $(RUBY_EXTCONF_H)
ossl_pkey.o: $(arch_hdrdir)/ruby/config.h
ossl_pkey.o: $(hdrdir)/ruby/backward.h
ossl_pkey.o: $(hdrdir)/ruby/defines.h
ossl_pkey.o: $(hdrdir)/ruby/encoding.h
ossl_pkey.o: $(hdrdir)/ruby/intern.h
ossl_pkey.o: $(hdrdir)/ruby/io.h
ossl_pkey.o: $(hdrdir)/ruby/missing.h
ossl_pkey.o: $(hdrdir)/ruby/onigmo.h
ossl_pkey.o: $(hdrdir)/ruby/oniguruma.h
ossl_pkey.o: $(hdrdir)/ruby/ruby.h
ossl_pkey.o: $(hdrdir)/ruby/st.h
ossl_pkey.o: $(hdrdir)/ruby/subst.h
ossl_pkey.o: $(hdrdir)/ruby/thread.h
ossl_pkey.o: $(top_srcdir)/include/ruby.h
ossl_pkey.o: openssl_missing.h
ossl_pkey.o: ossl.h
ossl_pkey.o: ossl_asn1.h
ossl_pkey.o: ossl_bio.h
ossl_pkey.o: ossl_bn.h
ossl_pkey.o: ossl_cipher.h
ossl_pkey.o: ossl_config.h
ossl_pkey.o: ossl_digest.h
ossl_pkey.o: ossl_engine.h
ossl_pkey.o: ossl_hmac.h
ossl_pkey.o: ossl_kdf.h
ossl_pkey.o: ossl_ns_spki.h
ossl_pkey.o: ossl_ocsp.h
ossl_pkey.o: ossl_pkcs12.h
ossl_pkey.o: ossl_pkcs7.h
ossl_pkey.o: ossl_pkey.c
ossl_pkey.o: ossl_pkey.h
ossl_pkey.o: ossl_rand.h
ossl_pkey.o: ossl_ssl.h
ossl_pkey.o: ossl_version.h
ossl_pkey.o: ossl_x509.h
ossl_pkey.o: ruby_missing.h
ossl_pkey_dh.o: $(RUBY_EXTCONF_H)
ossl_pkey_dh.o: $(arch_hdrdir)/ruby/config.h
ossl_pkey_dh.o: $(hdrdir)/ruby/backward.h
ossl_pkey_dh.o: $(hdrdir)/ruby/defines.h
ossl_pkey_dh.o: $(hdrdir)/ruby/encoding.h
ossl_pkey_dh.o: $(hdrdir)/ruby/intern.h
ossl_pkey_dh.o: $(hdrdir)/ruby/io.h
ossl_pkey_dh.o: $(hdrdir)/ruby/missing.h
ossl_pkey_dh.o: $(hdrdir)/ruby/onigmo.h
ossl_pkey_dh.o: $(hdrdir)/ruby/oniguruma.h
ossl_pkey_dh.o: $(hdrdir)/ruby/ruby.h
ossl_pkey_dh.o: $(hdrdir)/ruby/st.h
ossl_pkey_dh.o: $(hdrdir)/ruby/subst.h
ossl_pkey_dh.o: $(hdrdir)/ruby/thread.h
ossl_pkey_dh.o: $(top_srcdir)/include/ruby.h
ossl_pkey_dh.o: openssl_missing.h
ossl_pkey_dh.o: ossl.h
ossl_pkey_dh.o: ossl_asn1.h
ossl_pkey_dh.o: ossl_bio.h
ossl_pkey_dh.o: ossl_bn.h
ossl_pkey_dh.o: ossl_cipher.h
ossl_pkey_dh.o: ossl_config.h
ossl_pkey_dh.o: ossl_digest.h
ossl_pkey_dh.o: ossl_engine.h
ossl_pkey_dh.o: ossl_hmac.h
ossl_pkey_dh.o: ossl_kdf.h
ossl_pkey_dh.o: ossl_ns_spki.h
ossl_pkey_dh.o: ossl_ocsp.h
ossl_pkey_dh.o: ossl_pkcs12.h
ossl_pkey_dh.o: ossl_pkcs7.h
ossl_pkey_dh.o: ossl_pkey.h
ossl_pkey_dh.o: ossl_pkey_dh.c
ossl_pkey_dh.o: ossl_rand.h
ossl_pkey_dh.o: ossl_ssl.h
ossl_pkey_dh.o: ossl_version.h
ossl_pkey_dh.o: ossl_x509.h
ossl_pkey_dh.o: ruby_missing.h
ossl_pkey_dsa.o: $(RUBY_EXTCONF_H)
ossl_pkey_dsa.o: $(arch_hdrdir)/ruby/config.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/backward.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/defines.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/encoding.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/intern.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/io.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/missing.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/onigmo.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/oniguruma.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/ruby.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/st.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/subst.h
ossl_pkey_dsa.o: $(hdrdir)/ruby/thread.h
ossl_pkey_dsa.o: $(top_srcdir)/include/ruby.h
ossl_pkey_dsa.o: openssl_missing.h
ossl_pkey_dsa.o: ossl.h
ossl_pkey_dsa.o: ossl_asn1.h
ossl_pkey_dsa.o: ossl_bio.h
ossl_pkey_dsa.o: ossl_bn.h
ossl_pkey_dsa.o: ossl_cipher.h
ossl_pkey_dsa.o: ossl_config.h
ossl_pkey_dsa.o: ossl_digest.h
ossl_pkey_dsa.o: ossl_engine.h
ossl_pkey_dsa.o: ossl_hmac.h
ossl_pkey_dsa.o: ossl_kdf.h
ossl_pkey_dsa.o: ossl_ns_spki.h
ossl_pkey_dsa.o: ossl_ocsp.h
ossl_pkey_dsa.o: ossl_pkcs12.h
ossl_pkey_dsa.o: ossl_pkcs7.h
ossl_pkey_dsa.o: ossl_pkey.h
ossl_pkey_dsa.o: ossl_pkey_dsa.c
ossl_pkey_dsa.o: ossl_rand.h
ossl_pkey_dsa.o: ossl_ssl.h
ossl_pkey_dsa.o: ossl_version.h
ossl_pkey_dsa.o: ossl_x509.h
ossl_pkey_dsa.o: ruby_missing.h
ossl_pkey_ec.o: $(RUBY_EXTCONF_H)
ossl_pkey_ec.o: $(arch_hdrdir)/ruby/config.h
ossl_pkey_ec.o: $(hdrdir)/ruby/backward.h
ossl_pkey_ec.o: $(hdrdir)/ruby/defines.h
ossl_pkey_ec.o: $(hdrdir)/ruby/encoding.h
ossl_pkey_ec.o: $(hdrdir)/ruby/intern.h
ossl_pkey_ec.o: $(hdrdir)/ruby/io.h
ossl_pkey_ec.o: $(hdrdir)/ruby/missing.h
ossl_pkey_ec.o: $(hdrdir)/ruby/onigmo.h
ossl_pkey_ec.o: $(hdrdir)/ruby/oniguruma.h
ossl_pkey_ec.o: $(hdrdir)/ruby/ruby.h
ossl_pkey_ec.o: $(hdrdir)/ruby/st.h
ossl_pkey_ec.o: $(hdrdir)/ruby/subst.h
ossl_pkey_ec.o: $(hdrdir)/ruby/thread.h
ossl_pkey_ec.o: $(top_srcdir)/include/ruby.h
ossl_pkey_ec.o: openssl_missing.h
ossl_pkey_ec.o: ossl.h
ossl_pkey_ec.o: ossl_asn1.h
ossl_pkey_ec.o: ossl_bio.h
ossl_pkey_ec.o: ossl_bn.h
ossl_pkey_ec.o: ossl_cipher.h
ossl_pkey_ec.o: ossl_config.h
ossl_pkey_ec.o: ossl_digest.h
ossl_pkey_ec.o: ossl_engine.h
ossl_pkey_ec.o: ossl_hmac.h
ossl_pkey_ec.o: ossl_kdf.h
ossl_pkey_ec.o: ossl_ns_spki.h
ossl_pkey_ec.o: ossl_ocsp.h
ossl_pkey_ec.o: ossl_pkcs12.h
ossl_pkey_ec.o: ossl_pkcs7.h
ossl_pkey_ec.o: ossl_pkey.h
ossl_pkey_ec.o: ossl_pkey_ec.c
ossl_pkey_ec.o: ossl_rand.h
ossl_pkey_ec.o: ossl_ssl.h
ossl_pkey_ec.o: ossl_version.h
ossl_pkey_ec.o: ossl_x509.h
ossl_pkey_ec.o: ruby_missing.h
ossl_pkey_rsa.o: $(RUBY_EXTCONF_H)
ossl_pkey_rsa.o: $(arch_hdrdir)/ruby/config.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/backward.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/defines.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/encoding.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/intern.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/io.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/missing.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/onigmo.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/oniguruma.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/ruby.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/st.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/subst.h
ossl_pkey_rsa.o: $(hdrdir)/ruby/thread.h
ossl_pkey_rsa.o: $(top_srcdir)/include/ruby.h
ossl_pkey_rsa.o: openssl_missing.h
ossl_pkey_rsa.o: ossl.h
ossl_pkey_rsa.o: ossl_asn1.h
ossl_pkey_rsa.o: ossl_bio.h
ossl_pkey_rsa.o: ossl_bn.h
ossl_pkey_rsa.o: ossl_cipher.h
ossl_pkey_rsa.o: ossl_config.h
ossl_pkey_rsa.o: ossl_digest.h
ossl_pkey_rsa.o: ossl_engine.h
ossl_pkey_rsa.o: ossl_hmac.h
ossl_pkey_rsa.o: ossl_kdf.h
ossl_pkey_rsa.o: ossl_ns_spki.h
ossl_pkey_rsa.o: ossl_ocsp.h
ossl_pkey_rsa.o: ossl_pkcs12.h
ossl_pkey_rsa.o: ossl_pkcs7.h
ossl_pkey_rsa.o: ossl_pkey.h
ossl_pkey_rsa.o: ossl_pkey_rsa.c
ossl_pkey_rsa.o: ossl_rand.h
ossl_pkey_rsa.o: ossl_ssl.h
ossl_pkey_rsa.o: ossl_version.h
ossl_pkey_rsa.o: ossl_x509.h
ossl_pkey_rsa.o: ruby_missing.h
ossl_rand.o: $(RUBY_EXTCONF_H)
ossl_rand.o: $(arch_hdrdir)/ruby/config.h
ossl_rand.o: $(hdrdir)/ruby/backward.h
ossl_rand.o: $(hdrdir)/ruby/defines.h
ossl_rand.o: $(hdrdir)/ruby/encoding.h
ossl_rand.o: $(hdrdir)/ruby/intern.h
ossl_rand.o: $(hdrdir)/ruby/io.h
ossl_rand.o: $(hdrdir)/ruby/missing.h
ossl_rand.o: $(hdrdir)/ruby/onigmo.h
ossl_rand.o: $(hdrdir)/ruby/oniguruma.h
ossl_rand.o: $(hdrdir)/ruby/ruby.h
ossl_rand.o: $(hdrdir)/ruby/st.h
ossl_rand.o: $(hdrdir)/ruby/subst.h
ossl_rand.o: $(hdrdir)/ruby/thread.h
ossl_rand.o: $(top_srcdir)/include/ruby.h
ossl_rand.o: openssl_missing.h
ossl_rand.o: ossl.h
ossl_rand.o: ossl_asn1.h
ossl_rand.o: ossl_bio.h
ossl_rand.o: ossl_bn.h
ossl_rand.o: ossl_cipher.h
ossl_rand.o: ossl_config.h
ossl_rand.o: ossl_digest.h
ossl_rand.o: ossl_engine.h
ossl_rand.o: ossl_hmac.h
ossl_rand.o: ossl_kdf.h
ossl_rand.o: ossl_ns_spki.h
ossl_rand.o: ossl_ocsp.h
ossl_rand.o: ossl_pkcs12.h
ossl_rand.o: ossl_pkcs7.h
ossl_rand.o: ossl_pkey.h
ossl_rand.o: ossl_rand.c
ossl_rand.o: ossl_rand.h
ossl_rand.o: ossl_ssl.h
ossl_rand.o: ossl_version.h
ossl_rand.o: ossl_x509.h
ossl_rand.o: ruby_missing.h
ossl_ssl.o: $(RUBY_EXTCONF_H)
ossl_ssl.o: $(arch_hdrdir)/ruby/config.h
ossl_ssl.o: $(hdrdir)/ruby/backward.h
ossl_ssl.o: $(hdrdir)/ruby/defines.h
ossl_ssl.o: $(hdrdir)/ruby/encoding.h
ossl_ssl.o: $(hdrdir)/ruby/intern.h
ossl_ssl.o: $(hdrdir)/ruby/io.h
ossl_ssl.o: $(hdrdir)/ruby/missing.h
ossl_ssl.o: $(hdrdir)/ruby/onigmo.h
ossl_ssl.o: $(hdrdir)/ruby/oniguruma.h
ossl_ssl.o: $(hdrdir)/ruby/ruby.h
ossl_ssl.o: $(hdrdir)/ruby/st.h
ossl_ssl.o: $(hdrdir)/ruby/subst.h
ossl_ssl.o: $(hdrdir)/ruby/thread.h
ossl_ssl.o: $(top_srcdir)/include/ruby.h
ossl_ssl.o: openssl_missing.h
ossl_ssl.o: ossl.h
ossl_ssl.o: ossl_asn1.h
ossl_ssl.o: ossl_bio.h
ossl_ssl.o: ossl_bn.h
ossl_ssl.o: ossl_cipher.h
ossl_ssl.o: ossl_config.h
ossl_ssl.o: ossl_digest.h
ossl_ssl.o: ossl_engine.h
ossl_ssl.o: ossl_hmac.h
ossl_ssl.o: ossl_kdf.h
ossl_ssl.o: ossl_ns_spki.h
ossl_ssl.o: ossl_ocsp.h
ossl_ssl.o: ossl_pkcs12.h
ossl_ssl.o: ossl_pkcs7.h
ossl_ssl.o: ossl_pkey.h
ossl_ssl.o: ossl_rand.h
ossl_ssl.o: ossl_ssl.c
ossl_ssl.o: ossl_ssl.h
ossl_ssl.o: ossl_version.h
ossl_ssl.o: ossl_x509.h
ossl_ssl.o: ruby_missing.h
ossl_ssl_session.o: $(RUBY_EXTCONF_H)
ossl_ssl_session.o: $(arch_hdrdir)/ruby/config.h
ossl_ssl_session.o: $(hdrdir)/ruby/backward.h
ossl_ssl_session.o: $(hdrdir)/ruby/defines.h
ossl_ssl_session.o: $(hdrdir)/ruby/encoding.h
ossl_ssl_session.o: $(hdrdir)/ruby/intern.h
ossl_ssl_session.o: $(hdrdir)/ruby/io.h
ossl_ssl_session.o: $(hdrdir)/ruby/missing.h
ossl_ssl_session.o: $(hdrdir)/ruby/onigmo.h
ossl_ssl_session.o: $(hdrdir)/ruby/oniguruma.h
ossl_ssl_session.o: $(hdrdir)/ruby/ruby.h
ossl_ssl_session.o: $(hdrdir)/ruby/st.h
ossl_ssl_session.o: $(hdrdir)/ruby/subst.h
ossl_ssl_session.o: $(hdrdir)/ruby/thread.h
ossl_ssl_session.o: $(top_srcdir)/include/ruby.h
ossl_ssl_session.o: openssl_missing.h
ossl_ssl_session.o: ossl.h
ossl_ssl_session.o: ossl_asn1.h
ossl_ssl_session.o: ossl_bio.h
ossl_ssl_session.o: ossl_bn.h
ossl_ssl_session.o: ossl_cipher.h
ossl_ssl_session.o: ossl_config.h
ossl_ssl_session.o: ossl_digest.h
ossl_ssl_session.o: ossl_engine.h
ossl_ssl_session.o: ossl_hmac.h
ossl_ssl_session.o: ossl_kdf.h
ossl_ssl_session.o: ossl_ns_spki.h
ossl_ssl_session.o: ossl_ocsp.h
ossl_ssl_session.o: ossl_pkcs12.h
ossl_ssl_session.o: ossl_pkcs7.h
ossl_ssl_session.o: ossl_pkey.h
ossl_ssl_session.o: ossl_rand.h
ossl_ssl_session.o: ossl_ssl.h
ossl_ssl_session.o: ossl_ssl_session.c
ossl_ssl_session.o: ossl_version.h
ossl_ssl_session.o: ossl_x509.h
ossl_ssl_session.o: ruby_missing.h
ossl_x509.o: $(RUBY_EXTCONF_H)
ossl_x509.o: $(arch_hdrdir)/ruby/config.h
ossl_x509.o: $(hdrdir)/ruby/backward.h
ossl_x509.o: $(hdrdir)/ruby/defines.h
ossl_x509.o: $(hdrdir)/ruby/encoding.h
ossl_x509.o: $(hdrdir)/ruby/intern.h
ossl_x509.o: $(hdrdir)/ruby/io.h
ossl_x509.o: $(hdrdir)/ruby/missing.h
ossl_x509.o: $(hdrdir)/ruby/onigmo.h
ossl_x509.o: $(hdrdir)/ruby/oniguruma.h
ossl_x509.o: $(hdrdir)/ruby/ruby.h
ossl_x509.o: $(hdrdir)/ruby/st.h
ossl_x509.o: $(hdrdir)/ruby/subst.h
ossl_x509.o: $(hdrdir)/ruby/thread.h
ossl_x509.o: $(top_srcdir)/include/ruby.h
ossl_x509.o: openssl_missing.h
ossl_x509.o: ossl.h
ossl_x509.o: ossl_asn1.h
ossl_x509.o: ossl_bio.h
ossl_x509.o: ossl_bn.h
ossl_x509.o: ossl_cipher.h
ossl_x509.o: ossl_config.h
ossl_x509.o: ossl_digest.h
ossl_x509.o: ossl_engine.h
ossl_x509.o: ossl_hmac.h
ossl_x509.o: ossl_kdf.h
ossl_x509.o: ossl_ns_spki.h
ossl_x509.o: ossl_ocsp.h
ossl_x509.o: ossl_pkcs12.h
ossl_x509.o: ossl_pkcs7.h
ossl_x509.o: ossl_pkey.h
ossl_x509.o: ossl_rand.h
ossl_x509.o: ossl_ssl.h
ossl_x509.o: ossl_version.h
ossl_x509.o: ossl_x509.c
ossl_x509.o: ossl_x509.h
ossl_x509.o: ruby_missing.h
ossl_x509attr.o: $(RUBY_EXTCONF_H)
ossl_x509attr.o: $(arch_hdrdir)/ruby/config.h
ossl_x509attr.o: $(hdrdir)/ruby/backward.h
ossl_x509attr.o: $(hdrdir)/ruby/defines.h
ossl_x509attr.o: $(hdrdir)/ruby/encoding.h
ossl_x509attr.o: $(hdrdir)/ruby/intern.h
ossl_x509attr.o: $(hdrdir)/ruby/io.h
ossl_x509attr.o: $(hdrdir)/ruby/missing.h
ossl_x509attr.o: $(hdrdir)/ruby/onigmo.h
ossl_x509attr.o: $(hdrdir)/ruby/oniguruma.h
ossl_x509attr.o: $(hdrdir)/ruby/ruby.h
ossl_x509attr.o: $(hdrdir)/ruby/st.h
ossl_x509attr.o: $(hdrdir)/ruby/subst.h
ossl_x509attr.o: $(hdrdir)/ruby/thread.h
ossl_x509attr.o: $(top_srcdir)/include/ruby.h
ossl_x509attr.o: openssl_missing.h
ossl_x509attr.o: ossl.h
ossl_x509attr.o: ossl_asn1.h
ossl_x509attr.o: ossl_bio.h
ossl_x509attr.o: ossl_bn.h
ossl_x509attr.o: ossl_cipher.h
ossl_x509attr.o: ossl_config.h
ossl_x509attr.o: ossl_digest.h
ossl_x509attr.o: ossl_engine.h
ossl_x509attr.o: ossl_hmac.h
ossl_x509attr.o: ossl_kdf.h
ossl_x509attr.o: ossl_ns_spki.h
ossl_x509attr.o: ossl_ocsp.h
ossl_x509attr.o: ossl_pkcs12.h
ossl_x509attr.o: ossl_pkcs7.h
ossl_x509attr.o: ossl_pkey.h
ossl_x509attr.o: ossl_rand.h
ossl_x509attr.o: ossl_ssl.h
ossl_x509attr.o: ossl_version.h
ossl_x509attr.o: ossl_x509.h
ossl_x509attr.o: ossl_x509attr.c
ossl_x509attr.o: ruby_missing.h
ossl_x509cert.o: $(RUBY_EXTCONF_H)
ossl_x509cert.o: $(arch_hdrdir)/ruby/config.h
ossl_x509cert.o: $(hdrdir)/ruby/backward.h
ossl_x509cert.o: $(hdrdir)/ruby/defines.h
ossl_x509cert.o: $(hdrdir)/ruby/encoding.h
ossl_x509cert.o: $(hdrdir)/ruby/intern.h
ossl_x509cert.o: $(hdrdir)/ruby/io.h
ossl_x509cert.o: $(hdrdir)/ruby/missing.h
ossl_x509cert.o: $(hdrdir)/ruby/onigmo.h
ossl_x509cert.o: $(hdrdir)/ruby/oniguruma.h
ossl_x509cert.o: $(hdrdir)/ruby/ruby.h
ossl_x509cert.o: $(hdrdir)/ruby/st.h
ossl_x509cert.o: $(hdrdir)/ruby/subst.h
ossl_x509cert.o: $(hdrdir)/ruby/thread.h
ossl_x509cert.o: $(top_srcdir)/include/ruby.h
ossl_x509cert.o: openssl_missing.h
ossl_x509cert.o: ossl.h
ossl_x509cert.o: ossl_asn1.h
ossl_x509cert.o: ossl_bio.h
ossl_x509cert.o: ossl_bn.h
ossl_x509cert.o: ossl_cipher.h
ossl_x509cert.o: ossl_config.h
ossl_x509cert.o: ossl_digest.h
ossl_x509cert.o: ossl_engine.h
ossl_x509cert.o: ossl_hmac.h
ossl_x509cert.o: ossl_kdf.h
ossl_x509cert.o: ossl_ns_spki.h
ossl_x509cert.o: ossl_ocsp.h
ossl_x509cert.o: ossl_pkcs12.h
ossl_x509cert.o: ossl_pkcs7.h
ossl_x509cert.o: ossl_pkey.h
ossl_x509cert.o: ossl_rand.h
ossl_x509cert.o: ossl_ssl.h
ossl_x509cert.o: ossl_version.h
ossl_x509cert.o: ossl_x509.h
ossl_x509cert.o: ossl_x509cert.c
ossl_x509cert.o: ruby_missing.h
ossl_x509crl.o: $(RUBY_EXTCONF_H)
ossl_x509crl.o: $(arch_hdrdir)/ruby/config.h
ossl_x509crl.o: $(hdrdir)/ruby/backward.h
ossl_x509crl.o: $(hdrdir)/ruby/defines.h
ossl_x509crl.o: $(hdrdir)/ruby/encoding.h
ossl_x509crl.o: $(hdrdir)/ruby/intern.h
ossl_x509crl.o: $(hdrdir)/ruby/io.h
ossl_x509crl.o: $(hdrdir)/ruby/missing.h
ossl_x509crl.o: $(hdrdir)/ruby/onigmo.h
ossl_x509crl.o: $(hdrdir)/ruby/oniguruma.h
ossl_x509crl.o: $(hdrdir)/ruby/ruby.h
ossl_x509crl.o: $(hdrdir)/ruby/st.h
ossl_x509crl.o: $(hdrdir)/ruby/subst.h
ossl_x509crl.o: $(hdrdir)/ruby/thread.h
ossl_x509crl.o: $(top_srcdir)/include/ruby.h
ossl_x509crl.o: openssl_missing.h
ossl_x509crl.o: ossl.h
ossl_x509crl.o: ossl_asn1.h
ossl_x509crl.o: ossl_bio.h
ossl_x509crl.o: ossl_bn.h
ossl_x509crl.o: ossl_cipher.h
ossl_x509crl.o: ossl_config.h
ossl_x509crl.o: ossl_digest.h
ossl_x509crl.o: ossl_engine.h
ossl_x509crl.o: ossl_hmac.h
ossl_x509crl.o: ossl_kdf.h
ossl_x509crl.o: ossl_ns_spki.h
ossl_x509crl.o: ossl_ocsp.h
ossl_x509crl.o: ossl_pkcs12.h
ossl_x509crl.o: ossl_pkcs7.h
ossl_x509crl.o: ossl_pkey.h
ossl_x509crl.o: ossl_rand.h
ossl_x509crl.o: ossl_ssl.h
ossl_x509crl.o: ossl_version.h
ossl_x509crl.o: ossl_x509.h
ossl_x509crl.o: ossl_x509crl.c
ossl_x509crl.o: ruby_missing.h
ossl_x509ext.o: $(RUBY_EXTCONF_H)
ossl_x509ext.o: $(arch_hdrdir)/ruby/config.h
ossl_x509ext.o: $(hdrdir)/ruby/backward.h
ossl_x509ext.o: $(hdrdir)/ruby/defines.h
ossl_x509ext.o: $(hdrdir)/ruby/encoding.h
ossl_x509ext.o: $(hdrdir)/ruby/intern.h
ossl_x509ext.o: $(hdrdir)/ruby/io.h
ossl_x509ext.o: $(hdrdir)/ruby/missing.h
ossl_x509ext.o: $(hdrdir)/ruby/onigmo.h
ossl_x509ext.o: $(hdrdir)/ruby/oniguruma.h
ossl_x509ext.o: $(hdrdir)/ruby/ruby.h
ossl_x509ext.o: $(hdrdir)/ruby/st.h
ossl_x509ext.o: $(hdrdir)/ruby/subst.h
ossl_x509ext.o: $(hdrdir)/ruby/thread.h
ossl_x509ext.o: $(top_srcdir)/include/ruby.h
ossl_x509ext.o: openssl_missing.h
ossl_x509ext.o: ossl.h
ossl_x509ext.o: ossl_asn1.h
ossl_x509ext.o: ossl_bio.h
ossl_x509ext.o: ossl_bn.h
ossl_x509ext.o: ossl_cipher.h
ossl_x509ext.o: ossl_config.h
ossl_x509ext.o: ossl_digest.h
ossl_x509ext.o: ossl_engine.h
ossl_x509ext.o: ossl_hmac.h
ossl_x509ext.o: ossl_kdf.h
ossl_x509ext.o: ossl_ns_spki.h
ossl_x509ext.o: ossl_ocsp.h
ossl_x509ext.o: ossl_pkcs12.h
ossl_x509ext.o: ossl_pkcs7.h
ossl_x509ext.o: ossl_pkey.h
ossl_x509ext.o: ossl_rand.h
ossl_x509ext.o: ossl_ssl.h
ossl_x509ext.o: ossl_version.h
ossl_x509ext.o: ossl_x509.h
ossl_x509ext.o: ossl_x509ext.c
ossl_x509ext.o: ruby_missing.h
ossl_x509name.o: $(RUBY_EXTCONF_H)
ossl_x509name.o: $(arch_hdrdir)/ruby/config.h
ossl_x509name.o: $(hdrdir)/ruby/backward.h
ossl_x509name.o: $(hdrdir)/ruby/defines.h
ossl_x509name.o: $(hdrdir)/ruby/encoding.h
ossl_x509name.o: $(hdrdir)/ruby/intern.h
ossl_x509name.o: $(hdrdir)/ruby/io.h
ossl_x509name.o: $(hdrdir)/ruby/missing.h
ossl_x509name.o: $(hdrdir)/ruby/onigmo.h
ossl_x509name.o: $(hdrdir)/ruby/oniguruma.h
ossl_x509name.o: $(hdrdir)/ruby/ruby.h
ossl_x509name.o: $(hdrdir)/ruby/st.h
ossl_x509name.o: $(hdrdir)/ruby/subst.h
ossl_x509name.o: $(hdrdir)/ruby/thread.h
ossl_x509name.o: $(top_srcdir)/include/ruby.h
ossl_x509name.o: openssl_missing.h
ossl_x509name.o: ossl.h
ossl_x509name.o: ossl_asn1.h
ossl_x509name.o: ossl_bio.h
ossl_x509name.o: ossl_bn.h
ossl_x509name.o: ossl_cipher.h
ossl_x509name.o: ossl_config.h
ossl_x509name.o: ossl_digest.h
ossl_x509name.o: ossl_engine.h
ossl_x509name.o: ossl_hmac.h
ossl_x509name.o: ossl_kdf.h
ossl_x509name.o: ossl_ns_spki.h
ossl_x509name.o: ossl_ocsp.h
ossl_x509name.o: ossl_pkcs12.h
ossl_x509name.o: ossl_pkcs7.h
ossl_x509name.o: ossl_pkey.h
ossl_x509name.o: ossl_rand.h
ossl_x509name.o: ossl_ssl.h
ossl_x509name.o: ossl_version.h
ossl_x509name.o: ossl_x509.h
ossl_x509name.o: ossl_x509name.c
ossl_x509name.o: ruby_missing.h
ossl_x509req.o: $(RUBY_EXTCONF_H)
ossl_x509req.o: $(arch_hdrdir)/ruby/config.h
ossl_x509req.o: $(hdrdir)/ruby/backward.h
ossl_x509req.o: $(hdrdir)/ruby/defines.h
ossl_x509req.o: $(hdrdir)/ruby/encoding.h
ossl_x509req.o: $(hdrdir)/ruby/intern.h
ossl_x509req.o: $(hdrdir)/ruby/io.h
ossl_x509req.o: $(hdrdir)/ruby/missing.h
ossl_x509req.o: $(hdrdir)/ruby/onigmo.h
ossl_x509req.o: $(hdrdir)/ruby/oniguruma.h
ossl_x509req.o: $(hdrdir)/ruby/ruby.h
ossl_x509req.o: $(hdrdir)/ruby/st.h
ossl_x509req.o: $(hdrdir)/ruby/subst.h
ossl_x509req.o: $(hdrdir)/ruby/thread.h
ossl_x509req.o: $(top_srcdir)/include/ruby.h
ossl_x509req.o: openssl_missing.h
ossl_x509req.o: ossl.h
ossl_x509req.o: ossl_asn1.h
ossl_x509req.o: ossl_bio.h
ossl_x509req.o: ossl_bn.h
ossl_x509req.o: ossl_cipher.h
ossl_x509req.o: ossl_config.h
ossl_x509req.o: ossl_digest.h
ossl_x509req.o: ossl_engine.h
ossl_x509req.o: ossl_hmac.h
ossl_x509req.o: ossl_kdf.h
ossl_x509req.o: ossl_ns_spki.h
ossl_x509req.o: ossl_ocsp.h
ossl_x509req.o: ossl_pkcs12.h
ossl_x509req.o: ossl_pkcs7.h
ossl_x509req.o: ossl_pkey.h
ossl_x509req.o: ossl_rand.h
ossl_x509req.o: ossl_ssl.h
ossl_x509req.o: ossl_version.h
ossl_x509req.o: ossl_x509.h
ossl_x509req.o: ossl_x509req.c
ossl_x509req.o: ruby_missing.h
ossl_x509revoked.o: $(RUBY_EXTCONF_H)
ossl_x509revoked.o: $(arch_hdrdir)/ruby/config.h
ossl_x509revoked.o: $(hdrdir)/ruby/backward.h
ossl_x509revoked.o: $(hdrdir)/ruby/defines.h
ossl_x509revoked.o: $(hdrdir)/ruby/encoding.h
ossl_x509revoked.o: $(hdrdir)/ruby/intern.h
ossl_x509revoked.o: $(hdrdir)/ruby/io.h
ossl_x509revoked.o: $(hdrdir)/ruby/missing.h
ossl_x509revoked.o: $(hdrdir)/ruby/onigmo.h
ossl_x509revoked.o: $(hdrdir)/ruby/oniguruma.h
ossl_x509revoked.o: $(hdrdir)/ruby/ruby.h
ossl_x509revoked.o: $(hdrdir)/ruby/st.h
ossl_x509revoked.o: $(hdrdir)/ruby/subst.h
ossl_x509revoked.o: $(hdrdir)/ruby/thread.h
ossl_x509revoked.o: $(top_srcdir)/include/ruby.h
ossl_x509revoked.o: openssl_missing.h
ossl_x509revoked.o: ossl.h
ossl_x509revoked.o: ossl_asn1.h
ossl_x509revoked.o: ossl_bio.h
ossl_x509revoked.o: ossl_bn.h
ossl_x509revoked.o: ossl_cipher.h
ossl_x509revoked.o: ossl_config.h
ossl_x509revoked.o: ossl_digest.h
ossl_x509revoked.o: ossl_engine.h
ossl_x509revoked.o: ossl_hmac.h
ossl_x509revoked.o: ossl_kdf.h
ossl_x509revoked.o: ossl_ns_spki.h
ossl_x509revoked.o: ossl_ocsp.h
ossl_x509revoked.o: ossl_pkcs12.h
ossl_x509revoked.o: ossl_pkcs7.h
ossl_x509revoked.o: ossl_pkey.h
ossl_x509revoked.o: ossl_rand.h
ossl_x509revoked.o: ossl_ssl.h
ossl_x509revoked.o: ossl_version.h
ossl_x509revoked.o: ossl_x509.h
ossl_x509revoked.o: ossl_x509revoked.c
ossl_x509revoked.o: ruby_missing.h
ossl_x509store.o: $(RUBY_EXTCONF_H)
ossl_x509store.o: $(arch_hdrdir)/ruby/config.h
ossl_x509store.o: $(hdrdir)/ruby/backward.h
ossl_x509store.o: $(hdrdir)/ruby/defines.h
ossl_x509store.o: $(hdrdir)/ruby/encoding.h
ossl_x509store.o: $(hdrdir)/ruby/intern.h
ossl_x509store.o: $(hdrdir)/ruby/io.h
ossl_x509store.o: $(hdrdir)/ruby/missing.h
ossl_x509store.o: $(hdrdir)/ruby/onigmo.h
ossl_x509store.o: $(hdrdir)/ruby/oniguruma.h
ossl_x509store.o: $(hdrdir)/ruby/ruby.h
ossl_x509store.o: $(hdrdir)/ruby/st.h
ossl_x509store.o: $(hdrdir)/ruby/subst.h
ossl_x509store.o: $(hdrdir)/ruby/thread.h
ossl_x509store.o: $(top_srcdir)/include/ruby.h
ossl_x509store.o: openssl_missing.h
ossl_x509store.o: ossl.h
ossl_x509store.o: ossl_asn1.h
ossl_x509store.o: ossl_bio.h
ossl_x509store.o: ossl_bn.h
ossl_x509store.o: ossl_cipher.h
ossl_x509store.o: ossl_config.h
ossl_x509store.o: ossl_digest.h
ossl_x509store.o: ossl_engine.h
ossl_x509store.o: ossl_hmac.h
ossl_x509store.o: ossl_kdf.h
ossl_x509store.o: ossl_ns_spki.h
ossl_x509store.o: ossl_ocsp.h
ossl_x509store.o: ossl_pkcs12.h
ossl_x509store.o: ossl_pkcs7.h
ossl_x509store.o: ossl_pkey.h
ossl_x509store.o: ossl_rand.h
ossl_x509store.o: ossl_ssl.h
ossl_x509store.o: ossl_version.h
ossl_x509store.o: ossl_x509.h
ossl_x509store.o: ossl_x509store.c
ossl_x509store.o: ruby_missing.h
# AUTOGENERATED DEPENDENCIES END
