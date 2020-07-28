V = 0
Q1 = $(V:1=)
Q = $(Q1:0=@)
ECHO1 = $(V:1=@:)
ECHO = $(ECHO1:0=@echo)


MINIRUBY = ./miniruby -I../ruby/lib -I. -I.ext/common 
SCRIPT_ARGS = --dest-dir="" --extout=".ext" --mflags="" --make-flags="CC=/Users/ariel/private-bin/clang RUBY_CODESIGN=- OBJCOPY=:\ noobjcopy"
EXTMK_ARGS = $(SCRIPT_ARGS) --gnumake=$(gnumake) --extflags="$(EXTLDFLAGS)" \
	   --make-flags="MINIRUBY='$(MINIRUBY)'"

all: exts gems
exts:
gems:

exts: ext/strscan/exts.mk
ext/strscan/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/syslog/exts.mk
ext/syslog/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/gdbm/exts.mk
ext/gdbm/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/pty/exts.mk
ext/pty/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/objspace/exts.mk
ext/objspace/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/nkf/exts.mk
ext/nkf/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/digest/exts.mk
ext/digest/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/date/exts.mk
ext/date/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/readline/exts.mk
ext/readline/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/io/exts.mk
ext/io/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/etc/exts.mk
ext/etc/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/win32ole/exts.mk
ext/win32ole/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/bigdecimal/exts.mk
ext/bigdecimal/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/-test-/exts.mk
ext/-test-/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/fiddle/exts.mk
ext/fiddle/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/rubyvm/exts.mk
ext/rubyvm/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/zlib/exts.mk
ext/zlib/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/psych/exts.mk
ext/psych/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/cgi/exts.mk
ext/cgi/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/json/exts.mk
ext/json/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/stringio/exts.mk
ext/stringio/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/racc/exts.mk
ext/racc/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/fiber/exts.mk
ext/fiber/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/sdbm/exts.mk
ext/sdbm/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/continuation/exts.mk
ext/continuation/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/rbconfig/exts.mk
ext/rbconfig/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/dbm/exts.mk
ext/dbm/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/win32/exts.mk
ext/win32/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/fcntl/exts.mk
ext/fcntl/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/openssl/exts.mk
ext/openssl/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/ripper/exts.mk
ext/ripper/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/pathname/exts.mk
ext/pathname/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/coverage/exts.mk
ext/coverage/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
exts: ext/socket/exts.mk
ext/socket/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --extstatic $(EXTSTATIC) \
		-- configure $(@D)
gems: gems/rake-12.3.2/exts.mk
gems/rake-12.3.2/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --no-extstatic \
		-- configure $(@D)
gems: gems/minitest-5.11.3/exts.mk
gems/minitest-5.11.3/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --no-extstatic \
		-- configure $(@D)
gems: gems/net-telnet-0.2.0/exts.mk
gems/net-telnet-0.2.0/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --no-extstatic \
		-- configure $(@D)
gems: gems/xmlrpc-0.3.0/exts.mk
gems/xmlrpc-0.3.0/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --no-extstatic \
		-- configure $(@D)
gems: gems/power_assert-1.1.3/exts.mk
gems/power_assert-1.1.3/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --no-extstatic \
		-- configure $(@D)
gems: gems/did_you_mean-1.3.0/exts.mk
gems/did_you_mean-1.3.0/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --no-extstatic \
		-- configure $(@D)
gems: gems/test-unit-3.2.9/exts.mk
gems/test-unit-3.2.9/exts.mk: FORCE
	$(Q)$(MINIRUBY) $(srcdir)/ext/extmk.rb --make='$(MAKE)' \
		--command-output=$@ $(EXTMK_ARGS) --no-extstatic \
		-- configure $(@D)

.PHONY: FORCE all exts gems
FORCE:
