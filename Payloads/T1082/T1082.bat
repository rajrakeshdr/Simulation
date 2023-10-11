@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: System Information Discovery	(T1082)
ECHO.
ECHO [+] Discovery using builtin Utilities
ECHO -------------------------------------------------------------------
cmd.exe /c ver > %EXFIL%\sysinfo.txt
cmd.exe /c systeminfo >> %EXFIL%\sysinfo.txt
cmd.exe /c net config workstation >> %EXFIL%\sysinfo.txt
cmd.exe /c type  %EXFIL%\sysinfo.txt
cmd.exe /c vssadmin.exe list shadows >> %EXFIL%\vssinfo.txt
cmd.exe /c type  %EXFIL%\vssinfo.txt
cmd /c reg query HKLM\SYSTEM\CurrentControlSet\Services\Disk\Enum
ECHO.

