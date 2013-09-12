#include <caml/mlvalues.h>
#include <caml/memory.h>

#include <windows.h>

CAMLprim value
win_ex_create_process (value cmd,value env, value workdir);

CAMLprim value
win_ex_create_process (value cmd,value env, value workdir)
{
    CAMLparam3(cmd,env,workdir);

    STARTUPINFO start;
    PROCESS_INFORMATION child;
    int ret;

    ZeroMemory( &child, sizeof(PROCESS_INFORMATION) );
    ZeroMemory (&start, sizeof (STARTUPINFO));
    start.cb = sizeof (STARTUPINFO);
    start.dwFlags = STARTF_USESHOWWINDOW;
    start.wShowWindow = SW_SHOWNORMAL;

    if ( ( CreateProcess (NULL,
                          String_val(cmd),     /* command line                        */
                          NULL,    /* process security attributes         */
                          NULL,    /* primary thread security attributes  */
                          TRUE,   /* handles are NOT inherited,          */
                          0,       /* creation flags                      */
                          String_val(env),
                          String_val(workdir),
                          &start,  /* STARTUPINFO pointer                 */
                          &child) /* receives PROCESS_INFORMATION        */
             ) == 0 ) {
      ret=0;
    }
    else
      ret=1;

    CAMLreturn(Val_bool(ret));
}
