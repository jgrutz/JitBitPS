function Set-JBAsset {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$id,
        [Parameter(Mandatory = $false)]
        [String]$modelName,
        [Parameter(Mandatory = $false)]
        [String]$manufacturer,
        [Parameter(Mandatory = $false)]
        [String]$type,
        [Parameter(Mandatory = $false)]
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
        Api    = "SetCustomFieldForAsset"
        Method = "POST"
        body   = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}