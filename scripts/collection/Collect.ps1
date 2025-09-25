. .\util\CollectUtilities.ps1


$appLog = @{}


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




try {
    while ($true) {
        $wait = Get-Random -Minimum 5 -Maximum 35
        Write-Host "Waiting for $wait seconds"
        $process = Get-ActiveProcess
        Start-Sleep -Seconds $wait
        if ($appLog[$process.processName]) {
            $appLog[$process.processName] += $wait
        }
        else {
            $appLog[$process.processName] = $wait
        }
        #$appLog | Out-File -FilePath ../../output/userData.txt
        $appLog
    }
}
finally {
    Call-Save-UserData($appLog)

}
