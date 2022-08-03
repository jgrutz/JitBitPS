function Get-JBCompanyCustomFields {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$id
    )

    $Params = @{
        Api  = "CompanyCustomFields"
        body = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}