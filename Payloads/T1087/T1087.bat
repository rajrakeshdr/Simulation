@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Account Discovery	(T1087)
ECHO.
ECHO [+] Discovery using 'NET' Utilities
ECHO -------------------------------------------------------------------
net user
net user /domain
dir c:\Users\
cmd /c cmdkey.exe /list
cmd.exe /c net localgroup "Users"
cmd.exe /c net localgroup
cmd.exe /c net group \"Domain Admins\" /domain
cmd.exe /c net user
cmd.exe /c net user /domain
cmd.exe /c net localgroup administrators
cmd.exe /c net share
cmd.exe /c net use
cmd.exe /c net accounts
cmd.exe /c net config workstation
ECHO.


ECHO [+] Discovery using 'Powershell'
ECHO -------------------------------------------------------------------
powershell get-localuser
powershell get-localgroupmembers -group Users
powershell cmdkey.exe /list
powershell ls C:/Users
powershell get-childitem C:\Users\
powershell dir C:\Users\
powershell get-aduser -filter *
powershell get-localgroup
ECHO.


ECHO [+] Discovery using 'WMIC'
ECHO -------------------------------------------------------------------
cmd.exe /c wmic useraccount list /format:list
cmd.exe /c wmic ntdomain
cmd.exe /c wmic group list /format:list
cmd.exe /c wmic sysaccount list /format:list
ECHO.


ECHO [+] Discovery using other utilities
ECHO -------------------------------------------------------------------
cmd.exe /c query user
cmd.exe /c C:\\tools\win32bins\\activedirectory\\dsquery server
cmd.exe /c C:\\tools\win32bins\\activedirectory\\dsquery user -name smith* | C:\\tools\win32bins\\activedirectory\\dsget user -dn -desc
ECHO.
