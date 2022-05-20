dnl config.m4 for extension emscripten

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use 'with':

dnl PHP_ARG_WITH([emscripten],
dnl   [for emscripten support],
dnl   [AS_HELP_STRING([--with-emscripten],
dnl     [Include emscripten support])])

dnl Otherwise use 'enable':

PHP_ARG_ENABLE([emscripten],
  [whether to enable emscripten support],
  [AS_HELP_STRING([--enable-emscripten],
    [Enable emscripten support])],
  [no])

if test "$PHP_EMSCRIPTEN" != "no"; then
  dnl Write more examples of tests here...

  dnl Remove this code block if the library does not support pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBS, EMSCRIPTEN_SHARED_LIBADD)

  dnl If you need to check for a particular library version using PKG_CHECK_MODULES,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-emscripten -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/emscripten.h"  # you most likely want to change this
  dnl if test -r $PHP_EMSCRIPTEN/$SEARCH_FOR; then # path given as parameter
  dnl   EMSCRIPTEN_DIR=$PHP_EMSCRIPTEN
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for emscripten files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       EMSCRIPTEN_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$EMSCRIPTEN_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the emscripten distribution])
  dnl fi

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-emscripten -> add include path
  dnl PHP_ADD_INCLUDE($EMSCRIPTEN_DIR/include)

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-emscripten -> check for lib and symbol presence
  dnl LIBNAME=EMSCRIPTEN # you may want to change this
  dnl LIBSYMBOL=EMSCRIPTEN # you most likely want to change this

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   AC_DEFINE(HAVE_EMSCRIPTEN_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your emscripten library.])
  dnl ], [
  dnl   $LIBFOO_LIBS
  dnl ])

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $EMSCRIPTEN_DIR/$PHP_LIBDIR, EMSCRIPTEN_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_EMSCRIPTEN_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your emscripten library.])
  dnl ],[
  dnl   -L$EMSCRIPTEN_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(EMSCRIPTEN_SHARED_LIBADD)

  dnl In case of no dependencies
  AC_DEFINE(HAVE_EMSCRIPTEN, 1, [ Have emscripten support ])

  PHP_NEW_EXTENSION(emscripten, emscripten.c, $ext_shared)
fi
