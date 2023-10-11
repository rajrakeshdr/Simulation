@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: System Owner/User Discovery	(T1033)
ECHO.
ECHO [+] Discovery using builtin Utilities
ECHO -------------------------------------------------------------------
cmd.exe /C whoami
cmd /c wmic useraccount get /ALL >> %EXFIL%\users_T1033.txt
cmd /c quser /SERVER:127.0.0.1
cmd /c quser
qwinsta.exe /server:127.0.0.1
qwinsta.exe
ECHO.

