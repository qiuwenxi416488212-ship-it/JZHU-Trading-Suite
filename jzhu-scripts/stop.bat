@echo off
rem Stop all services

echo === Stopping jzhu-trading services ===

rem 1. Stop Java services
echo [1/2] Stopping Java services...
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :8080') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :8081') do taskkill /F /PID %%a >nul 2>&1
echo   Java services stopped

rem 2. Stop TimescaleDB
echo [2/2] Stopping TimescaleDB...
docker stop trading-timescaledb >nul 2>&1
echo   TimescaleDB stopped

echo.
echo === All services stopped ===
