@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Query Registry	(T1012)
ECHO.
ECHO [+] Query Registry
ECHO -------------------------------------------------------------------
cmd /c reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows"
cmd /c reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce
cmd /c reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce
cmd /c reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices
cmd /c reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunServices
cmd /c reg query HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Notify
cmd /c reg query HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit
cmd /c reg query HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\\Shell
cmd /c reg query HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\\Shell
cmd /c reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ShellServiceObjectDelayLoad
cmd /c reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce
cmd /c reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnceEx
cmd /c reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run
cmd /c reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run
cmd /c reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce
cmd /c reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run
cmd /c reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run
cmd /c reg query hklm\system\currentcontrolset\services /s | findstr ImagePath 2>nul | findstr /Ri ".*\.sys$"
cmd /c reg Query HKLM\Software\Microsoft\Windows\CurrentVersion\Run	  
REG QUERY HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\RecentDocs
REG QUERY HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce
ECHO.

