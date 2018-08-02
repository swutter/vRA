$sc= {
Import-Module ActiveDirectory
$Machine = $env:COMPUTERNAME
$computer = Get-ADObject -Filter {(Name -eq $Machine) -and (ObjectClass -eq "computer")}
Add-ADGroupMember -id 'NA01_Dev_Baseline' -members $computer
Add-ADGroupMember -id 'NA01_Dev_WindowsUpdates_G1' -members $computer
}


$SvcUser = ''
$SvcInput = ''
$tok = $SvcInput | ConvertTo-SecureString -key (1..16)
$credential = New-Object System.Management.Automation.PsCredential($SvcUser,$tok)
$jobs = @()
$jobs += start-job -credential $credential –scriptblock $sc
$jobs | wait-job -timeout 120
