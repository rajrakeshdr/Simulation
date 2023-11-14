@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: New Service Creation (T1050)
ECHO.
ECHO [+] Create New Service using 'SC.EXE'
ECHO -------------------------------------------------------------------
cmd /c sc.exe create TestService1 binPath= "C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe  -c \"write-host 'T1050 - Service Creation via CMD'\""
cmd /c sc.exe start TestService1
cmd /c sc.exe stop TestService1
cmd /c sc.exe delete TestService1
ECHO.

ECHO [+] Create New Service using Powershell
ECHO -------------------------------------------------------------------
Powershell New-Service -Name "TestService2" -BinaryPathName "C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe  -c \"write-host 'T1050 - Service Creation via Powershell'\""
Powershell Start-Service -Name "TestService2"
Powershell Stop-Service -Name "TestService2"
Powershell (Get-WmiObject Win32_Service -filter "name='TestService2'").Delete()
ECHO.

