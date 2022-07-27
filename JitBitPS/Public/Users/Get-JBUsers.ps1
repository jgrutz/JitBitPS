function Get-JBUsers {
    <#
    .SYNOPSIS
    Get a list of all users in the helpdesk app.  Requires "helpdesk-administrator" permissions.

    .PARAMETER Count
    The number of users to return. Default: 500

    .PARAMETER Page 
    Used to get the next set of users after the first one. so $Count=50 returns the first 50 users and $Count=50,$Page=2 returns the following 50 users
    
    .PARAMETER listMode
        * all - All users
        * techs - techs including admins
        * admins - admins only
        * regular - only regular users
        * disabled - show deactivated users

    .PARAMETER departmentId
    return users from a specific department

    .PARAMETER companyId
    return users from a specific company

    .OUTPUTS
    Any matching users

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [int]$Count,
        [Parameter(Mandatory = $false)]
        [int]$Page,
        [Parameter(Mandatory = $false)]
        [int]$listMode,
        [Parameter(Mandatory = $false)]
        [int]$departmentId,
        [Parameter(Mandatory = $false)]
        [int]$companyId
    )

    $Params = @{
        Api = "UserCustomFields"
    }

    if ($PSBoundParameters) {
        $Params.Add("Body", $PSBoundParameters)
    }
            
    Invoke-JBMethod @Params
}