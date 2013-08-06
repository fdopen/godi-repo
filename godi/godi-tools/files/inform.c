#define WIN32_LEAN_AND_MEAN
#include <windows.h>

int main(void)
{
    int ret = 1 ;
    if ( SendMessageTimeoutA(HWND_BROADCAST,WM_SETTINGCHANGE,0,
                            (LPARAM)"Environment",SMTO_ABORTIFHUNG,5000,
                             NULL) ){
        if ( SendMessageTimeoutW(HWND_BROADCAST,WM_SETTINGCHANGE,0,
                                 (LPARAM) (L"Environment"),SMTO_ABORTIFHUNG,
                                 5000,NULL) ){
            ret=0;
        }
    }
    return ret;
}
