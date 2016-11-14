#Iterate file in groups from AD users.ps1
#Parameters
param (
[string]$file =$(throw "-file is required.")
)
#Modules
Import-Module ActiveDirectory #Make sure we have the AD commands available
#
#Script
$data = Get-Content $file #read in file
write-host $data.count total lines read from file #line count
foreach ($line in $data | Where { $_ -notmatch '^#.*' -and $_ -notmatch '^\s*$' }) #ignore commented (#) or blank lines in input file
{
#get-aduser $line -Properties MemberOf #this line matches by SamAccountName
get-aduser -Filter { CN -eq $line} -Properties MemberOf #This line matches by CN
}
