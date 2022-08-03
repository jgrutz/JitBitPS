function Invoke-JBUnlinkTickets {
    <#
    .SYNOPSIS
    Removes the link between two tickets

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
        Api    = "UnlinkTickets"
        Method = "POST"
        Body   = [Collections.Hashtable]::New($PSBoundParameters)
    }
    
    Invoke-JBMethod @Params
}