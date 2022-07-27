function Enable-JBRule {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$Id
    )

    $Params = @{
        Api = "EnableRule/$id"
    }

    Invoke-JBMethod @Params
}