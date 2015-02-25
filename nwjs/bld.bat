mkdir "%PREFIX%\nwjs"
if errorlevel 1 exit 1

xcopy /E .\* "%PREFIX%\nwjs\"
if errorlevel 1 exit 1

mkdir "%SCRIPTS%"
if errorlevel 1 exit 1

set bin="%SCRIPTS%\nwjs.bat"
echo "/opt/anaconda1anaconda2anaconda3\nwjs\nw.exe" %%* >> %bin%
