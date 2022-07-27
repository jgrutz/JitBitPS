function Remove-JBUser {
    <#
    .SYNOPSIS
    Deletes a user. Requires administator permissions. WARNING: There is no undo.

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$userId
    )

    $Params = @{
        Api    = "DeleteUser"
        Method = "POST"
        Body   = $PSBoundParameters
    }
            
    Invoke-JBMethod @Params

}