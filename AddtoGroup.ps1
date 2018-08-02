$sc= {
Import-Module ActiveDirectory
$Machine = $env:COMPUTERNAME
$computer = Get-ADObject -Filter {(Name -eq $Machine) -and (ObjectClass -eq "computer")}
Add-ADGroupMember -id 'NA01_Dev_Baseline' -members $computer
Add-ADGroupMember -id 'NA01_Dev_WindowsUpdates_G1' -members $computer
}


$SvcUser = 'dev.adcinternal.com\ssna01jdom'
$SvcInput = '76492d1116743f0423413b16050a5345MgB8AHgAZABZAGEAeAB0AHgATQB6ACsAMABuAGwATwBUAE8AegBWAFQAbQBOAHcAPQA9AHwAYgA5AGYAMQBmADYANQAyAGQAZQA3AGQAOQBhADgANQAyADAAMAA5AGIAMAAwADIAYgBmADQAOQBkAGMAYQBhAGMAZQAwADEANAA0AGUAZQAwAGIAZgBlADYAYQA3ADUANABlADUANwBkAGIAYQAyADAAZABiADgAYQBiADAANAA='
$tok = $SvcInput | ConvertTo-SecureString -key (1..16)
$credential = New-Object System.Management.Automation.PsCredential($SvcUser,$tok)
$jobs = @()
$jobs += start-job -credential $credential –scriptblock $sc
$jobs | wait-job -timeout 120