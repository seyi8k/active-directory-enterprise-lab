# PURPOSE - creates Active Directory users from a CSV file.

# DESCRIPTION - Imports user information from a CSV file and creates each user in the appropriate department's OU.

# REQUIREMENTS - Active Directory PowerShell module, appropriate permissions to create AD users.

#Import the Active Directory module
Import-Module ActiveDirectory

# Path to the CSV file containing user information
$CsvPath = ".\data\users.csv"

$TestCsvPath = Test-Path $CsvPath

# Verify the CSV exists before proceeding
if ($TestCsvPath -eq $false) {
     Write-Host "Cannot find CSV file at $CsvPath. Please check the path and try again." -ForegroundColor Red
     return
}

# Prompt for the default password securely
$Password = Read-Host "Enter temporary user password" -AsSecureString

# Import users from CSV
$Users = Import-Csv $CsvPath

foreach ($User in $Users) {
  
     $SamAccountName = $User.Username

     $OUPath = "OU=$($User.OU),OU=Users,OU=Corp,DC=corp,DC=adlab,DC=test"

     # 1. Check if the user already exists in Active Directory
     if (Get-ADUser -Filter "SamAccountName -eq '$SamAccountName'") {
          Write-Host "User $SamAccountName already exists. Skipping." -ForegroundColor Yellow
          continue
     }
     # 2. Attempt to create the user
     try {
          New-ADUser `
               -Name "$($User.FirstName) $($User.LastName)" `
               -GivenName $User.FirstName `
               -Surname $User.LastName `
               -SamAccountName $SamAccountName `
               -UserPrincipalName "$SamAccountName@corp.adlab.test" `
               -Department $User.Department `
               -Path $OUPath `
               -AccountPassword $Password `
               -ChangePasswordAtLogon $true `
               -Enabled $true `
               -ErrorAction Stop

          Write-Host "Successfully created user: $SamAccountName" -ForegroundColor Green
     }
     # 3. Catch and display any errors
     catch {
          Write-Host "Failed to create user $SamAccountName. Error: $($_.Exception.Message)" -ForegroundColor Red -BackgroundColor Black
     }
}