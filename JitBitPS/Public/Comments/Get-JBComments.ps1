function Get-JBComments {
    <#
    .SYNOPSIS
    Gets comments of the specified ticket

    .PARAMETER Id
    ticket id

    #>
        
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$Id
    )

    $Params = @{
        Api  = "comments"
        Body = $PSBoundParameters
    }
            
    Invoke-JBMethod @Params
    
}