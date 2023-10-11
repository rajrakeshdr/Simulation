@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: File Permissions Modification (T1222)
ECHO.
ECHO [+] Chaning File Premissions using 'takeown.exe' 
ECHO -------------------------------------------------------------------
mkdir "%EXFIL%Test_T1222"
takeown.exe /f %EXFIL%Test_T1222
takeown.exe /f %EXFIL%Test_T1222 /r
ECHO.

ECHO [+] Chaning File Premissions using 'cacls.exe' 
ECHO -------------------------------------------------------------------
cacls.exe %EXFIL%Test_T1222 /grant Everyone:F
cacls.exe %EXFIL%Test_T1222 /grant Everyone:F /t
ECHO.

ECHO [+] Chaning File Premissions using 'icacls.exe' 
ECHO -------------------------------------------------------------------
icacls.exe %EXFIL%Test_T1222 /grant Everyone:F
icacls.exe %EXFIL%Test_T1222 /grant Everyone:F /t
ECHO.

ECHO [+] Chaning File Attributes using 'attrib.exe' 
ECHO -------------------------------------------------------------------
attrib.exe -r %EXFIL%Test_T1222
ECHO.
