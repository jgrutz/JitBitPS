function Get-JBTicketIntegrationData {
    <#
    .SYNOPSIS
    Returns all ticket integration data - Jira, Github, etc.

    .PARAMETER Id
    ticket id

    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$Id
    )
        
    $Params = @{
        Api  = "TicketIntegrationData"
        Body = $PSBoundParameters
    }
        
    Invoke-JBMethod @Params
}