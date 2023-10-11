@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Application Shimming (T1138)
ECHO.
ECHO [+] Install SHIM Database
ECHO -------------------------------------------------------------------
cmd /c sdbinst.exe Shimx86.sdb
ECHO.

