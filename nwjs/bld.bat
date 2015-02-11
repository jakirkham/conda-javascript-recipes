mkdir "%PREFIX%\node-webkit"
if errorlevel 1 exit 1

xcopy /E "%SRC_DIR%/*" "%PREFIX%\node-webkit\"
if errorlevel 1 exit 1

mkdir "%SCRIPTS%"
if errorlevel 1 exit 1

set bin="%SCRIPTS%\node-webkit.bat"
echo "/opt/anaconda1anaconda2anaconda3\node-webkit\nw.exe" %%* >> %bin%
