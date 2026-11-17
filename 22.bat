
@echo off
chcp 65001 >nul
setlocal

title .NET Project ZIP Creator

set "SEVENZIP=C:\Program Files\7-Zip\7z.exe"
set "ZIP_NAME=Project.zip"

:: Excluded folders
set "EXCLUDE=tools Migrations bin obj .vs .git node_modules TestResults Logs"

:: Delete previous ZIP
if exist "%ZIP_NAME%" del "%ZIP_NAME%"

echo Creating project ZIP...
echo.

:: Create ZIP with exclusions
"%SEVENZIP%" a -tzip "%ZIP_NAME%" "." ^
  -xr!Migrations\ ^
  -xr!tools\ ^
  -xr!bin\ ^
  -xr!obj\ ^
  -xr!.vs\ ^
  -xr!.git\ ^
  -xr!node_modules\ ^
  -xr!TestResults\ ^
  -xr!Logs\ ^
  -mx=5
  

if errorlevel 1 (
    echo ZIP creation failed!
) else (
    echo ZIP created successfully!
)

echo.
pause
