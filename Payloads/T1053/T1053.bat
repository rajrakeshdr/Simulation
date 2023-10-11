@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique:  Scheduled task (T1053)
ECHO.
ECHO [+] Achieve Persistence using AT,SCHTASKS
ECHO -------------------------------------------------------------------
at 13:20 /interactive cmd
at \\127.0.0.1 cmd /delete
SCHTASKS /Create /SC ONCE /TN spawn /TR C:\windows\system32\cmd.exe /ST 20:10
SCHTASKS /Create /S 127.0.0.1 /RU aria/Administrator /RP Pass123 /TN "Mitre Task" /TR "cmd.exe" /SC daily /ST 20:10
ECHO.


