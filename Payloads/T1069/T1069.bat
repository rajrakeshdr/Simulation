@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Permission Groups Discovery	(T1069)
ECHO.
ECHO [+] Discovery via 'NET' Utilities and Powershell
ECHO -------------------------------------------------------------------
cmd.exe /c net localgroup administrators >> %EXFIL%\out_T1069.txt
net localgroup
net group /domain
powershell get-localgroup
powershell.exe -Command "Get-ADPrincipalGroupMembership administrator | Select-Object Name"
ECHO.

