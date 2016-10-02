REM ECHO Directory to Restore w/ Quotes: %1
REM ECHO Computer: %2
REM ECHO Full Path to Restore: %3
REM ECHO Date or Snapshot to Restore: %4
REM ECHO Source Server: %5
REM ECHO Source Username: %6
REM ECHO Source Password: %7

IF NOT "%~7"=="" (
	ECHO Logging into server %~5...
	NET USE \\%~5\%~2 /u:%~5\%~6 %7
) ELSE (
	ECHO Not logging into server.
)

SETLOCAL ENABLEDELAYEDEXPANSION
SET TO=%~dp1
FOR %%R IN ("%~2%~3") DO (
	IF "%~4"=="SNAPSHOT" (
		SET FROM="\\%~5\%~2\SNAPSHOT\%~p3"
	) ELSE (
		SET FROM=%%~dpR
	)
	REM ~n gets the filename and ~x gets the extension of the file
	SET FILENAME=%%~nxR
	SET CMDLINE="!FROM!" "!TO!" "!FILENAME!"
	REM Replace the escaped quotation marks with quotation marks to run on the command line
	ECHO ROBOCOPY !CMDLINE:\"="!
	ROBOCOPY !CMDLINE:\"="! /COPYALL /SL
)
ENDLOCAL