@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Network Share Discovery	(T1135)
ECHO.
ECHO [+] Discovery via 'NET' Utilities and Powershell
ECHO -------------------------------------------------------------------
net view \\127.0.0.1\
powershell net view \\127.0.0.1\
powershell get-smbshare -Name \\127.0.0.1\
ECHO.

