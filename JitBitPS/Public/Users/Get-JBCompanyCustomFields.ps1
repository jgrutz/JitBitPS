function Get-JBCompanyCustomFields {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$id
    )

    $Params = @{
        Api  = "CompanyCustomFields"
        body = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}