@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Change Default File Association (T1042)
ECHO.
ECHO [+] Changing File Association using 'assoc'
ECHO -------------------------------------------------------------------
cmd.exe /c assoc .wav="C:\Program Files\Windows Media Player\wmplayer.exe"
ECHO.

