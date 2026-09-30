# PURPOSE - creates Active Directory users from a CSV file.

# DESCRIPTION - Imports user information from a CSV file and creates each user in the appropriate department's OU.

# REQUIREMENTS - Active Directory PowerShell module, appropriate permissions to create AD users.

Import-Module ActiveDirectory

# CSV file containing user information
$CsvPath = ".\data\users.csv"

# Get the current domain distinguished name
$DomainDN = (Get-ADDomain).DistinguishedName

# Prompt for a temporary password
$Password = Read-Host "Enter temporary password for new users" -AsSecureString

# Import users from CSV
$Users = Import-Csv $CsvPath

foreach ($User in $Users) {

    # Build the OU path based on the user's department
    $OUPath = "OU=$($User.OU),OU=Users,OU=Corp,$DomainDN"

    # Build display name and UPN
    $FullName = "$($User.FirstName) $($User.LastName)"
    $UPN = "$($User.Username)@corp.adlab.test"

    Write-Host "Creating user: $FullName"

    New-ADUser `
        -Name $FullName `
        -GivenName $User.FirstName `
        -Surname $User.LastName `
        -SamAccountName $User.Username `
        -UserPrincipalName $UPN `
        -Department $User.Department `
        -Path $OUPath `
        -AccountPassword $Password `
        -Enabled $true `
        -ChangePasswordAtLogon $true
}

Write-Host ""
Write-Host "User creation complete."