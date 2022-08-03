function New-JBCompany {

    <#
    .OUTPUTS 
    The newly created or matching company id
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]$name,
        [Parameter(Mandatory = $false)]
        [String[]]$EmailDomains
    )

    if ($PSBoundParameters["EmailDomains"]) {
        $PSBoundParameters["EmailDomains"] = $PSBoundParameters["EmailDomains"] -join ";"
    }

    $Params = @{
        Api    = "Company"
        Method = "POST"
        body   = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}