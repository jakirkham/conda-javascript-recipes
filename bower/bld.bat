REM needed to ensure 2.3.0 see https://github.com/npm/npm/issues/4080
CALL npm install -g --upgrade npm@next
CALL npm install -g flatten-packages
CALL npm install -g %PKG_NAME%@%PKG_VERSION%

CALL cd %PREFIX%
CALL npm dedupe
CALL npm shrinkwrap
CALL flatten-packages

REM Remove flatten-packages and npm so it's not accidentally packaged up
CALL npm uninstall -g flatten-packages
CALL npm uninstall -g npm

REM Exit zero because the npm uninstall, while successful, will exit with an
REM error code because it removes the batch file that's being executed
EXIT /B 0
