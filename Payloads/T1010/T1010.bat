@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Application Window Discovery (T1010)
ECHO.
ECHO [+] Identify Application Window Title using custom Payload
ECHO -------------------------------------------------------------------
C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe -out:T1010.exe %PAYLOAD%T1010\src\T1010.cs
%PAYLOAD%T1010\src\T1010.exe
ECHO.

