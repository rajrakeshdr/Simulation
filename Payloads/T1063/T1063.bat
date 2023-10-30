@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Security Software Discovery	(T1063)
ECHO.
ECHO [+] Discovery of AV using 'Tasklist.exe'
ECHO -------------------------------------------------------------------
netsh.exe advfirewall firewall show all profiles
tasklist.exe
cmd /c tasklist.exe | findstr /i virus
tasklist.exe | findstr /i cb
cmd /c tasklist.exe | findstr /i defender
cmd /c tasklist.exe | findstr /i cylance
ECHO.

ECHO [+] Discovery of AV using Powershell 
ECHO -------------------------------------------------------------------
powershell -Command "get-process | ?{$_.Description -like '*virus*'}"
powershell -Command "get-process | ?{$_.Description -like '*carbonblack*'}"
powershell -Command "get-process | ?{$_.Description -like '*defender*'}"
powershell -Command "get-process | ?{$_.Description -like '*cylance*'}"
ECHO.

ECHO [+] Discovery of installed Sysmon Driver  
ECHO -------------------------------------------------------------------
fltmc.exe | findstr.exe 385201
ECHO.

