function Write-User-Data {
    param([hashtable]$UserData)
    Write-Host "save.ps1 reached!"
    $UserData
}

Write-User-Data