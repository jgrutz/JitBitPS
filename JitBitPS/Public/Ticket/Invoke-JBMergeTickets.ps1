function Invoke-JBMergeTickets {
    <#
    .SYNOPSIS
    Merge two tickets together. This action is irreversible

    .PARAMETER Id
    The primary ticket id

    .PARAMETER Id2
    The merged ticket. The original will be deleted

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$Id,
        [Parameter(Mandatory = $true)]
        [int]$Id2
    )

    $Params = @{
        Api    = "MergeTickets"
        Method = "POST"
        Body   = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}