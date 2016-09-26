NET USE \\%4\%~2 /u:%4\%5 %6 >nul 2>&1
IF "%ERRORLEVEL%"=="0" (
	FOR /f "tokens=4-5 delims=. " %%i IN ('ver') DO SET VERSION=%%i.%%j
	if "%version%" == "10.0" (
		ROBOCOPY "%~1" "\\%4\%~2\SNAPSHOT\%~3" /E /XD "*Cache*" /COPYALL /PURGE /DCOPY:DAT /SL /XJD /UNICODE
	) ELSE (
		REM ECHO ROBOCOPY "%~1" "\\%4\%~2\SNAPSHOT\%~3" /E /XD "*Cache*" /COPYALL /PURGE /DCOPY:T /SL /XJD
		ROBOCOPY "%~1" "\\%4\%~2\SNAPSHOT\%~3" /E /XD "*Cache*" /COPYALL /PURGE /DCOPY:T /SL /XJD /UNICODE
		REM /XC /XN /XO /COPY:DAT
	)
) ELSE (
	ECHO "SnapshotCopyFolder.bat: Could not connect to %4!"
)