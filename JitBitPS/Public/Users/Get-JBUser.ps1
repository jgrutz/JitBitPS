function Get-JBUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$userId
    )

    $Params = @{
        Api  = "User"
        Body = $PSBoundParameters
    }
            
    Invoke-JBMethod @Params
}