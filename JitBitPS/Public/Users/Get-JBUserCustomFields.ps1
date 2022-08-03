function Get-JBUserCustomFields {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$userId
    )

    $Params = @{
        Api  = "UserCustomFields"
        Body = [Collections.Hashtable]::New($PSBoundParameters)
    }
            
    Invoke-JBMethod @Params
}