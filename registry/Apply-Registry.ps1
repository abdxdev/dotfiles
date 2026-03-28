# Run this on a fresh machine to apply all saved registry entries

$regDir = Join-Path $PSScriptRoot "registry"

if (-not (Test-Path $regDir)) {
    Write-Host "No registry folder found at $regDir" -ForegroundColor Red
    exit 1
}

$files = Get-ChildItem -Path $regDir -Filter "*.reg"

if ($files.Count -eq 0) {
    Write-Host "No .reg files found." -ForegroundColor Yellow
    exit 0
}

foreach ($file in $files) {
    Write-Host "Applying $($file.Name)..." -ForegroundColor Cyan
    reg import $file.FullName
}

Write-Host "`nDone. You may need to restart for changes to take effect." -ForegroundColor Green