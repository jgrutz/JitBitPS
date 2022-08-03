function Save-JBToken {
    <#
    .SYNOPSIS
    Writes the given token to the given file path using the Windows Data Protection API.

    .DESCRIPTION
    Writes the given token to the given file path using the Windows Data Protection API.  
    This file will only work with the account used on the specific machine the code is run on.
    A user can find their token at https://***.com/helpdesk/User/Token

    .PARAMETER FilePath
    Where would you like the file to be stored? 
    
    .PARAMETER SecureToken
    Use token as a SecureString

    .PARAMETER Credential
    Supply the Token as the password in a Credential object if that's easier with ex Get-Credential

    #>

    [CmdletBinding()]
    param (
        [Parameter(ParameterSetName = 'Connect with Token',Mandatory = $false)]
        [Parameter(ParameterSetName = 'Connect with Credential',Mandatory = $false)]
        [String]$FilePath = (Get-JBDefaultTokenPath),
        [Parameter(ParameterSetName = 'Connect with token',Mandatory)]
        [SecureString]$SecureToken,
        [Parameter(ParameterSetName = 'Connect with Credential',Mandatory)]
        [PSCredential]$Credential
    )

    # TODO save the url as the username of the credential
    PROCESS {
        switch ($PsCmdlet.ParameterSetName) {
            'Connect with Credential' {
                $SecureToken = $Credential.Password
            }
            'Connect with Token' {
                # intentionally blank
            }
        }

        if(-not (Test-Path $FilePath)){
            New-Item $FilePath -Force
        }
        Export-Clixml -Path $FilePath -InputObject $SecureToken -Force 
    }
}