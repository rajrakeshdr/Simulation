@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO ************************
ECHO.
ECHO [+] Renamed PowerShell and PsExec
ECHO -------------------------------------------------------------------

copy C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe %Utilities%powershell.exe
powershell rename-item -path "%Utilities%\powershell.exe" -NewName "%Utilities%\9000.exe"
start %Utilities%9000.exe

powershell rename-item -path "%Utilities%\PsExec.exe" -NewName "%Utilities%\9001.exe"
start %Utilities%9001.exe

ECHO.


