#ifndef RUBY_MJIT_CONFIG_H
#define RUBY_MJIT_CONFIG_H 1

#ifdef LOAD_RELATIVE
#define MJIT_HEADER_INSTALL_DIR "/include/ruby-2.6.0/universal-darwin19"
#else
#define MJIT_HEADER_INSTALL_DIR "/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/include/ruby-2.6.0/universal-darwin19"
#endif
#define MJIT_MIN_HEADER_NAME "rb_mjit_min_header-2.6.3.h"
#define MJIT_CC_COMMON   "/Users/ariel/private-bin/clang",
#define MJIT_CFLAGS      MJIT_ARCHFLAG "-w",
#define MJIT_OPTFLAGS   
#define MJIT_DEBUGFLAGS  "-g",
#define MJIT_LDSHARED    "/Users/ariel/private-bin/clang", "-dynamic", "-bundle",
#define MJIT_DLDFLAGS    MJIT_ARCHFLAG "-undefined", "dynamic_lookup", "-multiply_defined", "suppress",
#define MJIT_LIBS        "-lruby.2.6",
#define PRELOADENV       "DYLD_INSERT_LIBRARIES"
#if 0
#elif defined __x86_64__
#  define MJIT_ARCHFLAG    "-arch", "x86_64",
#elif defined __i386__
#  define MJIT_ARCHFLAG    "-arch", "i386",
#elif defined __x86_64__
#  define MJIT_ARCHFLAG    "-arch", "x86_64",
#elif defined __i386__
#  define MJIT_ARCHFLAG    "-arch", "i386",
#else
#  define MJIT_ARCHFLAG    /* no flag */
#endif

#endif /* RUBY_MJIT_CONFIG_H */
