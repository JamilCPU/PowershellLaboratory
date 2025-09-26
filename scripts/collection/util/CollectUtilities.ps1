function Call-Save-UserData{
    Param([hashtable]$UserData)
    Write-Host "Attempting to call save.ps1..."

    
    Start-Process powershell -ArgumentList @(
        "-File", "../storage/Save.ps1",
        "-UserData", $UserData,
        "-DebugMode"
    )
    #../storage/Save.ps1 -UserData $UserData
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