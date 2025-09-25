function Call-Save-User-Data{
    Param([hashtable]$UserData)
    Write-Host "Attempting to call save.ps1..."
    ./save.ps1 -UserData $UserData
}

function Get-ActiveProcess {

    Param()    
    Add-Type @"
  using System;
  using System.Runtime.InteropServices;

public class UserWindows {
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();
}
"@
    $ActiveHandle = [UserWindows]::GetForegroundWindow()
    Get-Process | ? {$_.MainWindowHandle -eq $ActiveHandle}
}



$appLog = @{}


try {
    $file = Get-Content -Path ../output/userData.txt 

    
    ForEach ($line in $file) {
        $line | Select-Object Name, Value | ForEach-Object {
            Write-Host $_.Name
            Write-Host$_.Value
        # for($i = 0; $i -lt $line.Length; $i++){
        #         $line
        #     }
        }

 }
}
 catch {
}





# while($true){
#     $wait = Get-Random -Minimum 5 -Maximum 35
#     Write-Host "Waiting for $wait seconds"
#     $process = Get-ActiveProcess
#     Start-Sleep -Seconds $wait
#     if($appLog[$process.processName]){
#         $appLog[$process.processName] += $wait
#     }else{
#         $appLog[$process.processName] = $wait
#     }
#     $appLog | Out-File -FilePath ../output/userData.txt

# }

Call-Save-User-Data($appLog)
