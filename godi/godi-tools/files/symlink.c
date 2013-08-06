#include <windows.h>
#include <process.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

static void *
xmalloc(size_t size)
{
  void * ret = malloc(size);
  if ( ret == NULL ){
    fputs("No memory\n",stderr);
    exit(1);
  }
  return ret;
}

static char *
get_executable_name(void)
{
#define START_LENGTH  1024
#define MAX_LENGTH    (START_LENGTH * 64)
    DWORD result;
    DWORD path_size = START_LENGTH;
    char* path      = xmalloc(START_LENGTH);

    while ( path != NULL && path_size <= MAX_LENGTH )
    {
        memset(path, 0, path_size);
        result = GetModuleFileName(NULL, path, path_size - 1);
        if (result == 0 )
        {
            free(path);
            path = NULL;
        }
        else if (result == path_size - 1)
        {
            DWORD er = GetLastError();
            free(path);
            path=NULL;
            if ( er == ERROR_INSUFFICIENT_BUFFER ||
                 er == ERROR_SUCCESS )
            {
                path_size = path_size * 2;
                if ( path_size <= MAX_LENGTH )
                  path = xmalloc(path_size);
            }
        }
        else
        {
            /* don't waste memory */
            size_t len = 1 + strlen(path);
            char * result = xmalloc(len);
            if ( result )
              result=memcpy(result, path, len);
            free(path);
            path=result;
            path_size= MAX_LENGTH + 1;
        }
    }
    return path;
#undef START_LENGTH
#undef MAX_LENGTH
}


/* Prepares an argument vector before calling spawn().
   Note that spawn() does not by itself call the command interpreter
   (getenv ("COMSPEC") != NULL ? getenv ("COMSPEC") :
   ({ OSVERSIONINFO v; v.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
   GetVersionEx(&v);
   v.dwPlatformId == VER_PLATFORM_WIN32_NT;
   }) ? "cmd.exe" : "command.com").
   Instead it simply concatenates the arguments, separated by ' ', and calls
   CreateProcess().  We must quote the arguments since Win32 CreateProcess()
   interprets characters like ' ', '\t', '\\', '"' (but not '<' and '>') in a
   special way:
   - Space and tab are interpreted as delimiters. They are not treated as
   delimiters if they are surrounded by double quotes: "...".
   - Unescaped double quotes are removed from the input. Their only effect is
   that within double quotes, space and tab are treated like normal
   characters.
   - Backslashes not followed by double quotes are not special.
   - But 2*n+1 backslashes followed by a double quote become
   n backslashes followed by a double quote (n >= 0):
   \" -> "
   \\\" -> \"
   \\\\\" -> \\"
*/
#define SHELL_SPECIAL_CHARS "\"\\ \001\002\003\004\005\006\007\010\011\012\013\014\015\016\017\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037"
#define SHELL_SPACE_CHARS " \001\002\003\004\005\006\007\010\011\012\013\014\015\016\017\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037"

static char **
prepare_spawn (char **argv)
{
  size_t argc;
  char **new_argv;
  size_t i;

  /* Count number of arguments.  */
  for (argc = 0; argv[argc] != NULL; argc++)
    ;

  /* Allocate new argument vector.  */
  new_argv = xmalloc((argc + 1) * sizeof *new_argv );

  /* Put quoted arguments into the new argument vector.  */
  for (i = 0; i < argc; i++)
    {
      const char *string = argv[i];

      if (string[0] == '\0')
	new_argv[i] = strdup ("\"\"");
      else if (strpbrk (string, SHELL_SPECIAL_CHARS) != NULL)
	{
	  int quote_around = (strpbrk (string, SHELL_SPACE_CHARS) != NULL);
	  size_t length;
	  unsigned int backslashes;
	  const char *s;
	  char *quoted_string;
	  char *p;

	  length = 0;
	  backslashes = 0;
	  if (quote_around)
	    length++;
	  for (s = string; *s != '\0'; s++)
	    {
	      char c = *s;
	      if (c == '"')
		length += backslashes + 1;
	      length++;
	      if (c == '\\')
		backslashes++;
	      else
		backslashes = 0;
	    }
	  if (quote_around)
	    length += backslashes + 1;

	  quoted_string = xmalloc (length + 1);

	  p = quoted_string;
	  backslashes = 0;
	  if (quote_around)
	    *p++ = '"';
	  for (s = string; *s != '\0'; s++)
	    {
	      char c = *s;
	      if (c == '"')
		{
		  unsigned int j;
		  for (j = backslashes + 1; j > 0; j--)
		    *p++ = '\\';
		}
	      *p++ = c;
	      if (c == '\\')
		backslashes++;
	      else
		backslashes = 0;
	    }
	  if (quote_around)
	    {
	      unsigned int j;
	      for (j = backslashes; j > 0; j--)
		*p++ = '\\';
	      *p++ = '"';
	    }
	  *p = '\0';

	  new_argv[i] = quoted_string;
	}
      else
	new_argv[i] = (char *) string;
    }
  new_argv[argc] = NULL;

  return new_argv;
}



static char *
add_to_file_dir(const char * prefix, const char * suffix)
{
  char * cur_path;
  char * last;
  char * ret;
  size_t output_len;
  cur_path = get_executable_name();
  if ( cur_path  == NULL ){
    fputs("GetModuleFileName failed\n",stderr);
    exit(2);
  }
  last = strrchr(cur_path, '\\') ;
  if ( last == NULL ){
    fputs("GetModuleFileName failed\n",stderr);
    exit(2);
  }
  *last = '\0';

  output_len = strlen(prefix) + strlen(suffix) + strlen(cur_path) + 1 ;

  ret=xmalloc(output_len);
  snprintf(ret,output_len,"%s%s%s",prefix,cur_path,suffix);
  free(cur_path);
  return ret;
}


int
main(int argc, char **argv) 
{
    char **new_argv;
    int k, code;
    new_argv = xmalloc( (argc+2) * sizeof (char *) );
    new_argv[0] = add_to_file_dir("","\\@PROG@");
    new_argv[1] = "@ARGV1@";
    for (k=1; k < argc; k++) new_argv[k+1] = argv[k];
    new_argv[argc+1] = NULL;
    new_argv = prepare_spawn (new_argv);
    code = _spawnv(_P_WAIT, new_argv[0] , (const char **) new_argv );
    if (code == -1) {
        perror("@ARGV1@: Cannot exec @PROG@");
        exit(127);
    }
    else exit(code);
}
