function Get-JBUserByUsername {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String]$Username
    )

    $Params = @{
        Api  = "UserByUsername"
        Body = $PSBoundParameters
    }
            
    Invoke-JBMethod @Params
}