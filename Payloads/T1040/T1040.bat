@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Network Sniffing (T1040)
ECHO.
ECHO [+] Network Sniffing
ECHO -------------------------------------------------------------------
%Utilities%\tshark.exe -c 5
c:\windump.exe
powershell -ep bypass %Utilities%\tshark.exe -c 5
ECHO.
