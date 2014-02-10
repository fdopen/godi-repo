AC_INIT([sha], [0.1],[andreas@ml.ignorelist.com],[sha])

AC_CONFIG_HEADERS([config.h])
AC_PROG_CC
AC_C_BIGENDIAN([AC_DEFINE(BIG_ENDIAN_HOST,1)],[AC_DEFINE(LITTLE_ENDIAN_HOST,1)])

AC_TRY_COMPILE(
        [
        #include <fcntl.h>
        ],
        [
        int flags;
        flags = O_CLOEXEC;
        ],
        AC_MSG_RESULT(yes)
        AC_DEFINE(HAVE_O_CLOEXEC, 1, Define if open() has O_CLOEXEC flag)
        ,
        AC_MSG_RESULT(no)
        )

AC_OUTPUT
