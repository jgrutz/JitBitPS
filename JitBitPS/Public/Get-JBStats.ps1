function Get-JBStats {
    <#
    .SYNOPSIS
    Gets overall statistics for the ticketing system - number of open tickets, closed, new, unassigned etc.
    #>

    Invoke-JBMethod -Api "Stats"
}