@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Hidden Files and Directories	(T1158)
ECHO.
ECHO [+] Using 'attrib.exe' 
ECHO -------------------------------------------------------------------
mkdir "%EXFIL%T1158.txt"
echo "this file is hidden" > "%EXFIL%hide_T1158.txt"
attrib.exe +h "%EXFIL%hide_T1158.txt"
attrib.exe +s "%EXFIL%hide_T1158.txt"
ECHO.


ECHO [+] Using 'ADS Stream'
ECHO -------------------------------------------------------------------
echo "test" > %EXFIL%test.txt:ADSTest_T1158.txt
echo "test" > :adstest.txt
dir /s /r | find ":$DATA"
ECHO.


ECHO [+] Using PowerShell fot ADS 
ECHO -------------------------------------------------------------------
echo "test" > %EXFIL%T1158.txt 
powershell -ep bypass set-content -path %EXFIL%T1158.txt -stream adstest.txt -value "T1158"; set-content -path %EXFIL%T1158.txt -stream adstest.txt -value "test2"; bypass set-content -path %EXFIL% -stream adstest.txt -value "test3"
powershell -ep bypass "ls -Recurse | %{gi $_.Fullname -stream *} | where stream -ne ':$Data' | Select-Object pschildname"
ECHO.