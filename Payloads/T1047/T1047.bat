@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Windows Management Instrumentation Reconnaissance	(T1047)
ECHO.
ECHO [+] Leveraging WMIC for Recon Activity 
ECHO -------------------------------------------------------------------
wmic useraccount get /ALL
wmic process get caption,executablepath,commandline
wmic qfe get description,installedOn /format:csv
wmic /node:"127.0.0.1" service where (caption like "sysmon")
ECHO.

