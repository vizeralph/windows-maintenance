@echo off

:: Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run as Administrator.
    pause
    exit /b
)

:: Run DISM and SFC to check system integrity
DISM.exe /Online /Cleanup-image /Restorehealth
sfc /scannow

:: If no arguments are provided, check the C: drive by default
if "%~1" == "" (
    chkdsk C: /r /x
    pause
    exit /b
)

:: If arguments are provided, check each specified drive
for %%d in (%*) do (
    chkdsk "%%~d" /r /x
)

pause
