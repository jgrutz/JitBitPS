function Set-JBAssetCustomField {
    <# 
    .PARAMETER value
    Value as a string. For checkboxes pass true or false. For dropdowns pass the option ID. For dates pass date as a string in any format.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$id,
        [Parameter(Mandatory)]
        [int]$fieldId,
        [Parameter(Mandatory)]
        [String]$value
    )

    $Params = @{
        Api    = "SetCustomFieldForAsset"
        Method = "POST"
        body   = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}