function Get-JBAsset {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$Id
    )

    $Params = @{
        Api  = "Asset"
        body = [Collections.HashTable]::new($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}