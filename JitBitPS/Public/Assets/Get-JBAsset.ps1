function Get-JBAsset {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$Id
    )

    $Params = @{
        Api  = "Asset"
        body = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}