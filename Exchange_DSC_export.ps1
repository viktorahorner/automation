#Exchange Export
$ApplicationId = 'SOURCEAPPID'
$CertificateThumbprint = 'SOURCECERT'
$TenantId = 'CUSTOMERTENANTNAME.onmicrosoft.com'


#Connect-ExchangeOnline -Organization $TenantId -AppId $ApplicationId -CertificateThumbprint $CertificateThumbprint
# Exporting resources using credentials
$servicename = 'Exchange'
$customer = 'CUSTOMERTENANTNAME'
$filepath = 'C:\temp\CUSTOMERTENANTNAME'
try
{
New-Item -ItemType Directory -Path $filepath -Name $servicename -ErrorAction Stop
}
catch
{
Write-Host $servicename' folder is persisting'
}
Set-Location -Path ($filepath+'\'+$servicename)

Export-M365DSCConfiguration -Components @("EXOAcceptedDomain", "EXOActiveSyncDeviceAccessRule", "EXOAddressBookPolicy", "EXOAddressList", "EXOAntiPhishPolicy", "EXOAntiPhishRule", "EXOApplicationAccessPolicy", "EXOAtpPolicyForO365", "EXOAuthenticationPolicy", "EXOAuthenticationPolicyAssignment", "EXOAvailabilityAddressSpace", "EXOAvailabilityConfig", "EXOClientAccessRule", "EXODataClassification", "EXODataEncryptionPolicy", "EXODkimSigningConfig", "EXOEmailAddressPolicy", "EXOGlobalAddressList", "EXOHostedConnectionFilterPolicy", "EXOHostedContentFilterPolicy", "EXOHostedContentFilterRule", "EXOHostedOutboundSpamFilterPolicy", "EXOHostedOutboundSpamFilterRule", "EXOInboundConnector", "EXOIntraOrganizationConnector", "EXOIRMConfiguration", "EXOJournalRule", "EXOMailTips", "EXOMalwareFilterPolicy", "EXOMalwareFilterRule", "EXOManagementRole", "EXOManagementRoleAssignment", "EXOMessageClassification", "EXOOfflineAddressBook", "EXOOMEConfiguration", "EXOOnPremisesOrganization", "EXOOrganizationConfig", "EXOOrganizationRelationship", "EXOOutboundConnector", "EXOOwaMailboxPolicy", "EXOPartnerApplication", "EXOPerimeterConfiguration", "EXOPlace", "EXOPolicyTipConfig", "EXOQuarantinePolicy", "EXORemoteDomain", "EXOReportSubmissionPolicy", "EXOReportSubmissionRule", "EXOResourceConfiguration", "EXORoleAssignmentPolicy", "EXORoleGroup", "EXOSafeAttachmentPolicy", "EXOSafeAttachmentRule", "EXOSafeLinksPolicy", "EXOSafeLinksRule", "EXOSharingPolicy", "EXOTransportConfig", "EXOTransportRule") -Path ($filepath+'\'+$servicename) -CertificateThumbprint $CertificateThumbprint -TenantId $TenantId -ApplicationId $ApplicationId
New-M365DSCReportFromConfiguration -Type HTML -ConfigurationPath ($filepath+'\'+$servicename+'\M365TenantConfig.ps1') -outputpath ($filepath+'\'+$servicename+'\'+$servicename+'_DSC_Export.html')

#Exchange-Config-Export end
