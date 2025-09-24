# while ($true) {
#     Write-Host "Hello, World!"
# }

# Write-Host "Hello, World!"
# Start-Sleep -Seconds 5

[CmdletBinding()]
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
