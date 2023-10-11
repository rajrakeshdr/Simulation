@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Data compression techniques	(T1002)
ECHO.
ECHO [+] Compress Data using Powershell
ECHO -------------------------------------------------------------------

powershell.exe -noprofile -command "DIR %EXFIL%\*.txt -Recurse | Compress-Archive -force -DestinationPath %EXFIL%\T1002.zip"

powershell "Add-Type -As 'System.IO.Compression.FileSystem';[System.IO.Compression.ZipFile]::CreateFromDirectory('%EXFIL%', '%EXFIL%\T1002.zip')"

ECHO.

ECHO [+] Compress Data using Command Prompt
ECHO -------------------------------------------------------------------

"C:\Program Files (x86)\7-zip\7z" a -r %EXFIL%\prepareforexfil.7z %EXFIL%\*.txt

"C:\Program Files\WinRAR\rar" a -r %EXFIL%\prepareforexfil.rar %EXFIL%\*.txt

"C:\Program Files\WinRAR\rar" a -r -m0 -hp"infected" %EXFIL%\pwd_prepareforexfil.rar %EXFIL%\*.txt

makecab /F %EXFIL%\*.txt %EXFIL%\prepareforexfil.cab 

compact /c /s %EXFIL%\*.txt

ECHO.


