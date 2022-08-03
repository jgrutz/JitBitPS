function Add-JBSubscriber {
    <# 
    .SYNOPSIS
    Adds a new subscriber to a ticket

    .PARAMETER id
    Ticket id

    .PARAMETER userId
    The new subscriber's user-id

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$id,
        [Parameter(Mandatory = $true)]
        [String]$userId
    )

    $Params = @{
        Api    = "AddSubscriber"
        Method = "POST"
        Body   = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}