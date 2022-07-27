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
        body   = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}

function Add-JBAssetToTicket {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$AssetId,
        [Parameter(Mandatory)]
        [int]$TicketId
    )

    $Params = @{
        Api    = "AddAssetToTicket"
        Method = "POST"
        body   = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}