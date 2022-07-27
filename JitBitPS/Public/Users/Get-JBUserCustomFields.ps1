function Get-JBUserCustomFields {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$userId
    )

    $Params = @{
        Api  = "UserCustomFields"
        Body = $PSBoundParameters
    }
            
    Invoke-JBMethod @Params
}