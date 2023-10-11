@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: System Service Discovery	(T1007)
ECHO.
ECHO [+] Discovery using builtin Utilities (NET,SC,WMIC)
ECHO -------------------------------------------------------------------
cmd.exe /c net start  >>  %EXFIL%\services_T1007.txt
cmd.exe /c type  %EXFIL%\services_T1007.txt
cmd /c tasklist.exe
cmd /c sc query
cmd /c sc query state= all
wmic service where (displayname like "fax") get name
sc start fax
sc stop fax
ECHO.

ECHO [+] Discovery using builtin Utilities (reg.exe)
ECHO -------------------------------------------------------------------
reg.exe query "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce"
ECHO.
