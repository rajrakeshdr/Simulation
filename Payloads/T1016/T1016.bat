@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: System Network Configuration Discovery (T1016)
ECHO.
ECHO [+] Discovery using builtin Utilities
ECHO -------------------------------------------------------------------
cmd /c ipconfig /all
cmd /c netsh interface show
cmd /c arp -a
cmd /c nbtstat -n
cmd /c net config
ECHO.

