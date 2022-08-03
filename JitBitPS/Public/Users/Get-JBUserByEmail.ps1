function Get-JBUserByEmail {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String]$Email
    )

    $Params = @{
        Api  = "UserByEmail"
        Body = [Collections.Hashtable]::New($PSBoundParameters)
    }
            
    Invoke-JBMethod @Params
}