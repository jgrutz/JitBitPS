function Add-JBSubTicket {
    <#
    .SYNOPSIS
    Makes one ticket a subticket of another

    .PARAMETER ParentId
    The primary ticket id

    .PARAMETER ChildId
    The child ticket id

    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$ParentId,
        [Parameter(Mandatory = $true)]
        [int]$ChildId
    )
        
    $Params = @{
        Api    = "AddSubTicket"
        Method = "POST"
        Body   = [Collections.Hashtable]::New($PSBoundParameters)
    }
        
    Invoke-JBMethod @Params
}