#Ref: https://brianreiter.org/2010/09/03/copy-and-paste-with-clipboard-from-powershell/
#Ref: https://github.com/EmpireProject/Empire/blob/master/data/module_source/collection/Get-ClipboardContents.ps1
function Get-ClipboardText()
{
    Add-Type -AssemblyName System.Windows.Forms
    $tb = New-Object System.Windows.Forms.TextBox
    $tb.Multiline = $true
    $tb.Paste()
    $tb.Text
}
$getclip = Get-ClipboardText
IEX($getclip)
