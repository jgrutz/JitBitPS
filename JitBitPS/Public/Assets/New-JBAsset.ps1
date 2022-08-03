function New-JBAsset {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]$modelName,
        [Parameter(Mandatory)]
        [String]$manufacturer,
        [Parameter(Mandatory)]
        [String]$type,
        [Parameter(Mandatory)]
        [String]$supplier,
        [Parameter(Mandatory = $false)]
        [String]$serialNumber,
        [Parameter(Mandatory = $false)]
        [String]$location,
        [Parameter(Mandatory = $false)]
        [String]$comments,
        [Parameter(Mandatory = $false)]
        [int]$quantity
    )

    $Params = @{
        Api    = "Asset"
        Method = "POST"
        body   = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}