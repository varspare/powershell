Import-Module ActiveDirectory 

get-aduser -Filter { samAccountName -like "SERVICE-*"} | Select samAccountName,Name | Export-Csv -NoType C:\output.csv
