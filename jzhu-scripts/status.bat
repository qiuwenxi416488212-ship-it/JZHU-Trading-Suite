@echo off
rem Check service status

echo === jzhu-trading Service Status ===

echo.
echo --- Docker Container ---
docker ps -a --filter "name=trading-timescaledb" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo.
echo --- Java Service Ports ---
netstat -ano | findstr :8080 >nul
if %errorlevel% equ 0 (
    echo web-service (8080):      Running
) else (
    echo web-service (8080):      Stopped
)

netstat -ano | findstr :8081 >nul
if %errorlevel% equ 0 (
    echo market-data-service (8081): Running
) else (
    echo market-data-service (8081): Stopped
)
