function Get-JBArticle {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$Id
    )

    $Params = @{
        Api  = "Article"
        body = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}