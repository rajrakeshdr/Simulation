@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Create Account (T1136)
ECHO.
ECHO [+] Creating New Accounts using 'NET' Utilities
ECHO -------------------------------------------------------------------
net user /add mitre01
net localgroup administrators mitre01 /add
net localgroup "Remote Desktop Users" mitre01 /add
net localgroup administrators mitre01 /delete
net user mitre01 getmein /domain
net user /add HelpAssistant Pwndiddy1
cmd /c net user HelpAssistant /delete
::cmd.exe /c net add user CN=John,CN=Users,DC=it,DC=uk,DC=savilltech,DC=com -samid John -pwd Pa55word123
ECHO.


ECHO [+] Account Creation using Powershell
ECHO -------------------------------------------------------------------
cmd /c powershell -ep bypass New-LocalUser -Name mitre02 -NoPassword -FullName "TriggerMyRules" -Description "SayIt!"
ECHO.

