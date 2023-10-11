@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Service Execution (T1035)
ECHO.
ECHO [+] Service Creation using SC utility 
ECHO -------------------------------------------------------------------
echo "Service Created" > %EXFIL%T1035.txt
sc.exe create EvilService binPath= "%COMSPEC% /c powershell.exe -nop -w hidden -command New-Item -ItemType File %EXFIL%T1035.txt"
sc.exe start EvilService
sc.exe delete EvilService
ECHO.

