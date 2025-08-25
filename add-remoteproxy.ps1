function add-remoteproxy()
{
$domainsufix = '@fromonpremtocloud.mail.onmicrosoft.com'
$mailliste = Get-RemoteMailbox | ?{$_.RemoteRoutingAddress -notlike '*mail.onmicrosoft.com*' -or $_.RemoteRoutingAddress -eq ''} 
foreach ($mail in $mailliste)
{
Write-Host 'RemoteRoutingAddres for the user '+$mail.PrimarySmtpAddress.Address+' is beeing configured to '((($mail.PrimarySmtpAddress.Address) -split('@'))[0]+('@mecklenburgischede.mail.onmicrosoft.com')) -ForegroundColor DarkYellow
try
{
Set-RemoteMailbox $mail.PrimarySmtpAddress.Address -RemoteRoutingAddress ((($mail.PrimarySmtpAddress.Address) -split('@'))[0]+($domainsufix)) -ErrorAction Stop
Write-Host 'Configuration was successful' -ForegroundColor Green
}
catch
{
Write-Host 'configuration failed ' -ForegroundColor DarkGray
Write-Warning $_.Exception.Message
}
}
}
add-remoteproxy
