#ifndef EXTCONF_H
#define EXTCONF_H
#define HAVE_TYPE_INT_LEAST8_T 1
#define HAVE_TYPE_INT_LEAST16_T 1
#define HAVE_TYPE_INT_LEAST32_T 1
#define HAVE_TYPE_INT_LEAST64_T 1
#define HAVE_TYPE_INT_FAST8_T 1
#define HAVE_TYPE_INT_FAST16_T 1
#define HAVE_TYPE_INT_FAST32_T 1
#define HAVE_TYPE_INT_FAST64_T 1
#define HAVE_TYPE_INTMAX_T 1
#define HAVE_TYPE_SIG_ATOMIC_T 1
#define HAVE_TYPE_WCHAR_T 1
#define HAVE_TYPE_WINT_T 1
#define HAVE_TYPE_WCTRANS_T 1
#define HAVE_TYPE_WCTYPE_T 1
#define HAVE_TYPE__BOOL 1
#define HAVE_TYPE_LONG_DOUBLE 1
#define HAVE_TYPE_FLOAT__COMPLEX 1
#define HAVE_TYPE_DOUBLE__COMPLEX 1
#define HAVE_TYPE_LONG_DOUBLE__COMPLEX 1
// conditional added for Darling (not added by default by Ruby's `mkmf`, for some reason)
#if defined(__x86_64__) || !defined(DARLING)
#define HAVE_TYPE___INT128 1
#endif
#endif
