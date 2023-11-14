@ECHO OFF
SETLOCAL EnableDelayedExpansion
CLS
color 0C
ECHO ===========================================================================
ECHO WARNING!                                               
ECHO.
ECHO 1) This will simulate Attack Techniques used by multiple APT Groups.
ECHO 2) When executed, this will manipulate the local system. 
ECHO.
ECHO Note: Recommended to take a snapshot of the system before the executing.
ECHO. 
ECHO ===========================================================================
ECHO Disabling Windows Defender : RealTime Monitoring/IOAVProtection/ScriptScanning
ECHO.
::cmd /c powershell Set-MpPreference -DisableIntrusionPreventionSystem $true -DisableIOAVProtection $true -DisableRealtimeMonitoring $true -DisableScriptScanning $true
ECHO.
ECHO ===========================================================================
ECHO Preparing Working Directories '%RootDir%'
ECHO.
setlocal

:PROMPT
SET /P AREYOUSURE=Are you sure to proceed (Y/[N])? 
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
SET CWD=%~dp0
SET RootDir=C:\Simulate_Mitre\
mkdir %RootDir%
md %RootDir%exfil %RootDir%Utilities %RootDir%Payloads
SET EXFIL=%RootDir%\EXFIL\
SET Utilities=%RootDir%\Utilities\
SET PAYLOAD=%RootDir%\Payloads\
SET APTDIR=%RootDir%
:: Sleep Interval
SET SINTERVAL=ON
SET SECONDMAX=15
xcopy /S /Y Payloads %PAYLOAD%
xcopy /S /Y Utilities %Utilities%
ECHO.



if [%1]==[-b] (
SET runALLTechnique="T1002" "T1003" "T1004" "T1007" "T1010" "T1011" "T1012" "T1014" "T1015" "T1016" "T1018" "T1027" "T1028" "T1031" "T1033" "T1035" "T1036" "T1037" "T1040" "T1042" "T1043" "T1047" "T1049" "T1050" "T1053" "T1055" "T1056" "T1060" "T1062" "T1063" "T1065" "T1069" "T1070" "T1073" "T1074" "T1075" "T1076" "T1077" "T1081" "T1082" "T1083" "T1084" "T1085" "T1086" "T1087" "T1088" "T1089" "T1098" "T1103" "T1107" "T1112" "T1115" "T1117" "T1118" "T1119" "T1121" "T1123" "T1124" "T1126" "T1127" "T1128" "T1135" "T1136" "T1138" "T1140" "T1158" "T1170" "T1180" "T1183" "T1191" "T1197" "T1201" "T1202" "T1214" "T1216" "T1218" "T1222" "T1223" "T9000"
goto :runALL
)

:PROMPTMAIN
SET /P AREYOUSURE=Are you sure to proceed (Y/[N])? 
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
GOTO MENU

:PROMPTRUN
SET /P AREYOUSURE=Are you sure to proceed (Y/[N])? 
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
GOTO runSingle



:MENU
CLS
color 07
ECHO ===========================================================================
::TYPE welcome.txt                                                                        
ECHO.
ECHO   Select the test-set that you want to run:
ECHO.
ECHO   [0] Run All Techniques 
ECHO   [1] Run A Single Technique 
ECHO.
ECHO   [M] Menu
ECHO   [E] Exit
ECHO.


set /p INPUT=Your selection (then press ENTER):
IF %INPUT%==0 GOTO runALL
IF %INPUT%==1 GOTO runSingle
IF %INPUT%==M GOTO MENU
IF %INPUT%==m GOTO MENU
IF %INPUT%==e GOTO END
IF %INPUT%==E GOTO END
echo Invalid selection. Exiting.
exit /b



:runALL
:: Running all test sets
SET runALLTechnique="T1002" "T1003" "T1004" "T1007" "T1010" "T1011" "T1012" "T1014" "T1015" "T1016" "T1018" "T1027" "T1028" "T1031" "T1033" "T1035" "T1036" "T1037" "T1040" "T1042" "T1043" "T1047" "T1049" "T1050" "T1053" "T1055" "T1056" "T1060" "T1062" "T1063" "T1065" "T1069" "T1070" "T1073" "T1074" "T1075" "T1076" "T1077" "T1081" "T1082" "T1083" "T1084" "T1085" "T1086" "T1087" "T1088" "T1089" "T1098" "T1103" "T1107" "T1112" "T1115" "T1117" "T1118" "T1119" "T1121" "T1123" "T1124" "T1126" "T1127" "T1128" "T1135" "T1136" "T1138" "T1140" "T1158" "T1170" "T1180" "T1183" "T1191" "T1197" "T1201" "T1202" "T1214" "T1216" "T1218" "T1222" "T1223" "T9000"
for %%i in (%runALLTechnique%) do (
    ECHO.
    ECHO.
    for /f "delims=" %%x in ('dir /b /a-d .\Payloads\%%i\*.bat') do (
        :: Random wait time
        IF %SINTERVAL%==ON (
            CALL:RAND %SECONDMAX%
            ECHO Waiting !RANDNUM! seconds ...
            ping 127.0.0.1 -n !RANDNUM! > nul
        )
        call ".\Payloads\%%i\%%x"
    )
)
ECHO.
ECHO Execution Completed, Going Back to Main Menu..?
ECHO.
GOTO PROMPTMAIN



:runSingle
CLS
color 0E
ECHO ===========================================================================
set /p Technique=Provide a Technique ID to RUN:
%Technique% 2> nul
CLS
IF EXIST .\Payloads\%Technique% (
	for /f "delims=" %%x in ('dir /b /a-d .\Payloads\%Technique%\*.bat') do (
		call ".\Payloads\%Technique%\%%x"
	)
ECHO ===========================================================================
ECHO Finished!
ECHO Check for errors and make sure you opened the command line as 'Administrator'
ECHO ===========================================================================
ECHO.
ECHO.
ECHO Do You Want To Proceed With another Technique..?
ECHO.
GOTO PROMPTRUN
) ELSE (
color 0C
ECHO.
CLS
ECHO ===========================================================================
ECHO Technique ID '%Technique%' Is Not Avaiable...! 
ECHO Make sure the provided Technique is avaliable in Payloads Directory.
ECHO.
ECHO Going Back to Main Menu...
ECHO.
GOTO PROMPTMAIN
)




if NOT [%1]==[-b] (
PAUSE
GOTO MENU 

:RAND
SET /A RANDNUM=%RANDOM% %%(%1) +1
GOTO:EOF
)

:END
ECHO.
color 07
endlocal
