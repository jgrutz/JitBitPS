function Set-JBUser {

    <#
    .SYNOPSIS 
    Updates a user. Requires "helpdesk-administrator" permissions. All parameters except userId are optional
    
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
        [int]$userId,
        [Parameter(Mandatory = $false)]
        [String]$username,
        [Parameter(Mandatory = $false)]
        [String]$password,
        [Parameter(Mandatory = $false)]
        [String]$Email,
        [Parameter(Mandatory = $false)]
        [String]$FirstName,
        [Parameter(Mandatory = $false)]
        [String]$LastName,
        [Parameter(Mandatory = $false)]
        [String]$Phone,
        [Parameter(Mandatory = $false)]
        [String]$Location,
        [Parameter(Mandatory = $false)]
        [String]$Company,
        [Parameter(Mandatory = $false)]
        [String]$Department,
        [Parameter(Mandatory = $false)]
        [Switch]$Disabled,
        [Parameter(Mandatory = $false)]
        [Bool]$EnableEmailNotifications,
        [Parameter(Mandatory = $false)]
        [String]$Greeting,
        [Parameter(Mandatory = $false)]
        [String]$Signature,
        [Parameter(Mandatory = $false)]
        [Bool]$outOfOffice
        
    )

    $Params = @{
        Api    = "UpdateUser"
        Method = "POST"
        Body   = [Collections.Hashtable]::New($PSBoundParameters)
    }
            
    Invoke-JBMethod @Params
}