NET USE \\%4\%~2 /u:%4\%5 %6 >nul 2>&1
IF "%ERRORLEVEL%"=="0" (
	REM ECHO ROBOCOPY "%~1" "\\%4\%~2\SNAPSHOT\%~3" /E /XD "*Cache*" /COPYALL /PURGE /DCOPY:T /SL /XJD
	ROBOCOPY "%~1" "\\%4\%~2\SNAPSHOT\%~3" /E /XD "*Cache*" /COPYALL /PURGE /DCOPY:T /SL /XJD
	REM /XC /XN /XO /COPY:DAT
) ELSE (
	ECHO "SnapshotCopyFolder.bat: Could not connect to %4!"
)