@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: Audio Capture	(T1123)
ECHO.
ECHO  - Executing via SoudRecoder
cmd /c SoundRecorder /FILE %EXFIL%\audio_capture01.wma /DURATION 0000:00:30
ECHO     - saving captured file to %EXFIL%
ECHO  - Executing via Powershell
cmd /c powershell.exe -Command WindowsAudioDevice-Powershell-Cmdlet > $null
ECHO.
