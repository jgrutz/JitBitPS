# Install and Import the module
Install-Module JitBitPS
Import-Module JitBitPS
Get-Command -Module JitBitPS

# Setup and Test connection 
$Credential = Get-Credential -Message "Enter your user token in the password field"
Save-JBToken -Credential $Credential

$SecureToken = Read-JBStoredToken
Connect-JitBit -SecureToken $SecureToken -url "https://***.com/helpdesk"
Test-JBConnection

# Do some actual work
Get-JBStats
Get-JBTickets

New-JBTicket -CategoryId 4 -Body "<p><Strong>omg</strong> fix the broken stuff</p>" -Subject "Everything is broken"
