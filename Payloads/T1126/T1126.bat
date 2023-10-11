@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Network Share Connection Removal (T1126)
ECHO.
ECHO [+] Remove Network Share using 'NET' utilities
ECHO -------------------------------------------------------------------
net use c: \\T1126\share
net share T1126=\\T1126\share /REMARK:"T1126 share" /CACHE:No
net share \\T1126\share /delete
ECHO.

ECHO [+] Remove Network Share using Powershell
ECHO -------------------------------------------------------------------
powershell -ep bypass Remove-SmbShare -Name \\T1126\shares
powershell -ep bypass  Remove-FileShare -Name \\T1126\sharess
ECHO.
