#Iterate through AD servers pulling single user's details.ps1
#This won't work until we move all DC's to Windows 2008 or higher.
#Parameters
param (
[string]$file =$(throw "-file is required.")
[string]$user =$(throw "-user is required.")
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
get-aduser -Server $line -Filter { CN -eq $user} -Properties * #This line matches by CN
}
