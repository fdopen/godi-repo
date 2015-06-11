#include <flexdll.h>
#include <stdio.h>
#include <windows.h>


int main(int argc, char *argv[]) {
    DWORD er;
    void *handle;
    if ( argc != 2 ){
        puts("wrong arguments");
        return 1;
    }
    handle = flexdll_dlopen(argv[1], FLEXDLL_RTLD_GLOBAL);
    if ( handle != NULL ){
        puts("dlopen success");
        return 1;
    }
    er = GetLastError();
    switch (er){
    case 193:
      puts("invalid");
      break;
    case 1114:
      puts("ok");
      break;
    default:
      puts("unknown");
      break;
    }
    return 0;    
}
