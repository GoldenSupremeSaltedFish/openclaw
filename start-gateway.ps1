$ErrorActionPreference = "Continue"

Write-Host "🦞 Starting OpenClaw Gateway..." -ForegroundColor Cyan

# Hardcoded token as requested
$token = "secret-token"

# Ensure gateway mode is local to prevent "start blocked" error
try {
    $null = node scripts/run-node.mjs config set gateway.mode local 2>&1
}
catch {
    # Ignore errors here, just try to proceed
}

Write-Host "`n👉 Dashboard URL: http://127.0.0.1:18789/?token=$token" -ForegroundColor Green
Write-Host "👉 扩展 Options: Gateway token = $token, Port = 18792`n" -ForegroundColor Green

$env:OPENCLAW_BROWSER_CONTROL_MODULE = "../browser/server.js"

# 先启动浏览器中继（18792），否则扩展会显示 Relay not reachable
$relayJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    node scripts/run-node.mjs browser start 2>&1
}
Start-Sleep -Seconds 2

node scripts/run-node.mjs gateway run --bind loopback --port 18789 --force
