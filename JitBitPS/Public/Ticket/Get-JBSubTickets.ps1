function Get-JBSubTickets {
    <#
    .SYNOPSIS
    Get the sub tickets for a given ticket (first level deep)

    .PARAMETER Id
    ticket id

    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$Id
    )
        
    $Params = @{
        Api  = "SubTickets"
        Body = $PSBoundParameters
    }
        
    Invoke-JBMethod @Params
}