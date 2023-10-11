@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: AppInit DLLs (T1103)
ECHO.
ECHO [+] Import Regitry Node
ECHO -------------------------------------------------------------------
cmd /c reg import T1103.reg
ECHO.

