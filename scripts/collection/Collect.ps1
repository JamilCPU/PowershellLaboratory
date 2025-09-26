. .\util\CollectUtilities.ps1




# try {
#     $file = Get-Content -Path ../../output/userData.txt 

    
#     ForEach ($line in $file) {
#         $line | Select-Object Name, Value | ForEach-Object {
#             Write-Host $_.Name
#             Write-Host$_.Value
#         # for($i = 0; $i -lt $line.Length; $i++){
#         #         $line
#         #     }
#         }

#  }
# }
#  catch {
# }


$UserData = @{}


$counter = 0

while ($true) {
    $wait = Get-Random -Minimum 5 -Maximum 35
    Write-Host "Waiting for $wait seconds"
    $process = Get-ActiveProcess
    Start-Sleep -Seconds $wait
    if ($UserData[$process.processName]) {
        $UserData[$process.processName] += $wait
    }
    else {
        $UserData[$process.processName] = $wait
    }
    $UserData
    if ($counter -eq 5) {
        Write-Host "Writing to file..."
        $UserData | Out-File -FilePath ../../output/userData.txt
        $counter = 0
    }
    else {
        $counter++
    }
}