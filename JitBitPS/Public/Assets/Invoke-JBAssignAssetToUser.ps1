function Invoke-JBAssignAssetToUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$AssetId,
        [Parameter(Mandatory)]
        [int]$UserId
    )

    $Params = @{
        Api    = "AssignAssetToUser"
        Method = "POST"
        body   = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}