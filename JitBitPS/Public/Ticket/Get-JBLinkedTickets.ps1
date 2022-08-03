function Get-JBLinkedTickets {
    <#
    .SYNOPSIS
    Get the linked tickets for a given ticket

    .PARAMETER Id
    ticket id

    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$Id
    )
        
    $Params = @{
        Api  = "LinkedTickets"
        Body = [Collections.Hashtable]::New($PSBoundParameters)
    }
        
    Invoke-JBMethod @Params
}