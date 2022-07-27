function Set-JBCompanyCustomField {

    <#
    .PARAMETER value
    Value as a string. For checkboxes pass true or false. For dropdowns pass the option ID. For dates pass date as a string in any format.
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$id,
        [Parameter(Mandatory = $false)]
        [int]$fieldId,
        [Parameter(Mandatory = $false)]
        [String]$value
    )

    $Params = @{
        Api    = "SetCustomFieldForCompany"
        Method = "POST"
        body   = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}