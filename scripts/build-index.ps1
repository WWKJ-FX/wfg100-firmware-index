$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$manifest = Join-Path $root "ap\manifest.json"
$gz = Join-Path $root "ap\manifest.json.gz"

if (-not (Test-Path $manifest)) {
    throw "Missing manifest: $manifest"
}

$json = Get-Content -Raw -Path $manifest | ConvertFrom-Json
if (-not $json.firmware -or $json.firmware.Count -eq 0) {
    throw "manifest.json must contain at least one firmware entry"
}

$source = [System.IO.File]::OpenRead($manifest)
try {
    $target = [System.IO.File]::Create($gz)
    try {
        $gzip = [System.IO.Compression.GZipStream]::new($target, [System.IO.Compression.CompressionLevel]::Optimal)
        try {
            $source.CopyTo($gzip)
        } finally {
            $gzip.Dispose()
        }
    } finally {
        $target.Dispose()
    }
} finally {
    $source.Dispose()
}

Write-Host "Wrote $gz"
