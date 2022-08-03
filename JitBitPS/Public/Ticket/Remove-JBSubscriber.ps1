function Remove-JBSubscriber {
    <# 
    .SYNOPSIS
    Removes a subscriber from a ticket

    .PARAMETER id
    Ticket id

    .PARAMETER userId
    The subscriber's user-id

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$id,
        [Parameter(Mandatory = $true)]
        [String]$userId
    )

    $Params = @{
        Api    = "RemoveSubscriber"
        Method = "POST"
        Body   = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}