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
        body   = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}