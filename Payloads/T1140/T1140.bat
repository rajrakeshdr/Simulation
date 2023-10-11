@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Deobfuscate/Decode Files Or Information (T1140)
ECHO.
ECHO [+] Using 'Certutil.exe' to Encode and Decode a binary
ECHO -------------------------------------------------------------------
certutil.exe -encode C:\Windows\System32\cmd.exe %EXFIL%\T1140_01.txt
certutil.exe -decode %EXFIL%\T1140_01.txt %EXFIL%\T1140_cmd.exe
ECHO.
cmd.exe /c copy %windir%\system32\certutil.exe %EXFIL%\%temp%tcm.tmp
cmd.exe /c %EXFIL%\%temp%tcm.tmp -decode %EXFIL%\T1140_02.exe T1140_02.txt
ECHO.
