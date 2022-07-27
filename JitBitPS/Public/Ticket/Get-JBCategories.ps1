function Get-JBCategories {
    
    $Params = @{
        Api    = "categories"
        Method = "GET"
    }

    Invoke-JBMethod @Params
}