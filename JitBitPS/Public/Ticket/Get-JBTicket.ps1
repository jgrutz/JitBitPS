function Get-JBTicket {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]
        $id
    )
    $body = @{id = $id }
    $Params = @{
        Api  = "ticket"
        Body = $body
    }

    Invoke-JBMethod @params
}