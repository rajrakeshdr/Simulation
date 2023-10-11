@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Password Policy Discovery	(T1201)
ECHO.
ECHO [+] Discovery via 'NET' Utilities and Powershell
ECHO -------------------------------------------------------------------
net accounts
powershell Get-ADDefaultDomainPasswordPolicy
ECHO.

