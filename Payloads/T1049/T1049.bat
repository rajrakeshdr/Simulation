@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: System Network Connections Discovery	(T1049)
ECHO.
ECHO [+] Discovery using builtin Utilities
ECHO -------------------------------------------------------------------
cmd /c netstat -ano > %EXFIL%\connections_T1049.txt
cmd /c net use 
net sessions
powershell Get-NetTCPConnection
ECHO.

