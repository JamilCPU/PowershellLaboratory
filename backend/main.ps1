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


Start-Sleep -Seconds 5
$process = Get-ActiveProcess
$appLog[$process.processName] = 5
$appLog