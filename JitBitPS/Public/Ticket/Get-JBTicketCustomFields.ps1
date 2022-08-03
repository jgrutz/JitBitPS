function Get-JBTicketCustomFields {
    <#
    .SYNOPSIS
    View all ticket custom fields with their values

    .PARAMETER id
    Ticket ID

    .PARAMETER ReturnUnset
    Return custom fields with unset values

    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [int]
        $id,
        [Parameter()]
        [Switch]$ReturnUnset
    )

    $Params = @{
        Api  = "TicketCustomFields"
        Body = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}