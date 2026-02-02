$env:OPENCLAW_CONFIG_PATH = "$PSScriptRoot\qwen-config.json"
node "$PSScriptRoot\openclaw.mjs" dashboard --no-open
