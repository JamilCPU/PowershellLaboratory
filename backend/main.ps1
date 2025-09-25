# while ($true) {
#     Write-Host "Hello, World!"
# }

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

$appLog = @{
}



while($true){
    $wait = Get-Random -Minimum 5 -Maximum 35
    Write-Host "Waiting for $wait seconds"
    $process = Get-ActiveProcess
    Start-Sleep -Seconds $wait
    if($appLog[$process.processName]){
        $appLog[$process.processName] += $wait
    }else{
        $appLog[$process.processName] = $wait
    }
    $appLog | Out-File -FilePath ../output/userData.txt

}