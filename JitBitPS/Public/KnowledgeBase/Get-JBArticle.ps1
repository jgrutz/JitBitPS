function Get-JBArticle {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$Id
    )

    $Params = @{
        Api  = "Article"
        body = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}