$tenantname = 'tenant'
$targetfolder = 'C:\temp\'
New-SelfSignedCertificate -DnsName ($tenantname+".onmicrosoft.com") -CertStoreLocation "cert:\CurrentUser\My" -NotAfter (Get-Date).AddYears(1) -KeySpec KeyExchange | Export-PfxCertificate -FilePath ($targetfolder+'mycert.pfx') -Password (Read-Host -AsSecureString -Prompt "Enter a Password for PFX File")
(get-childitem Cert:\CurrentUser\my) | Where-Object {$_.Subject -eq ("cn="+$tenantname+".onmicrosoft.com")} | Export-Certificate -FilePath ($targetfolder+$tenantname+'-exo.cer')
