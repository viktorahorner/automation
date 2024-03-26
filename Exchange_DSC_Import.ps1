#Import Exchange Configuration start
$ApplicationId = 'DESTAPPID' #Enter destination Application ID here
$CertificateThumbprint = 'DESTCERT' #Enter destination certificate thumbprint here
$TenantId = 'DESTTENANT.onmicrosoft.com' #Enter destination tenant name here

$servicename = 'Exchange'
$customer = 'DESTTENANT'
$filepath = 'C:\temp\DESTTENANT'

Set-Location -Path ($filepath+'\'+$servicename)
.\M365TenantConfig.ps1

Update-M365DSCAllowedGraphScopes -ResourceNameList @("EXOAcceptedDomain", "EXOActiveSyncDeviceAccessRule", "EXOAddressBookPolicy", "EXOAddressList", "EXOAntiPhishPolicy", "EXOAntiPhishRule", "EXOApplicationAccessPolicy", "EXOAtpPolicyForO365", "EXOAuthenticationPolicy", "EXOAuthenticationPolicyAssignment", "EXOAvailabilityAddressSpace", "EXOAvailabilityConfig", "EXOClientAccessRule", "EXODataEncryptionPolicy", "EXODkimSigningConfig", "EXOEmailAddressPolicy", "EXOGlobalAddressList", "EXOHostedConnectionFilterPolicy", "EXOHostedContentFilterPolicy", "EXOHostedContentFilterRule", "EXOHostedOutboundSpamFilterPolicy", "EXOHostedOutboundSpamFilterRule", "EXOInboundConnector", "EXOIntraOrganizationConnector", "EXOIRMConfiguration", "EXOJournalRule", "EXOMailTips", "EXOMalwareFilterPolicy", "EXOMalwareFilterRule", "EXOManagementRole", "EXOManagementRoleAssignment", "EXOMessageClassification", "EXOOfflineAddressBook", "EXOOMEConfiguration", "EXOOnPremisesOrganization", "EXOOrganizationConfig", "EXOOrganizationRelationship", "EXOOutboundConnector", "EXOOwaMailboxPolicy", "EXOPartnerApplication", "EXOPerimeterConfiguration", "EXOPlace", "EXOPolicyTipConfig", "EXOQuarantinePolicy", "EXORemoteDomain", "EXOReportSubmissionPolicy", "EXOReportSubmissionRule", "EXOResourceConfiguration", "EXORoleAssignmentPolicy", "EXORoleGroup", "EXOSafeAttachmentPolicy", "EXOSafeAttachmentRule", "EXOSafeLinksPolicy", "EXOSafeLinksRule", "EXOSharingPolicy", "EXOTransportConfig", "EXOTransportRule") -Type Update 

Get-Service WinRM | Start-Service
Start-DscConfiguration -Path '.\M365TenantConfig\' -Wait -Verbose -Force

#https://learn.microsoft.com/en-us/answers/questions/333380/the-winrm-client-sent-a-request-to-the-remote-ws-m

#Import Exchange Configuration end
