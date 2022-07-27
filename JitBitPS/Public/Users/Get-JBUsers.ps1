function Get-JBUsers {
    <#
    .SYNOPSIS
    Get a list of all users in the helpdesk app.  Requires "helpdesk-administrator" permissions.

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