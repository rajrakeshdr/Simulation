@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Account Manipulation	(T1098)
ECHO.
ECHO - Creating and Renaming New User using Powershell
cmd /c powershell -ep bypass New-LocalUser -Name mitre -NoPassword -FullName "TriggerMyRules" -Description "SayTryHarder!"
powershell -ep bypass Rename-LocalUser -Name "mitre" -NewName "mitre"

Echo - Creating and Renaming LocalGroup using Powershell
powershell -ep bypass New-LocalGroup -Name "mitre_group"
powershell -ep bypass Rename-LocalGroup -Name "mitre_group" -NewName "mitre_group"

ECHO - Adding user to Group using Powershell
powershell -ep bypass Add-LocalGroupMember -Group '"Remote Desktop Users"' -Member ('mitre')


ECHO  - Deleting Localgroup using "NET" utilities
net localgroup mitre_group /delete
Echo.

ECHO  - Renaming Localgroup using "WMIC" 
wmic group where name='mitre' rename 'mitre'
ECHO.
