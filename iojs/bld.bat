move node_modules %PREFIX%\Scripts
python %RECIPE_DIR%\win_download.py
copy %PREFIX%\Scripts\iojs.exe %PREFIX\Scripts\node.exe
copy %PREFIX%\Scripts\iojs.lib %PREFIX\Scripts\node.lib
copy bin\npm.cmd %PREFIX%\Scripts
if errorlevel 1 exit 1
