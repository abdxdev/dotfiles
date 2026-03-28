# Usage: .\Export-Registry.ps1 -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" -Path "registry\precision-touchpad.reg"

param(
    [Parameter(Mandatory)][string]$Key,
    [Parameter(Mandatory)][string]$Path
)

$outFile = if ([System.IO.Path]::IsPathRooted($Path)) {
    $Path
} else {
    Join-Path $PSScriptRoot $Path
}

New-Item -ItemType Directory -Force -Path (Split-Path $outFile) | Out-Null

reg export $Key $outFile /y

Write-Host "Saved to $outFile" -ForegroundColor Green