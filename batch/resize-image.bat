@echo off
setlocal EnableDelayedExpansion

:: Set input and output directories
set "INPUT_DIR=C:\Images\Input"
set "OUTPUT_DIR=C:\Images\Output"

:: Set the fixed size (width x height in pixels)
set "FIXED_SIZE=800x600"

:: Create output directory if it doesn't exist
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: Check if ImageMagick is installed
where magick >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Error: ImageMagick is not installed or not found in PATH.
    echo Please install ImageMagick from https://imagemagick.org/
    pause
    exit /b 1
)

:: Process all images in the input directory
echo Resizing images to %FIXED_SIZE%...
for %%i in ("%INPUT_DIR%\*.jpg" "%INPUT_DIR%\*.png" "%INPUT_DIR%\*.bmp" "%INPUT_DIR%\*.svg" "%INPUT_DIR%\*.webp") do (
    if exist "%%i" (
        echo Processing: %%~nxi
        magick "%%i" -resize %FIXED_SIZE% "%OUTPUT_DIR%\%%~ni_resized%%~xi"
    )
)

echo Done!
pause