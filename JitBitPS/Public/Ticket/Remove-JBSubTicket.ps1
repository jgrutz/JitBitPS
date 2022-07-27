function Remove-JBSubTicket {
    <#
    .SYNOPSIS
    Remove subticket

    .PARAMETER ChildId
    The child ticket id

    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$ChildId
    )
        
    $Params = @{
        Api    = "RemoveSubTicket"
        Method = "POST"
        Body   = $PSBoundParameters
    }
        
    Invoke-JBMethod @Params
}