@ECHO OFF

color 0E
ECHO ===========================================================================
ECHO Technique: Clipboard Data	(T1115)
ECHO.
ECHO [+] Using: CMD
cmd /c whoami | clip
echo "systeminfo" > %EXFIL%readme.txt
cmd /c dir | clip && clip < %EXFIL%readme.txt
ECHO.
ECHO [+] Using: Powershell
cmd /c powershell.exe echo Get-Process | clip
powershell %PAYLOAD%T1115\T1115.ps1
ECHO.
