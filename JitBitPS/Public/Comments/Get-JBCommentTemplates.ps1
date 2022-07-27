function Get-JBCommentTemplates {
    <#
    .SYNOPSIS
    Gets all available "canned responses" from your Helpdesk
    #>

    $Params = @{
        Api = "CommentTemplates"
    }
            
    Invoke-JBMethod @Params
}