@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Remote System Discovery	(T1018)
ECHO.
ECHO [+] Discovery using 'NET,ARP' utilities 
ECHO -------------------------------------------------------------------
net view /domain
net view
arp -a
for /l %%i in (1,1,254) do ping -n 1 -w 100 192.168.11.%%i
ECHO.

