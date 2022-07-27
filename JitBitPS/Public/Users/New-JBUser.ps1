function New-JBUser {

    <#
    .SYNOPSIS 
    Creates a new user. Requires "helpdesk-administrator" permissions
    
    .OUTPUTS
    the userId of the newly created user

    .PARAMETER username
    username, should not be taken by another user

    .PARAMETER Company
    Set users' company. If the company doesn't exist, it will be created

    .PARAMETER Department
    Set user's department. If department doesn't exist, it will be created

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String]$username,
        [Parameter(Mandatory = $true)]
        [String]$password,
        [Parameter(Mandatory = $true)]
        [String]$Email,
        [Parameter(Mandatory = $true)]
        [String]$FirstName,
        [Parameter(Mandatory = $true)]
        [String]$LastName,
        [Parameter(Mandatory = $true)]
        [String]$Phone,
        [Parameter(Mandatory = $true)]
        [String]$Location,
        [Parameter(Mandatory = $true)]
        [String]$Company,
        [Parameter(Mandatory = $true)]
        [String]$Department,
        [Parameter(Mandatory = $true)]
        [Switch]$SendWelcomeEmail
    )

    $Params = @{
        Api    = "CreateUser"
        Method = "POST"
        Body   = $PSBoundParameters
    }
            
    Invoke-JBMethod @Params
}