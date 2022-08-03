function Get-JBSubscribers {
    <# 
    .SYNOPSIS
    Get a list of subscribers from a ticket

    .PARAMETER id
    Ticket id

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$id
    )

    $Params = @{
        Api  = "Subscribers"
        Body = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}