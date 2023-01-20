function New-PasswordHash{
$global:searchrequestlocation = 'C:\temp\' #location of your password hash token
$cred = Get-Credential
$cred.Password | ConvertFrom-SecureString | Out-File ($global:searchrequestlocation+'\Password.pwd')
return $cred
}
