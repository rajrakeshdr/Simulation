@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: System Time Discovery	(T1124)
ECHO.
ECHO [+] Discovery using builtin Utilities (NET,w32tm,Powershell)
ECHO -------------------------------------------------------------------
net time \\127.0.0.1
cmd /c w32tm /tz
powershell Get-Date
ECHO.

