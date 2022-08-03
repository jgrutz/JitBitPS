function Get-JBUserByUsername {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String]$Username
    )

    $Params = @{
        Api  = "UserByUsername"
        Body = [Collections.Hashtable]::New($PSBoundParameters)
    }
            
    Invoke-JBMethod @Params
}