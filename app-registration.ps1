

$filepath = 'C:\temp\Customer’

Install-Module -Name Microsoft365DSC -Force -Verbose
Update-Module Microsoft365DSC
Update-M365Dependencies


Connect-MgGraph -Scopes 'Application.ReadWrite.All'
$credential = Get-Credential

$params = @{
    ApplicationName = 'Microsoft365DSC'
    Permissions     = @(@{Api='Graph';PermissionName='Agreement.Read.All'},@{Api='Graph';PermissionName='Application.Read.All'},@{Api='Graph';PermissionName='Directory.ReadWrite.All'},@{Api='Graph';PermissionName='Group.ReadWrite.All'},@{Api='Graph';PermissionName='GroupMember.ReadWrite.All'},@{Api='Graph';PermissionName='Policy.Read.All'},@{Api='Graph';PermissionName='Policy.ReadWrite.ConditionalAccess'},@{Api='Graph';PermissionName='RoleManagement.ReadWrite.Directory'},@{Api='Graph';PermissionName='User.ReadWrite.All'})
    Type            = 'Certificate'
    CertificatePath = "$PSScriptRoot\M365DSC.cer"
    Credential      = $credential
}

Update-M365DSCAzureAdApplication @params -AdminConsent -CreateSelfSignedCertificate
