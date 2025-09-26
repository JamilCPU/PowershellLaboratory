param([hashtable]$Userdata)

function Write-User-Data {
    param([hashtable]$UserData)
    Write-Host "Save.ps1 reached!"
    $UserData
    "save.ps1 ran!" | Out-File -FilePath ../../output/userData.txt

}

Write-User-Data($UserData)