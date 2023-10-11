@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: File and Directory Discovery (T1083)
ECHO.
ECHO [+] Discovery via CMD
ECHO -------------------------------------------------------------------
cmd /c dir /s c:\ >> %EXFIL%\wallpaper.jpg
cmd /c dir /s "c:\Documents and Settings" >> %EXFIL%\wallpaper.jpg
cmd /c dir /s "c:\Program Files\" >> %EXFIL%\wallpaper.jpg
cmd /c dir /s d:\ >> %EXFIL%\wallpaper.jpg
cmd /c dir "%systemdrive%\Users\*.*" >> %EXFIL%\wallpaper.jpg
cmd /c dir "%userprofile%\AppData\Roaming\Microsoft\Windows\Recent\*.*" >> %EXFIL%\wallpaper.jpg
cmd /c dir "%userprofile%\Desktop\*.*" >> %EXFIL%\wallpaper.jpg
cmd /c tree /F >> %EXFIL%\wallpaper.jpg
type %EXFIL%\wallpaper.jpg
cmd.exe /c dir c:\\ > %EXFIL%\out.txt
cmd.exe /c dir \"c:\\Documents and Settings\" >> %EXFIL%\out.txt
cmd.exe /c dir \"c:\\Program Files\\\" >> %EXFIL%\out.txt
cmd.exe /c dir d:\\ >> %EXFIL%\out.txt
cmd.exe /c type %EXFIL%\out.txt
ECHO.

ECHO [+] Discovery via Powershell
ECHO -------------------------------------------------------------------
Powershell ls -recurse
Powershell get-childitem -recurse 
Powershell gci -recurse "c:\Documents and Settings\"
ECHO.

