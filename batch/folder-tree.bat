@echo off
echo Listing folder tree for: %CD%
echo.

:: Display the tree in the console
tree /F

:: Prompt to export to a file
set /p choice="Do you want to export this to a file? (Y/N): "
if /i "%choice%"=="Y" (
    echo Exporting folder tree to output.txt...
    tree /F > output.txt
    echo Done! Check output.txt in this directory.
) else (
    echo Okay, not exporting.
)

pause