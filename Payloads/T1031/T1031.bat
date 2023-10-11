@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique:  Modify Existing Service (T1031)
ECHO.
ECHO [+] Modify binPath of existing Service
ECHO -------------------------------------------------------------------
cmd /c sc config Fax binPath= "C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe -noexit -c \"write-host 'T1031 Test'\""
cmd /c sc start Fax
cmd /c sc config Fax binPath= "C:\WINDOWS\system32\fxssvc.exe"
ECHO.

