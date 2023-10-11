@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Masquerading (T1036)
ECHO.
ECHO [+] Copying 'cmd.exe' as 'lsass.exe' and executing
ECHO -------------------------------------------------------------------
cmd.exe /c copy %SystemRoot%\System32\cmd.exe %SystemRoot%\Temp\lsass.exe
cmd.exe /c %SystemRoot%\Temp\lsass.exe /c ping -n 5 google.com

cmd.exe /c echo \"BUBBLEWRAP (also known as Backdoor.APT.FakeWinHTTPHelper)\"  > %EXFIL%\upload_T1036
cmd.exe /c ren %EXFIL%\upload_T1036 audiodg_T1036.exe
ECHO.
