function Get-JBArticles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [int]$CategoryId
    )

    $Params = @{
        Api = "Articles"
    }

    if ($PSBoundParameters.Count -gt 0) {
        $params.Add("Body", [Collections.Hashtable]::New($PSBoundParameters))
    }

    Invoke-JBMethod @Params
}