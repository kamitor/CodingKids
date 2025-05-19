# chocolony.ps1
# Run this script in PowerShell as Administrator

Set-ExecutionPolicy Bypass -Scope Process -Force

# --- Install Chocolatey if missing ---
if (!(Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Chocolatey..."
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# --- Upgrade Chocolatey and install tools ---
choco upgrade chocolatey -y

$appsToInstall = @(
    "brave",
    "scratch-desktop",
    "audacity",
    "inkscape",
    "lmms",
    "sonic-pi",
    "obs-studio"
)

foreach ($app in $appsToInstall) {
    Write-Host "Installing $app..."
    choco install $app -y --ignore-checksums
}

# --- Disable system sounds ---
Write-Host "Disabling system sounds..."
$soundEvents = @(
    "SystemAsterisk", "SystemExclamation", "SystemExit", "SystemHand",
    "SystemNotification", "SystemStart", "WindowsLogon", "WindowsLogoff", "WindowsUnlock"
)
foreach ($event in $soundEvents) {
    $regPath = "HKCU:\AppEvents\Schemes\Apps\.Default\$event\.Current"
    if (Test-Path $regPath) {
        Set-ItemProperty -Path $regPath -Name "(Default)" -Value "" -Force
    }
}

# --- Uninstall common bloatware ---
Write-Host "Searching for and removing common bloatware..."
$bloatwarePatterns = @(
    "McAfee", "Norton", "WildTangent", "CyberLink", "HP Games",
    "Candy Crush", "Xerox", "Dolby", "Amazon", "TikTok",
    "Facebook", "Spotify", "Disney", "Netflix"
)

foreach ($pattern in $bloatwarePatterns) {
    Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*$pattern*" } | ForEach-Object {
        Write-Host "Uninstalling: $($_.Name)"
        $_.Uninstall() | Out-Null
    }
}

# --- Disable telemetry via registry ---
Write-Host "Disabling telemetry..."
$telemetryKeys = @(
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
)

foreach ($key in $telemetryKeys) {
    if (!(Test-Path $key)) { New-Item -Path $key -Force | Out-Null }
    Set-ItemProperty -Path $key -Name "AllowTelemetry" -Value 0 -Type DWord -Force
}

# --- Disable telemetry services ---
$telemetryServices = @("DiagTrack", "dmwappushservice")
foreach ($svc in $telemetryServices) {
    if (Get-Service $svc -ErrorAction SilentlyContinue) {
        Stop-Service $svc -Force -ErrorAction SilentlyContinue
        Set-Service $svc -StartupType Disabled
    }
}

# --- Disable telemetry tasks ---
Write-Host "Disabling telemetry scheduled tasks..."
$telemetryTasks = @(
    "\Microsoft\Windows\Application Experience\ProgramDataUpdater",
    "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator",
    "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask",
    "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip",
    "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
)
foreach ($task in $telemetryTasks) {
    schtasks /Change /TN $task /Disable 2>$null
}

# --- Disable Cortana and feedback ---
Write-Host "Disabling Cortana and user feedback..."
$searchKey = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
if (!(Test-Path $searchKey)) { New-Item -Path $searchKey -Force | Out-Null }
Set-ItemProperty -Path $searchKey -Name "AllowCortana" -Value 0 -Type DWord -Force

$feedbackKey = "HKCU:\Software\Microsoft\Siuf\Rules"
if (!(Test-Path $feedbackKey)) { New-Item -Path $feedbackKey -Force | Out-Null }
Set-ItemProperty -Path $feedbackKey -Name "NumberOfSIUFInPeriod" -Value 0 -Type DWord -Force

# --- Disable background apps (current user) ---
Write-Host "Disabling background apps..."
$bgPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"
if (!(Test-Path $bgPath)) { New-Item -Path $bgPath -Force | Out-Null }
Set-ItemProperty -Path $bgPath -Name "GlobalUserDisabled" -Value 1 -Type DWord -Force

Write-Host "`nSetup complete! Restart the system to apply all changes." -ForegroundColor Green
