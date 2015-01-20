mkdir %PREFIX%\Scripts
move %SRC_DIR%\iojs.exe %PREFIX%\Scripts
move %SRC_DIR%\iojs.lib %PREFIX%\Scripts
if errorlevel 1 exit 1
