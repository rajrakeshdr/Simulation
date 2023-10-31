function Clear-WinEvents
{
    <#
    .SYNOPSIS
       Clear Windows Event Logs
    .DESCRIPTION
       Script that leverages the System.Diagnostics.Eventing.Reader.EventLogSession .NET class to clear Windows event logs.
    .EXAMPLE
       PS> Clear-WinEvents -Channel Security
    .EXAMPLE
       PS> @('Security','Microsoft-Windows-Sysmon/Operational') | Clear-WinEvents
    .NOTES
        Author: Roberto Rodriguez (@Cyb3rWard0g)
        License: BSD 3-Clause
    .LINK
        https://github.com/OTRF/mordor
    #>

    [CmdletBinding(SupportsShouldProcess=$true)]
    Param
    (
        # Event Log Channel to export
        [Parameter(ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true,Mandatory=$true)]
        [string[]]$Channel
    )

    Process
    {
        if ($PSCmdlet.ShouldProcess($Channel))
        {
            try
            {   
                (New-Object System.Diagnostics.Eventing.Reader.EventLogSession).ClearLog("$Channel")
            }  
            catch
            { 
                write-warning $_.Exception         
            }
        }
    }
}

@('system','application','Security','Microsoft-Windows-Sysmon/Operational','Microsoft-Windows-TaskScheduler/Operational','Microsoft-Windows-PowerShell/Operational','Windows PowerShell','Microsoft-Windows-WinRM/Operational','Microsoft-Windows-WMI-Activity/Operational') | Clear-WinEvents;
