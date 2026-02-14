$env:OPENCLAW_CONFIG_PATH = "$PSScriptRoot\qwen-config.json"
Write-Host "Running doctor --fix to ensure configuration is valid..."
node "$PSScriptRoot\openclaw.mjs" doctor --fix 2>$null
Write-Host "Starting OpenClaw gateway..."
node "$PSScriptRoot\openclaw.mjs" gateway --port 18789 --verbose --allow-unconfigured
