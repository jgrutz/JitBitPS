# JitBitPS

This is a PowerShell wrapper for interacting with the [JitBit](https://www.jitbit.com/helpdesk/) Helpdesk [REST API](https://www.jitbit.com/helpdesk/helpdesk-api#/). It currently requires PowerShell v7 or higher.

## Instructions

    # Install and import the module from PowerShell Gallery
    Install-Module JitBitPS
    Import-Module JitBitPS
    
    # Set your user token.  You can get your user token by visiting /User/Token/ page in the helpdesk app
    # Setup and Test connection

    $Credential  =  Get-Credential  -Message "Enter your user token in the password field"

    Save-JBToken  -Credential $Credential

## Usage
    # Get your previously saved token or from Microsoft.PowerShell.SecretManagement
    $SecureToken  =  Read-JBStoredToken

    # Tell JitBitPS how to connect
    Connect-JitBit  -SecureToken $SecureToken  -url "https://***.com/helpdesk"

    Test-JBConnection

    # Do Some Fun stuff
    Get-JBStats
    Get-JBTickets
    New-JBTicket -CategoryId 4 -Body "<p><Strong>omg</strong> fix the broken stuff</p>" -Subject "Everything is broken"