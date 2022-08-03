function Get-JBUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$userId
    )

    $Params = @{
        Api  = "User"
        Body = [Collections.Hashtable]::New($PSBoundParameters)
    }
            
    Invoke-JBMethod @Params
}