function Invoke-JBLinkTickets {
    <#
    .SYNOPSIS
    Links two tickets as 'related'

    .PARAMETER Id
    The primary ticket id

    .PARAMETER Id2
    The secondary ticket

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$Id,
        [Parameter(Mandatory = $true)]
        [int]$Id2
    )

    $Params = @{
        Api    = "LinkTickets"
        Method = "POST"
        Body   = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}