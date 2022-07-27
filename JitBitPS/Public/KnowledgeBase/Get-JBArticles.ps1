function Get-JBArticles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [int]$CategoryId
    )

    $Params = @{
        Api = "Articles"
    }

    if ($PSBoundParameters) {
        $params.Add("Body", $PSBoundParameters)
    }

    Invoke-JBMethod @Params
}