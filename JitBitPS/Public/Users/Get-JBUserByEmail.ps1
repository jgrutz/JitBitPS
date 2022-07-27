function Get-JBUserByEmail {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String]$Email
    )

    $Params = @{
        Api  = "UserByEmail"
        Body = $PSBoundParameters
    }
            
    Invoke-JBMethod @Params
}