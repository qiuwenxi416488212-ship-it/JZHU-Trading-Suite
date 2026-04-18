@echo off
rem Start all services (no Docker required - using H2 in-memory DB)

echo === Starting jzhu-trading services ===

rem Start market-data-service (port 8081)
echo [1/2] Starting market-data-service on port 8081...
start /b cmd /c "cd market-data-service && mvn spring-boot:run -DskipTests"

rem Start web-service (port 8080)
echo [2/2] Starting web-service on port 8080...
start /b cmd /c "cd web-service && mvn spring-boot:run -DskipTests"

echo.
echo === All services started ===
echo   web-service:        http://localhost:8080
echo   market-data-service: http://localhost:8081
echo   H2 Console:          http://localhost:8081/h2-console
echo.
echo Run scripts\status.bat to check status
