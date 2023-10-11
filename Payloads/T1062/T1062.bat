@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique:  Hypervisor	(T1062)
ECHO.
ECHO [+] Abuse Hypervisor to achieve persistence using Powershell 
ECHO -------------------------------------------------------------------
Powershell Get-WindowsFeature -Name Hyper-V -ComputerName T1062-vm
Powershell Install-WindowsFeature -Name Hyper-V -ComputerName 127.0.0.1 -IncludeManagementTools
Powershell New-VM -Name testvm -MemoryStartupBytes 1GB -NewVHDPath %EXFIL%\T1062.vhdx -NewVHDSizeBytes 21474836480
ECHO.

