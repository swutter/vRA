$name = (Get-Content C:\scripts\owner.txt)
$pos = $name.IndexOf("@")
$User = $name.Substring(0, $pos)
$Domain = $name.Substring($pos+1)

& net localgroup Administrators /add $Domain\$User