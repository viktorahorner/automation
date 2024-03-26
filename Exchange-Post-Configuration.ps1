
Connect-ExchangeOnline -AppId $ApplicationId -CertificateThumbprint $CertificateThumbprint -Organization $TenantId

Set-OrganizationConfig -FocusedInboxOn $false –SendFromAliasEnabled $false -Verbose
Get-Mailboxplan | Set-Mailboxplan -MaxSendSize 50MB -MaxReceiveSize 50MB -RetainDeletedItemsFor 30 -RoleAssignmentPolicy "DenyForwardingRoleAssignmentPolicy" -Verbose
Get-CASMailboxPlan -Filter {ImapEnabled -eq "true" -or PopEnabled -eq "true" } | set-CASMailboxPlan -ImapEnabled $false -PopEnabled $false -Verbose

$remotedomains = Get-AcceptedDomain | ?{$_.domainname -inotlike '*onmicrosoft.com*'}

foreach ($remotedomain in $remotedomains)
{

New-RemoteDomain -Name ('notes.'+$remotedomain.domainname) -DomainName ('notes.'+$remotedomain.domainname)
Set-RemoteDomain -Identity ('notes.'+$remotedomain.domainname) -CharacterSet UTF-8 -NonMimeCharacterSet utf-8 -TNEFEnabled $false -AllowedOOFType InternalLegacy -IsInternal $true -MeetingForwardNotificationEnabled $true
    New-DkimSigningConfig -DomainName $Remotedomain.DomainName -KeySize 2048 -Enabled $false
        Write-Host "DKim Added" $Remotedomain

}
#Remote-Domains configuration stop
