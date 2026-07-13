@echo off

:: Check for help flag
if "%~1"=="/?" goto :ShowHelp
if "%~1"=="-h" goto :ShowHelp
if "%~1"=="--help" goto :ShowHelp

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

:ShowHelp
echo ====================================================
echo Integrity Check Utility
echo ====================================================
echo Usage: integrity-check.bat [Drive Letters...]
echo.
echo Examples:
echo    integrity-check.bat          - Scans default primary system drive.
echo    integrity-check.bat D: E:    - Scans D: and E: drives sequentially.
echo ====================================================
exit /b 0
