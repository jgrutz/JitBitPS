<#
.SYNOPSIS
Update the given Company

.PARAMETER id
The company id

.PARAMETER name
The company's name

.PARAMETER notes
Administrative notes
#>
function Set-JBCompany {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$id,
        [Parameter(Mandatory = $false)]
        [String]$name,
        [Parameter(Mandatory = $false)]
        [String]$notes
    )

    $Params = @{
        Api    = "UpdateCompany"
        Method = "POST"
        body   = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}