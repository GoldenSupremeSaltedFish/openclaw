@echo off
echo Starting OpenClaw Gateway...
echo.
echo 👉 Dashboard URL: http://127.0.0.1:18789/?token=secret-token
echo.
node scripts/run-node.mjs gateway run --bind loopback --port 18789 --force
pause
