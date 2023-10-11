@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Data Staged	(T1074)
ECHO.
ECHO  [+] Collecting System, Network, Registry Information prior to Exfil
ECHO.
net user Administrator /domain > "%EXFIL%\T1074_01.txt"
net Accounts >> "%EXFIL%\T1074_01.txt"
net localgroup administrators >> "%EXFIL%\T1074_01.txt"
net use >> "%EXFIL%\T1074_01.txt"
net share >> "%EXFIL%\T1074_01.txt"
net group "domain admins" /domain >> "%EXFIL%\T1074_01.txt"
net config workstation >> "%EXFIL%\T1074_01.txt"
net accounts >> "%EXFIL%\T1074_01.txt"
net accounts /domain >> "%EXFIL%\T1074_01.txt"
net view >> "%EXFIL%\T1074_01.txt"
sc query >> "%EXFIL%\T1074_02.txt"
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" >> "%EXFIL%\T1074_03.txt"
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce" >> "%EXFIL%\T1074_03.txt"
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce" >> "%EXFIL%\T1074_03.txt"
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices" >> "%EXFIL%\T1074_03.txt"
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\RunServices" >> "%EXFIL%\T1074_03.txt"
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Notify" >> "%EXFIL%\T1074_03.txt"
reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit" >> "%EXFIL%\T1074_03.txt"
reg query "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\\Shell" >> "%EXFIL%\T1074_03.txt"
reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\\Shell" >> "%EXFIL%\T1074_03.txt"
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ShellServiceObjectDelayLoad" >> "%EXFIL%\T1074_03.txt"
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" >> "%EXFIL%\T1074_03.txt"
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnceEx" >> "%EXFIL%\T1074_03.txt"
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" >> "%EXFIL%\T1074_03.txt"
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" >> "%EXFIL%\T1074_03.txt"
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" >> "%EXFIL%\T1074_03.txt"
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" >> "%EXFIL%\T1074_03.txt"
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" >> "%EXFIL%\T1074_03.txt"
arp -a  >> "%EXFIL%\T1074_04.txt"
whoami  >> "%EXFIL%\T1074_04.txt"
ipconfig /displaydns  >> "%EXFIL%\T1074_04.txt"
route print  >> "%EXFIL%\T1074_04.txt"
netsh advfirewall show allprofiles  >> "%EXFIL%\T1074_04.txt"
systeminfo  >> "%EXFIL%\T1074_05.txt"
qwinsta >> "%EXFIL%\T1074_06.txt"
quser >> "%EXFIL%\T1074_06.txt"
ECHO.
ECHO.
