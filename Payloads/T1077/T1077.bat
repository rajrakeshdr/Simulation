@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Windows Admin Shares	(T1077)
ECHO.
ECHO [+] Add Windows Share using NET,Powershell 
ECHO -------------------------------------------------------------------
cmd.exe /c "net use \\127.0.0.1\C$ Pass123 /u:ARIA/Administrator"
powershell New-PSDrive -name G -psprovider filesystem -root \\127.0.0.1\C$
ECHO.

