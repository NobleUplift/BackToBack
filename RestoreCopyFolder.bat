REM ECHO Directory to Restore w/ Quotes: %1
REM ECHO Computer: %2
REM ECHO Full Path to Restore: %3
REM ECHO Date or Snapshot to Restore: %4
REM ECHO Source Server: %5
REM ECHO Source Username: %6
REM ECHO Source Password: %7

IF NOT "%~7"=="" (
	ECHO Logging into server %~5...
	NET USE \\%~5\%~2 /u:%~5\%~6 %7 >nul 2>&1
) ELSE (
	ECHO Not logging into server.
)

IF "%~4"=="SNAPSHOT" (
	SET FROM="\\%~5\%~2\SNAPSHOT\%~3"
) ELSE (
	SET FROM="%~d0\%~2\%~3"
)

FOR /f "tokens=4-5 delims=. " %%i IN ('ver') DO SET VERSION=%%i.%%j
if "%version%" == "10.0" (
	ROBOCOPY %FROM% "%~1" /E /COPYALL /DCOPY:DAT /SL
) ELSE (
	ROBOCOPY %FROM% "%~1" /E /COPYALL /DCOPY:T /SL
)
REM /XC /XN /XO /COPY:DAT